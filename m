Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.70])
 by mx.groups.io with SMTP id smtpd.web12.41974.1595263594498165491
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 09:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NBoD/Ajn;
 spf=pass (domain: windriver.com, ip: 40.107.243.70, mailfrom: mark.morton@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffSBSVLOCnYoNBbKt431YN2N6HD2+nyINQPfNz9nowUchPe0CcohTFk+KBG+JZF9MSR3eluwm8hjfihbVu2h74AffqAIbQMuyxZxeIzL7wz8QWn6v7rrjU0QnubqKITfKFMt6jiSJsY8KtjqjCqv+BT1JrCbgB06EGzBct1E6GVqWC6MYHjHUUOLOxiARaToJft1SRaA6c6LGmMvFSab6OdTAOCIdJmDnjAzY9+Ff7KdBe32LOLEshaN9rT/ZnnozSHgdSbUFVWHdrMdQffoIm+fjoWek2Lu+bhrtr64by57BRlyEHHwXUztksicSanxCzk+lXmJ5ju5q4kmccD8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p9/wRcssW/KUbMkivAo7N5a8eon29zQzwFomGiLNP0=;
 b=GtlAoNLJKIOkBCSMXXIyyTwew3/Pw+QCjq08p3REY8M5x8O4IWiRdpDqEOq9cnAcFRzlkD7wmFSp/qD085NfzQAmYQ9LyqysUbuvPL7v1HalUsitTPALW2rukj4H4QF/oq52HxSWmFBWaXOBRsJY0FRHZN8ygPUc/8RgMtz8agaItvdSoFhqdfK5MDO49mIWmeZ8zu3efJKDBSN5knSHQvo/LOtAfA+LZLPBISLbWV2babOiylquHKS7Uh3P8zdbriQfJ+O7YcLGV9Jo0PkQt65brTQgBAQ1gl6XxqzcRZSbGHp8ijhA//v7RBwhJcgmyGklCuiOB1aXZ1e7i0Sd3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p9/wRcssW/KUbMkivAo7N5a8eon29zQzwFomGiLNP0=;
 b=NBoD/AjnoLfQuICnLz/tIU0hOzYTrxGw+MNs/u0f/yrHbAT4T/dkqG8X++1oMhYpFO2EoaBZolOjKqZnHZwra9ac7D2XtowTWaFN/Ym9Omif8qo/wqDwybT/KAEMsx5cLGlu+WjaollSpBXwBG1Q8VPxjToDVjYl8EgRuUkAWvQ=
Received: from DM6PR11MB3676.namprd11.prod.outlook.com (2603:10b6:5:137::26)
 by DM6PR11MB2684.namprd11.prod.outlook.com (2603:10b6:5:c7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Mon, 20 Jul
 2020 16:46:32 +0000
Received: from DM6PR11MB3676.namprd11.prod.outlook.com
 ([fe80::10e7:da6c:73e4:8ea7]) by DM6PR11MB3676.namprd11.prod.outlook.com
 ([fe80::10e7:da6c:73e4:8ea7%4]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 16:46:32 +0000
From: "Mark Morton" <Mark.Morton@windriver.com>
To: Khem Raj <raj.khem@gmail.com>, Steve Sakoman <steve@sakoman.com>,
	akuster808 <akuster808@gmail.com>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-system-requirements: update supported hosts lists
Thread-Topic: [docs] [PATCH] ref-system-requirements: update supported hosts
 lists
Thread-Index: AQHWW8FlDdjPcPKKy0ezoRPpxiDa5akK0N2AgABf7YCABYEw0A==
Date: Mon, 20 Jul 2020 16:46:32 +0000
Message-ID: 
 <DM6PR11MB367693E31C80CF3706473A26E57B0@DM6PR11MB3676.namprd11.prod.outlook.com>
References: <16225C0CF546C9E0.31624@lists.yoctoproject.org>
 <776527fe-3306-c772-103d-5632b4475809@gmail.com>
 <CAOSpxdbi1dZO3ZYBA_51mJrK=Pyw6PL588TSHwn9eVwhQs=gWw@mail.gmail.com>
 <76646a4d-9e9b-64ee-6bf7-c48217990f4c@gmail.com>
In-Reply-To: <76646a4d-9e9b-64ee-6bf7-c48217990f4c@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [147.11.252.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5a653fc-fcc5-49eb-e60d-08d82ccc7581
x-ms-traffictypediagnostic: DM6PR11MB2684:
x-microsoft-antispam-prvs: 
 <DM6PR11MB268408E0B18CD4CB22E1B3D5E57B0@DM6PR11MB2684.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7P9lcWb6jtA+ixCN+G1dNolr2LHHMJgH+c5azsQiDx7zdV5nqYi66tEeV4f/m7Mne+am1XysfVoWiae6mnETvsl7DgZ06JVIU+IDh2RlbVHQ5RO1G2CV8Wjk8pbHvJ1EuVDYmca/zDKcz/B4V7eFv4+QDwYEbmObFeQdDSg5cfrU9DoTjOsh4KDeoVAdp2VcOl2GyrvDiD4tz2MxKDHaQOWVEx6LtwZ0+Qn52Zqck57pUUmx3XDc5lIHGwjklDHfKxAZ3/8mZlwjWHp0CVLfMSMcfviBNp8wJNwrX0sAy8cEAkJwrAbOfnoR5bME0BRQoylwtYiE9fLQp2eTnQ98dA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3676.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(346002)(376002)(136003)(39850400004)(4326008)(83380400001)(7696005)(66556008)(52536014)(64756008)(86362001)(76116006)(66446008)(66946007)(66476007)(2906002)(55016002)(33656002)(9686003)(478600001)(5660300002)(53546011)(6506007)(8676002)(8936002)(186003)(316002)(71200400001)(110136005)(15650500001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 NsiMwzya6Ux5BBxeAIR8IEl9pHimNngWWaYZ9e5SNNQybYGCZfFoy1CJsjsRA/u/egH19r60Tb30zx0ZwFobjAwuvJHDBDxy5nKGP5k5YIY8lwlha0+8az8ZK6W401F+ptBxEqo96a980X1LAUKOlasmbuRuqME4Qd/wQcxNo58nluz/LfmVVgoGl1PSyHC0fOcEsa4oF0KujVGA/89BjnTeYZSm7lppt470uARJb3EiycjcayUgzOeyZu3ka2jIoU4oihl6YvgT766eI82AYc8l/GmN/KGEzObuC63MF0bVIDuD360ttv6aOBk0oPCNCYsknU7Q5cjoup+FWHDJh2YhhaAgTrbsPMKHGDiUMTnnMR4pw/h3YCeuiAmEK2i3VDGY75pwFRGDx6tzMBKZSvoFp8yPfhCsgiLa88ANWSRSMoeXqoVhDLbl/KqVikpWZffvTcjRCuAlc+vzUd1nMjadiyLVHqaQZdYT2sC1mnE=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3676.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a653fc-fcc5-49eb-e60d-08d82ccc7581
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2020 16:46:32.8503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PS4kg7vmdEM3f1wo3cCWKOsN7HnzhX8i6jjqxrc+EaOgfSX91/j+mqg7QrkVVhQ4beWrZvdLTh/K+vrL1ada9DnCc7UR/gvx0OPb+LzoiuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2684
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZG9jc0BsaXN0cy55b2N0
b3Byb2plY3Qub3JnIDxkb2NzQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZg0KPiBP
ZiBLaGVtIFJhag0KPiBTZW50OiBUaHVyc2RheSwgSnVseSAxNiwgMjAyMCA5OjM5IFBNDQo+IFRv
OiBTdGV2ZSBTYWtvbWFuIDxzdGV2ZUBzYWtvbWFuLmNvbT47IGFrdXN0ZXI4MDgNCj4gPGFrdXN0
ZXI4MDhAZ21haWwuY29tPg0KPiBDYzogZG9jc0BsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IFN1
YmplY3Q6IFJlOiBbZG9jc10gW1BBVENIXSByZWYtc3lzdGVtLXJlcXVpcmVtZW50czogdXBkYXRl
IHN1cHBvcnRlZCBob3N0cw0KPiBsaXN0cw0KPiANCj4gDQo+IA0KPiBPbiA3LzE2LzIwIDM6NTUg
UE0sIFN0ZXZlIFNha29tYW4gd3JvdGU6DQo+ID4gT24gVGh1LCBKdWwgMTYsIDIwMjAgYXQgMTI6
MzUgUE0gYWt1c3RlcjgwOCA8YWt1c3RlcjgwOEBnbWFpbC5jb20+DQo+IHdyb3RlOg0KPiA+Pg0K
PiA+PiBEdW5mZWxsIG5lZWRzIHVwZGF0aW5nIHRvbyBidXQgSSBhbSBub3Qgc3VyZSBpZiB3ZSBj
YW4gcmVtb3ZlIGhvc3RzIHRoYXQNCj4gYXJlIG5vIGxvbmdlciBpbiB0aGUgQUIgbGlrZSBVYnVu
dHUgMTkuMDQgb3IgdGhlIEZlZG9yYSBvbmVzLg0KPiA+DQo+ID4gSSB3YXMganVzdCBhYm91dCB0
byBzZW5kIGEgc2ltaWxhciBwYXRjaCBmb3IgZHVuZmVsbC4NCj4gPg0KPiA+IE15IGFzc3VtcHRp
b24gaXMgdGhhdCB3ZSBkb24ndCByZW1vdmUgcHJldmlvdXNseSBzdXBwb3J0ZWQgZGlzdHJvcw0K
PiA+IGZyb20gTFRTLiAgU29tZW9uZSBjb3JyZWN0IG1lIGlmIEknbSBtaXN0YWtlbiENCj4gPg0K
PiANCj4gSSB0aGluayBldmVudHVhbGx5IHdlIGhhdmUgdG8gYWRkcmVzcyB0aGlzIHRvIHRoZSBo
b3N0IGRpc3Ryb3MgdGhhdCB3aWxsIGJlDQo+IHN1cHBvcnRlZCBpbiB0aGUgbGlmZXRpbWUgb2Yg
TFRTLCBwZXJoYXBzIHdlIHNob3VsZCBjYWxsIG91dCBmb3IgdGVzdGVkIGRpc3Ryb3MNCj4gc2Vw
YXJhdGVseQ0KDQpPbmUgb3B0aW9uIHdvdWxkIGJlIHRvIHByb3ZpZGUgYSBsaXN0IG9mICJTdXBw
b3J0ZWQgYW5kIFRlc3RlZCBIb3N0cyIgd2l0aCBhZGRpdGlvbmFsIHN1cHBvcnRpbmcgaW5mbyB0
aGF0IHN0YXRlcyB3aGF0IGlzIG5lY2Vzc2FyeSB0byBidWlsZCBZUCBvbiBhIExpbnV4IGRpc3Ry
by4gVGhlbiB3ZSBjb3VsZCBzdGF0ZSB0aGF0IGJ1Z3MgbXVzdCBiZSBkdXBsaWNhdGVkIG9uIG9u
ZSBvZiB0aGUgdGVzdGVkIGhvc3RzIGZvciBMVFMgc3VwcG9ydCAob3Igd2hhdGV2ZXIgc2ltaWxh
ciBsYW5ndWFnZSB5b3UgZmVlbCBhcHBsaWVzIGJlc3QpLiBUaGlzIGNvdWxkIGNvdmVyIGFsbCB0
aGUgcHJpb3IgInJlY29tbWVuZGVkIiBob3N0cyBhbmQgbGV0IHVzIHNpbXBsaWZ5IHRoZSBsaXN0
IGZvciBjdXJyZW50IHJlbGVhc2VzLg0KDQotTWFyaw0KDQo+IA0KPiA+IFN0ZXZlDQo+ID4+DQo+
ID4+IC0gYXJtaW4NCj4gPj4NCj4gPj4gT24gNy8xNi8yMCAzOjI3IFBNLCBha3VzdGVyIHZpYSBs
aXN0cy55b2N0b3Byb2plY3Qub3JnIHdyb3RlOg0KPiA+Pg0KPiA+PiBkcm9wIFVidW50dSAxOSwg
RmVkb3JhIDI4ICYgMjkNCj4gPj4gQWRkOiBGZWRvcmEgMzEsIDMyICwgQ2VudG9zIDggYW5kIFVi
dW50dSAyMA0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBcm1pbiBLdXN0ZXIgPGFrdXN0ZXI4
MDhAZ21haWwuY29tPg0KPiA+PiAtLS0NCj4gPj4gIGRvY3VtZW50YXRpb24vcmVmLW1hbnVhbC9y
ZWYtc3lzdGVtLXJlcXVpcmVtZW50cy54bWwgfCA3ICsrKystLS0NCj4gPj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1n
aXQgYS9kb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvcmVmLXN5c3RlbS1yZXF1aXJlbWVudHMueG1s
DQo+ID4+IGIvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3JlZi1zeXN0ZW0tcmVxdWlyZW1lbnRz
LnhtbA0KPiA+PiBpbmRleCA0M2UyMTdjNmQuLmFjOGIwMDMyZCAxMDA2NDQNCj4gPj4gLS0tIGEv
ZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3JlZi1zeXN0ZW0tcmVxdWlyZW1lbnRzLnhtbA0KPiA+
PiArKysgYi9kb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvcmVmLXN5c3RlbS1yZXF1aXJlbWVudHMu
eG1sDQo+ID4+IEBAIC05NCwxMSArOTQsMTIgQEANCj4gPj4gICAgICAgICAgICAgIDxpdGVtaXpl
ZGxpc3Q+DQo+ID4+ICAgICAgICAgICAgICAgICAgPGxpc3RpdGVtPjxwYXJhPlVidW50dSAxNi4w
NCAoTFRTKTwvcGFyYT48L2xpc3RpdGVtPg0KPiA+PiAgICAgICAgICAgICAgICAgIDxsaXN0aXRl
bT48cGFyYT5VYnVudHUgMTguMDQgKExUUyk8L3BhcmE+PC9saXN0aXRlbT4NCj4gPj4gLSAgICAg
ICAgICAgICAgICA8bGlzdGl0ZW0+PHBhcmE+VWJ1bnR1IDE5LjA0PC9wYXJhPjwvbGlzdGl0ZW0+
DQo+ID4+IC0gICAgICAgICAgICAgICAgPGxpc3RpdGVtPjxwYXJhPkZlZG9yYSAyODwvcGFyYT48
L2xpc3RpdGVtPg0KPiA+PiAtICAgICAgICAgICAgICAgIDxsaXN0aXRlbT48cGFyYT5GZWRvcmEg
Mjk8L3BhcmE+PC9saXN0aXRlbT4NCj4gPj4gKyAgICAgICAgICAgICAgICA8bGlzdGl0ZW0+PHBh
cmE+VWJ1bnR1IDIwLjA0PC9wYXJhPjwvbGlzdGl0ZW0+DQo+ID4+ICAgICAgICAgICAgICAgICAg
PGxpc3RpdGVtPjxwYXJhPkZlZG9yYSAzMDwvcGFyYT48L2xpc3RpdGVtPg0KPiA+PiArICAgICAg
ICAgICAgICAgIDxsaXN0aXRlbT48cGFyYT5GZWRvcmEgMzE8L3BhcmE+PC9saXN0aXRlbT4NCj4g
Pj4gKyAgICAgICAgICAgICAgICA8bGlzdGl0ZW0+PHBhcmE+RmVkb3JhIDMyPC9wYXJhPjwvbGlz
dGl0ZW0+DQo+ID4+ICAgICAgICAgICAgICAgICAgPGxpc3RpdGVtPjxwYXJhPkNlbnRPUyA3Lng8
L3BhcmE+PC9saXN0aXRlbT4NCj4gPj4gKyAgICAgICAgICAgICAgICA8bGlzdGl0ZW0+PHBhcmE+
Q2VudE9TIDgueDwvcGFyYT48L2xpc3RpdGVtPg0KPiA+PiAgICAgICAgICAgICAgICAgIDxsaXN0
aXRlbT48cGFyYT5EZWJpYW4gR05VL0xpbnV4IDgueCAoSmVzc2llKTwvcGFyYT48L2xpc3RpdGVt
Pg0KPiA+PiAgICAgICAgICAgICAgICAgIDxsaXN0aXRlbT48cGFyYT5EZWJpYW4gR05VL0xpbnV4
IDkueA0KPiAoU3RyZXRjaCk8L3BhcmE+PC9saXN0aXRlbT4NCj4gPj4gICAgICAgICAgICAgICAg
ICA8bGlzdGl0ZW0+PHBhcmE+RGViaWFuIEdOVS9MaW51eCAxMC54DQo+ID4+IChCdXN0ZXIpPC9w
YXJhPjwvbGlzdGl0ZW0+DQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+
DQoNCg==
