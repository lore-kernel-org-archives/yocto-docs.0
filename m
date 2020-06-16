Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.61])
 by mx.groups.io with SMTP id smtpd.web10.3075.1592345585271023419
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 15:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dy6G61vU;
 spf=pass (domain: windriver.com, ip: 40.107.237.61, mailfrom: mark.morton@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+R5+Wdbk2F7VwAOSsvPvEN5zeBmcm/yFQjN66dX6evg/HATnb2CUjRnds+ANPeiwLuNYdlXQtGYpf0p7PR9kufBwBtcbkbYbe3mpq2GXrD6Na0hYsdUz2z5UfY5YGc146KNgL5m2t6LWT5sEO5LPrhIZTssCwc0fALkW42wPPKZozRQGdA+zAS2qG3hISn/RqNzUSxAhDmXhPCRqZSV4WQOHtIzT5NSD41BUbD8/q63k2WP61RDOMCUzI66Ui0RkdHx7W4eFygkfOvJzhJWrBrqluhARypY1bGLartEhCYW9EIc2JfCq8sgi5gXI9fbILprOrUTgAwHpxysDQwoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNCPI+nrIXIEy5WD7Xwm9Lsy5RCWEo+oCaKlX3GuC/Q=;
 b=cFJl0YinUBNtSJQQdDpP9pt+IlKhuX5GdSqQfoQ6H3N4l6lBGa6wbP9lcP2iGa/UrN5mIcpBB40VpJteu3uu4YGvtuXVCjo45o0CP8vxoPBJgBwhwP+UqaM+8BI+4BqOXX4E368tC4/x3YyTYjPkJfCU/y7G5T8JM9tQb7xDmw/m00nqxBEF9GAgEfgzAf4zRDspaVxf7Ol/up5DGFBbDx9fNaZsN+DQb/RNB7NsKtuifBZgViXT8aaJmuPGDzcwBUYoS4QOZBOTK30ALl+iuUs78qNzOZQ9MSZcafcA08h5E4gZjKzpC1LEx5Rqe/lXua3BQSwrEyXAvOi3IMqg/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNCPI+nrIXIEy5WD7Xwm9Lsy5RCWEo+oCaKlX3GuC/Q=;
 b=dy6G61vUCUusbqqVJLNrKnPmCkBVSHlSNIx+iw8ayxhwpz/NeIDBcqrN3SKvZjwj2xyx+T+1Th60zxH0SVWgT/uPfz9bIL0jrRu0UIdEUcUx3PgQGMstKWrw6iUEzfatIguONwYIuyNZfEEILHrK5rrqMnA/2p2RU/MMhiTCtu0=
Received: from DM6PR11MB3676.namprd11.prod.outlook.com (2603:10b6:5:137::26)
 by DM6PR11MB3836.namprd11.prod.outlook.com (2603:10b6:5:13a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Tue, 16 Jun
 2020 22:13:03 +0000
Received: from DM6PR11MB3676.namprd11.prod.outlook.com
 ([fe80::68ea:c855:a111:f951]) by DM6PR11MB3676.namprd11.prod.outlook.com
 ([fe80::68ea:c855:a111:f951%7]) with mapi id 15.20.3088.029; Tue, 16 Jun 2020
 22:13:03 +0000
From: "Mark Morton" <Mark.Morton@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] New source files and Makefile update for Test Manual
Thread-Topic: [docs] [PATCH] New source files and Makefile update for Test
 Manual
Thread-Index: AQHWRCqavE+RAWj6/kmPLRUJz90gOajbzfFQ
Date: Tue, 16 Jun 2020 22:13:03 +0000
Message-ID: 
 <DM6PR11MB367626B3068F92C3DD31D883E59D0@DM6PR11MB3676.namprd11.prod.outlook.com>
References: <20200616211450.8079-1-mark.morton@windriver.com>
 <4279ef01cf93105bdea2e3d56e8df50db18350d2.camel@linuxfoundation.org>
In-Reply-To: 
 <4279ef01cf93105bdea2e3d56e8df50db18350d2.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [147.11.252.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11138204-1734-4277-a2b3-08d812427063
x-ms-traffictypediagnostic: DM6PR11MB3836:
x-microsoft-antispam-prvs: 
 <DM6PR11MB3836828F73F6AB1BB7F97231E59D0@DM6PR11MB3836.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04362AC73B
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vhI7G0EB2LhUH2W2PWpSBGkAhexhHASjsDI9ERK0FW+njQJTSld46DRFK4k8zq46/P4lAh51YKaZLddy834H2ZlLS8WtjoXVEbdki9akYcMQuUwjVsILzjJF7wBCHM02xXy7Q93HKPIMOqzLV/O3oX9N0zDyAaVjFNw+tyC8TDe9g0Devc+ogJPGJ522hCpCeIPNtD/pIoK6DUswNgzoe5QxrNqNvc3mYm2yJQfTOhxMZxQ0LFGMk9jGaZgMD/SSoqn/7kfjYlZC9XdE+iT4h4TLc8fK9GzoP06vly35uO2eTP9QQXUFbWeQC4llVmJ8iVpe7Jijf8k/x6+7YcWy/A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3676.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(39850400004)(366004)(396003)(136003)(6506007)(7696005)(110136005)(53546011)(316002)(76116006)(86362001)(64756008)(66446008)(66946007)(186003)(26005)(66476007)(66556008)(83380400001)(71200400001)(8936002)(52536014)(2906002)(8676002)(15650500001)(33656002)(55016002)(5660300002)(478600001)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 p9q4mWZmU+8MDye70IdhiDq10rEaGs27xzS/l2a4ZxflSKhKg59sqZK486Sv4tiNuDmeGfXshH4nM639cSAHLWPxhHAsRymFFoTr1mLnGGRCFCIzDATUzXMxe0m+IicfS+5UC73wMxPEN0tk+/qQPjnazdcXFmUkxdbJoNHXJ/l3RLVP4wdpGIkE86LYwS6dnRiO8tQ/XmCY2RY3F7JAe5Ery2N4WJ2qBtAMWljQZ+dE7GHHcn8GhzI/SLJIAJ2DheJs6BYvfNstwzdL31Co6sR12AtGgawI9JcwkvR/rxvQS0R4eAPlTF+JeX3bCIBi58MrYPWTtNCWM3ela/lf7GlnprT4Vss83aXeMpLRnM177znCYrIuJwLl1I5WoOjBriEQ8YWLuKxoZ+zJNTZMK04iUYTlrMmb8ypqZ6Dg57eLAxQrxvzozIFPpcoBmlR5nRG8+ifZjuNIURfyJ7Xiie84PlN02ltzB771qjorntk=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11138204-1734-4277-a2b3-08d812427063
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2020 22:13:03.4885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7olcAs6pw6YppbBhJaDoAEWAKA8LHBykEiqY7tg1zui6fBiX4gIcb6ypWR84wuxnIgHkDt8pYrijL/RPjfFN8i3ipePY4hcDgd8fq3/YxgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3836
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1
bmUgMTYsIDIwMjAgMzowOCBQTQ0KPiBUbzogTW9ydG9uLCBNYXJrIDxNYXJrLk1vcnRvbkB3aW5k
cml2ZXIuY29tPjsNCj4gZG9jc0BsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJl
OiBbZG9jc10gW1BBVENIXSBOZXcgc291cmNlIGZpbGVzIGFuZCBNYWtlZmlsZSB1cGRhdGUgZm9y
IFRlc3QNCj4gTWFudWFsDQo+IA0KPiBPbiBUdWUsIDIwMjAtMDYtMTYgYXQgMTQ6MTQgLTA3MDAs
IE1hcmsgTW9ydG9uIHdyb3RlOg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmsgTW9ydG9uIDxtYXJr
Lm1vcnRvbkB3aW5kcml2ZXIuY29tPg0KPiA+IC0tLQ0KPiA+ICBkb2N1bWVudGF0aW9uL01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gPiAgLi4uL3Rlc3QtbWFudWFs
L2ZpZ3VyZXMvYWItdGVzdC1jbHVzdGVyLnBuZyAgIHwgQmluIDAgLT4gMTg2ODQgYnl0ZXMNCj4g
PiAgLi4uL3Rlc3QtbWFudWFsL2ZpZ3VyZXMvdGVzdC1tYW51YWwtdGl0bGUucG5nIHwgQmluIDAg
LT4gMTUzODIgYnl0ZXMNCj4gPiAuLi4vdGVzdC1tYW51YWwvdGVzdC1tYW51YWwtY3VzdG9taXph
dGlvbi54c2wgfCAgMjcgKw0KPiA+ICAuLi4vdGVzdC1tYW51YWwvdGVzdC1tYW51YWwtaW50cm8u
eG1sICAgICAgICAgfCA2MzQgKysrKysrKysrKysNCj4gPiAgLi4uL3Rlc3QtbWFudWFsL3Rlc3Qt
bWFudWFsLXN0eWxlLmNzcyAgICAgICAgIHwgOTg5ICsrKysrKysrKysrKysrKysrKw0KPiA+ICAu
Li4vdGVzdC1tYW51YWwvdGVzdC1tYW51YWwtdGVzdC1wcm9jZXNzLnhtbCAgfCAxMDkgKysNCj4g
PiAgLi4uL3Rlc3QtbWFudWFsLXVuZGVyc3RhbmQtYXV0b2J1aWxkZXIueG1sICAgIHwgMzEyICsr
KysrKw0KPiA+ICBkb2N1bWVudGF0aW9uL3Rlc3QtbWFudWFsL3Rlc3QtbWFudWFsLnhtbCAgICAg
fCAxMDMgKysNCj4gPiAgOSBmaWxlcyBjaGFuZ2VkLCAyMTc1IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkgIGNyZWF0ZSBtb2RlDQo+ID4gMTAwNjQ0IGRvY3VtZW50YXRpb24vdGVzdC1tYW51
YWwvZmlndXJlcy9hYi10ZXN0LWNsdXN0ZXIucG5nDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0K
PiA+IGRvY3VtZW50YXRpb24vdGVzdC1tYW51YWwvZmlndXJlcy90ZXN0LW1hbnVhbC10aXRsZS5w
bmcNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gZG9jdW1lbnRhdGlvbi90ZXN0LW1hbnVh
bC90ZXN0LW1hbnVhbC1jdXN0b21pemF0aW9uLnhzbA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZG9jdW1lbnRhdGlvbi90ZXN0LW1hbnVhbC90ZXN0LW1hbnVhbC1pbnRyby54bWwNCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRvY3VtZW50YXRpb24vdGVzdC1tYW51YWwvdGVzdC1tYW51YWwtc3R5
bGUuY3NzDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGRvY3VtZW50YXRpb24vdGVzdC1t
YW51YWwvdGVzdC1tYW51YWwtdGVzdC1wcm9jZXNzLnhtbA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQNCj4gPiBkb2N1bWVudGF0aW9uL3Rlc3QtbWFudWFsL3Rlc3QtbWFudWFsLXVuZGVyc3RhbmQt
YXV0b2J1aWxkZXIueG1sDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDc1NSBkb2N1bWVudGF0aW9uL3Rl
c3QtbWFudWFsL3Rlc3QtbWFudWFsLnhtbA0KPiANCj4gVGhhbmtzIE1hcmssIGl0cyBncmVhdCB0
byBoYXZlIHRoaXMgaGVyZSENCj4gDQo+IEkndmUgcXVldWVkIGl0IGluIG1hc3Rlci1uZXh0LiBU
aGUgb25seSBpc3N1ZSB3YXMgdGhlIHBhdGNoIGRpZG4ndCBhcHBseQ0KPiBjbGVhbmx5LCB0aGUg
TWFrZWZpbGUgY2hhbmdlIHdhcyB0cnlpbmcgdG8gY2hhbmdlIHNvbWV0aGluZyB3aGljaCB3YXNu
J3QNCj4gdGhlcmUuIEkndmUgbWFkZSBpdCBkbyB3aGF0IEkgdGhpbmsgaXQgd2FzIG1lYW50IHRv
IGJ1dCB5b3UnZCBiZXR0ZXIgY2hlY2sgSQ0KPiBoYXZlIHRoYXQgcGFydCBvZiB0aGUgY2hhbmdl
IGNvcnJlY3QuDQoNCkhpIFJpY2hhcmQgLSBJIGp1c3QgY2hlY2tlZCB0aGUgZmlsZSBhbmQgdGVz
dGVkIHRoZSBvdXRwdXQuIFdlIGFyZSBnb29kIHRvIGdvLiANCg0KVGhhbmtzLA0KLU1hcmsNCg0K
PiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiANCg0K
