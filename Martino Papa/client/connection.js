const ws = new WebSocket('ws://localhost:8080/');
var username = "user";
var password = "user"
var login;
var answersType;

const answersTypes = {
    "loadCollegi": 0,
    "deputati": 1,
    "senatori": 2,
    "legge": 3,
    "query": 4
}

const msgType = {
    "login": 0,
    "query": 1
}

ws.onopen = function () {
    console.log('Connected to ' + ws.url);
    SendMessage("", msgType.login);
};

ws.onmessage = function (e) {
    msg = JSON.parse(e.data);
    switch (msg.type) {
        case msgType.query:
            var data = JSON.parse(msg.data);
            switch (answersType) {
                case answersTypes.loadCollegi:
                    loadCollegi(data);
                    loadLegislature();
                    break;
                case answersTypes.deputati:
                    StampaDeputati(data)
                    break;
                case answersTypes.senatori:
                    StampaSenatori(data)
                    break;
                case answersTypes.legge:
                    StampaLeggi(data)
                    break;
                case answersTypes.query:
                    if(msg.result){
                        StampaQuery(data)
                    }
                    else {
                        alert(data.sqlMessage);
                        console.warn(data.sqlMessage);
                    }
                    break;
            }

            break;
        case msgType.login:
            if (msg.result) {
                login = true;
                console.log("logged in!");
                Query("select codice_collegio, nome from collegio_elettorale;");
                answersType = answersTypes.loadCollegi;
            }
            else {
                login = false;
                console.log("login failed!")
            }
            break;
    }
};

function loadLegislature() {
    const selection = document.getElementById("legislature");
    const selectionSen = document.getElementById("legislatureSen");
    const selectionLeg = document.getElementById("legislatureLeg");
    selectionSen.innerHTML = `<option value="">Legislature</option>`;
    selection.innerHTML = `<option value="">Legislature</option>`;
    selectionLeg.innerHTML = `<option value="">Legislature</option>`;
    for (let i = 18; i > 13; i--) {
        selection.innerHTML += `<option>${i}</option>`;
        selectionSen.innerHTML += `<option>${i}</option>`;
        selectionLeg.innerHTML += `<option>${i}</option>`;
    }
}

function loadCollegi(data) {
    const dep = document.getElementById("collegiDeputati");
    dep.innerHTML = `<option value="">Collegi</option>`;
    for (let i = 0; i < 27; i++) {
        dep.innerHTML += `<option>${data[i].nome}</option>`;
    }
    const sen = document.getElementById("collegiSen");
    sen.innerHTML = `<option value="">Collegi</option>`;
    for (let i = 27; i < 47; i++) {
        sen.innerHTML += `<option>${data[i].nome}</option>`;
    }
}

function SendMessage(query, type) {
    var msg = {
        "type": type,
        "username": username,
        "password": password,
        "query": query
    }
    ws.send(JSON.stringify(msg));
}

function Query(query) {
    if (login) {
        SendMessage(query, msgType.query);
    }
    else {
        console.log("you are not logged in");
    }
}

function trovaSenatore() {
    var legislatura = document.getElementById("legislatureSen").value;
    var collegio = document.getElementById("collegiSen").value;
    if (collegio == "") {
        if (legislatura == "") {
            Query("select * from senatori");
        }
        else {
            Query(`select * from senatori where legislatura = ${legislatura}`);
        }
    }
    else {
        if (legislatura == "") {
            Query(`select * from senatori where collegio = "${collegio}"`);
        }
        else {
            Query(`select * from senatori where legislatura = ${legislatura} AND collegio = "${collegio}"`);
        }
    }
    answersType = answersTypes.senatori;
}

function trovaLegge() {
    var legislatura = document.getElementById("legislatureLeg").value;
    if (legislatura == "") {
        Query(`select * from DettagliLegge`);
    }
    else {
        Query(`select * from DettagliLegge where legislatura_emanante = ${legislatura}`);
    }
    answersType = answersTypes.legge;
}

function freeQuery() {
    var query = document.getElementById("querytxt").value;
    Query(query);
    answersType = answersTypes.query;
}

function trovaDeputato() {
    var legislatura = document.getElementById("legislature").value;
    var collegio = document.getElementById("collegiDeputati").value;
    if (collegio == "") {
        if (legislatura == "") {
            Query("select * from deputati");
        }
        else {
            Query(`select * from deputati where legislatura = ${legislatura}`);
        }
    }
    else {
        if (legislatura == "") {
            Query(`select * from deputati where collegio = "${collegio}"`);
        }
        else {
            Query(`select * from deputati where legislatura = ${legislatura} AND collegio = "${collegio}"`);
        }
    }

    answersType = answersTypes.deputati;
}


function StampaDeputati(data) {
    const container = document.getElementById("deputatiContainer");
    container.innerHTML = ``;
    for (let e of data) {
        container.innerHTML +=
            `<tr>
        <td>${e.nome}</td>
        <td>${e.cognome}</td>
        <td>${e.partito}</td>
        <td>${e.collegio}</td>
        <td>${e.legislatura}</td>
        </tr>`;
    }
}

function StampaSenatori(data) {
    const container = document.getElementById("senatoriContainer");
    container.innerHTML = ``;
    for (let e of data) {
        container.innerHTML +=
            `<tr>
        <td>${e.nome}</td>
        <td>${e.cognome}</td>
        <td>${e.partito}</td>
        <td>${e.collegio}</td>
        <td>${e.legislatura}</td>
        </tr>`;
    }
}

function StampaLeggi(data) {
    const container = document.getElementById("leggiContainer");
    container.innerHTML = ``;
    for (let e of data) {
        container.innerHTML +=
            `<tr>
        <td>${e.codice_legge}</td>
        <td>${e.titolo}</td>
        <td>${e.approvazione_camera.slice(0, 10)}</td>
        <td>${e.approvazione_senato.slice(0, 10)}</td>
        <td>${e.legislatura_emanante}</td>
        </tr>`;
    }

}

function StampaQuery(data){
    const intestazioneTabella = document.getElementById("intestazioneQuery");
    const container = document.getElementById("containerQuery");
    container.innerHTML = "";
    intestazioneTabella.innerHTML = ``;
    var intestazione = Object.keys(data[0]);
    for(let e of intestazione){
        intestazioneTabella.innerHTML += `<th>${e}</th>`;
    }
    var stringa;
    for(let row of data){
        stringa = `<tr>`;
        for(let i in row){
            stringa += `<td>${row[i]}</td>`;
        }
        stringa +=`</tr>`;
        container.innerHTML += stringa;
    }
}
