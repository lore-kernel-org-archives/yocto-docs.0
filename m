Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.66])
 by mx.groups.io with SMTP id smtpd.web12.847.1590093720698931960
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2020 13:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Kwkkma2m;
 spf=pass (domain: windriver.com, ip: 40.107.243.66, mailfrom: mark.morton@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHm+fLix9+IYINDt4jtouN1fkHrie1cROqkqefAeUUDhxh7AZJZJTaaS+TKgluLN36T1XueMqQSa7P8l65C63h7hRSswtM0sEB2WXxv7Rgwssbvup4mLXjTZzp1Xcxs459J74h6qJhfmQ7wLwO4nyIXUjvUsGgBBU3bBZyqAH25Ch3nl21fAtPqOI3rkiW3uYlK7ox9oCJpTN/rhmxROjLPKucEiJNT+z5bf7wU8vVp9hiEMzTbLCVVzFs2MitfJ3uWc7Yi45PltffQ0pR2URQi2MHDt/AQsIwsaqGhplx+XkrdHpAWN6f9ysKnMEvSghhD43fPcwnPW82Y8hgMw7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QmUt3FDJ8SkyNH0Z+ereNzwxvZeLTMvv/SVwRuIoX8=;
 b=hL8y8ZKZX5hCsKaDGEOYHf7DqIwcqoTZqOt6yvMvRPoBELATuOzPmU8xxvI4uHYIhphBNAU3YbHjAGMy5ItFNwf/x+LgbOHgrjeu3eMlfsbe8tUszUuA0xOHCxzEccp1SdhZNz3VlbFa+hSuZRo/+wGHcTKsFD4Q499VJUXXcT1HuFI2yoTwVF5eo1Cb6iQD3e99LLapSfsOq6nBG9pbAODYUAZAZl3Z6ENXQ87v1wWJbo13aqEfcnxjektDMVLoW5KQynaV7dhIIfKpDAJAqgNt2KfpkvCc5pyDagbWTlZuB5b5h+ee8Lftcd9yjHrpfa85ZMG7Z2p0APCsqKcSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QmUt3FDJ8SkyNH0Z+ereNzwxvZeLTMvv/SVwRuIoX8=;
 b=Kwkkma2mbJ6g2O+KnvPPymg13e5cQYse4EnkW/wORyRA13fLYqzkLsGKFTfue2xwWNRCg9c5FFFM28TbVMg5tO0JYdg3px982Uod1HYNZUFivxnejy8j1oh4Nq8RopO3gaqJLq+aK9xsEKgBowZUaq9OW27jD5fQBYOtychk1Tc=
Received: from DM6PR11MB3676.namprd11.prod.outlook.com (2603:10b6:5:137::26)
 by DM6PR11MB4755.namprd11.prod.outlook.com (2603:10b6:5:2ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Thu, 21 May
 2020 20:41:58 +0000
Received: from DM6PR11MB3676.namprd11.prod.outlook.com
 ([fe80::68ea:c855:a111:f951]) by DM6PR11MB3676.namprd11.prod.outlook.com
 ([fe80::68ea:c855:a111:f951%7]) with mapi id 15.20.3021.020; Thu, 21 May 2020
 20:41:58 +0000
From: "Mark Morton" <Mark.Morton@windriver.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] Possible changes to the project docs
Thread-Topic: [docs] Possible changes to the project docs
Thread-Index: 
 AQHWEw9iHOKP95+s6kCTpN1r5LSQF6h6TNeAgAGrlwCAAAKUgIAADOaAgAAChICAAALegIA3K4DQ
Date: Thu, 21 May 2020 20:41:57 +0000
Message-ID: 
 <DM6PR11MB367614B1115E7BA06017F79FE5B70@DM6PR11MB3676.namprd11.prod.outlook.com>
References: 
 <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org>
 <20200415152105.GA11838@linux-uys3>
 <alpine.LFD.2.21.2004161247290.35575@localhost.localdomain>
 <CAP71WjxP3VE8YQo5sS43rOxWzhqhz40Zd2gkX2AGVYxNEdD8oQ@mail.gmail.com>
 <alpine.LFD.2.21.2004161345410.53638@localhost.localdomain>
 <CAP71WjwPdXB36essZJ62sogNq+Qpf1wx3cEGpjKQ3MTDmgFY7w@mail.gmail.com>
 <alpine.LFD.2.21.2004161404130.54465@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2004161404130.54465@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [147.11.252.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4dc17ec-75df-4327-657a-08d7fdc7680f
x-ms-traffictypediagnostic: DM6PR11MB4755:
x-microsoft-antispam-prvs: 
 <DM6PR11MB475555CD4E7FE234844AA27EE5B70@DM6PR11MB4755.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 041032FF37
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7sUG/OeUVY/FLbRMh3pEcrVIYRsrJ4ngeK+qzehCY7YcTTzT3q4EakX+PFhFtfeFGoeQxnuhM/ASBoUsqkgCqdUrQxH4XOEAt9Cl4xza3MarP0I9axslsKrhygeUClHjTX7Qzh2yiF/tLLOOySNiVGYZG310rWeGww5JDHp1j+v12GAUb27s55CSkUWEHn3e332cmIojKQkY/mKp8gipTfglm4xv/lErKNvi0jHeUUfhrDhh4ZJHClL91hUcXK/5yeGPg1Ouy+jd57Ly8dZzcBJ6PUFoni+d9fzrCgu9zsWqI++FZhf89qa7mz+Ud89FjKcFEjp500LmR88Y3npUM6YLTjLqvX63Yc0IrlOFseW0lwz/4PmmiyZk1CjiBe/6L4fy36v/bmgXB9/k7R5JYg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3676.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(366004)(136003)(396003)(346002)(376002)(66446008)(53546011)(186003)(71200400001)(478600001)(966005)(316002)(7696005)(26005)(52536014)(5660300002)(86362001)(8676002)(8936002)(9686003)(6506007)(2906002)(6916009)(33656002)(66946007)(64756008)(66556008)(76116006)(66476007)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 Zcxb0b4ypFOjt0oekqcaU9qd/jxni5AqAucc0NQN8B1qwCIZwiOLSadFCEciObEMd/l+9XQwJt31st9vDqX28G72eJC+BP1cUDd9GSnB2yQcDza0H2QfZX1eSyynjDy34lBiTm0oUxbdbrJgfjamSCoLL5bYhGHHxYJrF4BlhT98/yl/CeTwZJO62xIS84+98G51A32lqe8X2V+/PMci8dl/Pn4aUDc3BGWfYNUUTFwYXk3tP2nceIRktVhFUOj8GYa3F4KxDrQf7t/WWCWkL26/vrCTQzlbbctIg7TYKXt6oLgN05ahPne8F4LU4jIflbFsyXf6fRpHdYzGCq+IVzJyNZBptCcGppMXkKooX5lSdqdtxaiD2xtydlYiuTEpwViOf6Q13eYzPbNHaHelnyyoJYjYLxmz/hlVW4AdZRD+9y2MNj+/z0kdqUR8tWk1C1trRJDyau3te/LmlXxjYexkeori2bmj4UbloKPFW8o=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4dc17ec-75df-4327-657a-08d7fdc7680f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2020 20:41:58.0694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +IHbaZRDHfOB19c7iItZccgB85YFTg/QKxFgTyOGQdpYrUB5v6ez6WPIRsu7ca7yYJKPn76bSjkXCF4rRG4F7SnuJ6N9c/x6OSYtMrfwMcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4755
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGk6DQoNCkknZCBsaWtlIHRvIGFjdHVhbGx5IHN0YXJ0IHBsYW5uaW5nIHRoaXMgY29udmVyc2lv
biB0byBTcGhpbnguIFNvIGZhciBteXNlbGYsIFJvYiBELiwgTmljb2xhcywgYW5kIFRpbSBPLiBh
cmUgYWxsIGludGVyZXN0ZWQgaW4gaGVscGluZyBvdXQuDQoNCkknZCBsaWtlIHRvIGhhdmUgYSBa
b29tIG1lZXRpbmcgb3Igc29tZXRoaW5nIHNpbWlsYXIgdG8gZ2V0IHN0YXJ0ZWQgb24gd2hlcmUg
dG8gZ28gZnJvbSBOaWNvJ3MgcHJvb2Ygb2YgY29uY2VwdC4gUGxlYXNlIGxldCBtZSBrbm93IGlm
IHlvdSB3YW50IHRvIGF0dGVuZCAtIEknbSB0aGlua2luZyBzb21ldGltZSBlYXJseSBuZXh0IHdl
ZWsuDQoNClRoYW5rcywNCi1NYXJrIE0uIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8ZG9jc0BsaXN0cy55b2N0b3By
b2plY3Qub3JnPiBPbiBCZWhhbGYNCj4gT2YgUm9iZXJ0IFAuIEouIERheQ0KPiBTZW50OiBUaHVy
c2RheSwgQXByaWwgMTYsIDIwMjAgMTE6MDYgQU0NCj4gVG86IGRvY3NAbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW2RvY3NdIFBvc3NpYmxlIGNoYW5nZXMgdG8gdGhlIHBy
b2plY3QgZG9jcw0KPiANCj4gT24gVGh1LCAxNiBBcHIgMjAyMCwgTmljb2xhcyBEZWNoZXNuZSB3
cm90ZToNCj4gDQo+ID4NCj4gPg0KPiA+IE9uIFRodSwgQXByIDE2LCAyMDIwIGF0IDc6NDYgUE0g
Um9iZXJ0IFAuIEouIERheSA8cnBqZGF5QGNyYXNoY291cnNlLmNhPg0KPiB3cm90ZToNCj4gPiAg
ICAgICBPbiBUaHUsIDE2IEFwciAyMDIwLCBOaWNvbGFzIERlY2hlc25lIHdyb3RlOg0KPiA+DQo+
ID4gICAgICAgPiBBcyBJIHB1dCBpbiBvbmUgb2YgbXkgZW1haWxzIGJlZm9yZSB5b3UgY2FuIHVz
ZSBteSBkZXYgYnJhbmNoOg0KPiA+ICAgICAgID4NCj4gPiAgICAgICA+IGh0dHBzOi8vZ2l0Lmxp
bmFyby5vcmcvcGVvcGxlL25pY29sYXMuZGVjaGVzbmUvcG9reS5naXQvbG9nLz9oPXNwaGlueA0K
PiA+ICAgICAgID4NCj4gPiAgICAgICA+IHRoZW4gaXQncyBqdXN0DQo+ID4gICAgICAgPiBwaXAz
IGluc3RhbGwgc3BoaW54DQo+ID4gICAgICAgPiAjIHRvIHVzZSB0aGUgbm9uIGRlZmF1bHQgdGhl
bWUNCj4gPiAgICAgICA+IHBpcDMgaW5zdGFsbCBzcGhpbnhfcnRkX3RoZW1lDQo+ID4gICAgICAg
Pg0KPiA+ICAgICAgID4gY2QgZG9jdW1lbnRhdGlvbiBtYWtlIGh0bWwNCj4gPiAgICAgICA+DQo+
ID4gICAgICAgPiBhbmQgaXQgc2hvdWxkIGdlbmVyYXRlIGV4YWN0bHkgdGhhdCBvbiB5b3VyIGxv
Y2FsIGZvbGRlcg0KPiA+ICAgICAgID4gaHR0cHM6Ly9wZW9wbGUubGluYXJvLm9yZy9+bmljb2xh
cy5kZWNoZXNuZS95cC1kb2NzLw0KPiA+ICAgICAgID4NCj4gPiAgICAgICA+IEkgYW0gaGFwcHkg
dG8gdGFrZSBwYXRjaGVzIGluIHRoaXMgYnJhbmNoIChvciBjcmVhdGUvbWFpbnRhaW4gYQ0KPiA+
ICAgICAgID4gY29udHJpYiBicmFuY2ggaWYgbW9yZSBmb2xrcyB3YW50IHRvIHBsYXkvZXhwZXJp
bWVudCBhbmQgc2VuZA0KPiA+ICAgICAgID4gcGF0Y2hlcykuDQo+ID4NCj4gPiAgICAgICDCoCBk
ZWZpbml0ZWx5IG5lZWQgc29tZSBtZWNoYW5pc20gdG8gaGFuZGxlIGRvY2Jvb2sgZW50aXRpZXMg
YW5kIGJhc2ljDQo+ID4gICAgICAgdGFncyBsaWtlIDxmaWxlbmFtZT4gLi4uIGknbSBzdGlsbCBw
b3Jpbmcgb3ZlciBwYW5kb2MsIGNhbiBpdCBiZQ0KPiA+ICAgICAgIGNvbmZpZ3VyZWQgdG8gZGVh
bCB3aXRoIHRoYXQ/DQo+ID4NCj4gPiAgICAgICDCoCB3aWxsIGdvIHJlYWQgbW9yZSAuLi4NCj4g
Pg0KPiA+DQo+ID4gSXQgZG9lcyAnbW9zdCBvZiB0aGUgdGltZScuIFNlZToNCj4gPiBodHRwczov
L3Blb3BsZS5saW5hcm8ub3JnL35uaWNvbGFzLmRlY2hlc25lL3lwLWRvY3MvYnNwLWd1aWRlL2Jz
cC54bWwuDQo+ID4gaHRtbCNic3AtbGF5ZXJzDQo+ID4NCj4gPiB3aGVyZSB0aGUgZG9jYm9vayBz
b3VyY2UgaXM6DQo+ID4gwqAgwqAgwqDCoCBFYWNoIHJlcG9zaXRvcnkgaXMgYSBCU1AgbGF5ZXIg
c3VwcG9ydGVkIGJ5IHRoZSBZb2N0byBQcm9qZWN0DQo+ID4NCj4gPg0KPiA+IMKgIMKgIMKgIMKg
IChlLmcuIDxmaWxlbmFtZT5tZXRhLXJhc3BiZXJyeXBpPC9maWxlbmFtZT4gYW5kDQo+ID4NCj4g
Pg0KPiA+IMKgIMKgIMKgIMKgIDxmaWxlbmFtZT5tZXRhLWludGVsPC9maWxlbmFtZT4pLg0KPiA+
DQo+ID4NCj4gPiDCoEkgYW0gbm90IHN1cmUgaWYgaXQgYWx3YXlzIGRvZXMgdGhlICpyaWdodCog
dGhpbmcgdGhvdWdoLi4gYW5kIEkgaGF2ZQ0KPiA+IHNlZW4gb2NjdXJyZW5jZXMgd2hlcmUgaXQg
ZmFpbGVkLiBJIGFtIHdvbmRlcmluZyBpZiB3ZSBzaG91bGQgJ2ZpeCcNCj4gPiBwYW5kb2MgLCBv
ciBqdXN0IHNwZW5kIHNvbWUgdGltZSBmaXhpbmcgdGhlIG91dHB1dCBvZiBwYW5kb2MuDQo+ID4g
SSBkb24ndCB0aGluayB3ZSB3aWxsIGF2b2lkIHJlYWRpbmcvY2hlY2tpbmcgZWFjaCBtYW51YWws
IGFueXdheXMuLg0KPiA+IEkgd2FzIHRoaW5raW5nIHdlIGNvdWxkIHVzZSBwYW5kb2MgZm9yIDgw
JSBvZiB0aGUgd29yaywgc29tZSByZWdleCBmb3INCj4gPiAxNSUgYW5kIHRoZW4gbWFudWFsbHkg
ZmluaXNoIHRoZSB3b3JrLi4gaXQgbWlnaHQgYmUgYSBiaXQgb3B0aW1pc3RpYw0KPiA+IDspDQo+
IA0KPiAgIGludGVyZXN0aW5nIC4uLiBpZiB5b3UgZ28gdG8gdGhlIHRvcC1sZXZlbCBwYWdlOg0K
PiANCj4gaHR0cHM6Ly9wZW9wbGUubGluYXJvLm9yZy9+bmljb2xhcy5kZWNoZXNuZS95cC1kb2Nz
L2JzcC1ndWlkZS9ic3AtDQo+IGd1aWRlLnhtbC5odG1sDQo+IA0KPiB0aGUgPGZpbGVuYW1lPiB0
YWcgaW4gdGhlIHRoaXJkIG5vdGUgaXMgKm5vdCogbWlncmF0ZWQgb3ZlciwgeW91IGNhbiBzdGls
bCBzZWUNCj4gdGhlIHRhZy4gaSBzdXNwZWN0IHRoZXJlIHdpbGwgYmUgcGxlbnR5IG9mIHR3ZWFr
aW5nLCBidXQgaSdtIHN0aWxsIHRvdGFsbHkgb24tYm9hcmQNCj4gd2l0aCB0aGlzLCBhbmQgYW0g
d2lsbGluZyB0byBjb250cmlidXRlLg0KPiANCj4gcmRheQ0K
