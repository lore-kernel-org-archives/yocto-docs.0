Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.49])
 by mx.groups.io with SMTP id smtpd.web12.887.1593028469452403502
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 12:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OE1Z9xXD;
 spf=pass (domain: windriver.com, ip: 40.107.220.49, mailfrom: mark.morton@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdFue5OB7lUk2n5GFddtiVRDaBGNxQyRWlXiPiN0fpQDZFbu4+uTyLXdmQZWMozPt1YXthpW/oe13zDrJgFYRatWe9UqSpTR7+2AEfgJXvyhlMTwQZS0ghlZi6XWhC66t3anoz0CxvRXwwzg94D9sPuG2E9Ldmkj3y4EC5mDQs2Mizon6GKNJ+hZx1mnhsvon1LvBFBEYChdMO9vh7ST8+F17M5nT7OFUHs1IZukRFkfhgrjBSD1n1VPsOtFgIkuzO2LX/qsngLmTb4ViN8vQB5iDf3oRtPpClM5qFk/6r+uk1xENSaZHNkFQGJUICrn54/SWwB8vP2LmsVt06yKdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGkg3YgSv3FZFA232cxJ3lbjLEUrH4VHaWB7MtDH0gc=;
 b=VESU9/MTbodvvYca5BFXf2XvlfH5HmrQPhCx4CNpjpkYTRG9qvozFIeyhHsjmbjGSDVPn2Wu7Mb2vO/jTPl7bA/Ca5hCSyJIEV+m+A1dr4hLI9X4AadufV0KUSwDs1+74fXfzNBKf/jmdVPYBiXaEC22ArnjjKVB0wzifMUkMIyigfgR3sPZGiBBtgFbUrPotBL3QO/GkOKbl/kHJklFYatrBATyBmivSFVr3EtRziUbnTeZWJtVF6hWlrV+bha3MnbWxhyk6ZcgIOzAcTuQ+u56jcYvsTcn4+4WtexnpO4/swvdUHr2WduUxCmIy7Qhlz6VeaAHLdZIrkAg9mD1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGkg3YgSv3FZFA232cxJ3lbjLEUrH4VHaWB7MtDH0gc=;
 b=OE1Z9xXD0as4R/wD0rDS+0Luql9FWMjSlEC84NEj+XSnVgjim3hINt05yLfTofNzMq0+G+i/jRPk5SSnwIKB7OAUR0xv89ecqDWXMthu6sZEsVRq//efkF0SO5d9+3+gbx60/r/krj5n6/HZgup44VMgI6X0oo30DMgTPmhekz4=
Received: from DM6PR11MB3676.namprd11.prod.outlook.com (2603:10b6:5:137::26)
 by DM6PR11MB3753.namprd11.prod.outlook.com (2603:10b6:5:141::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Wed, 24 Jun
 2020 19:54:28 +0000
Received: from DM6PR11MB3676.namprd11.prod.outlook.com
 ([fe80::68ea:c855:a111:f951]) by DM6PR11MB3676.namprd11.prod.outlook.com
 ([fe80::68ea:c855:a111:f951%7]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 19:54:27 +0000
From: "Mark Morton" <Mark.Morton@windriver.com>
To: Trevor Woerner <twoerner@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] New source files and Makefile update for Test Manual
Thread-Topic: [docs] [PATCH] New source files and Makefile update for Test
 Manual
Thread-Index: AQHWRCqavE+RAWj6/kmPLRUJz90gOajbzfFQgAxnCICAAAA/AIAAAG/Q
Date: Wed, 24 Jun 2020 19:54:27 +0000
Message-ID: 
 <DM6PR11MB3676665C903900BF80D5125DE5950@DM6PR11MB3676.namprd11.prod.outlook.com>
References: <20200616211450.8079-1-mark.morton@windriver.com>
 <4279ef01cf93105bdea2e3d56e8df50db18350d2.camel@linuxfoundation.org>
 <DM6PR11MB367626B3068F92C3DD31D883E59D0@DM6PR11MB3676.namprd11.prod.outlook.com>
 <CAHUNapR1azgOund7LtARa-N8mAzm-5H7fnv2==gfNS2yGagq8w@mail.gmail.com>
 <CAHUNapTPp1pnArEserQKzej4chvOnmf21rwcXu_tn-PrfpmC4Q@mail.gmail.com>
In-Reply-To: 
 <CAHUNapTPp1pnArEserQKzej4chvOnmf21rwcXu_tn-PrfpmC4Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [147.11.252.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 291ddb20-4f73-4754-17fd-08d818786730
x-ms-traffictypediagnostic: DM6PR11MB3753:
x-microsoft-antispam-prvs: 
 <DM6PR11MB375322EFE6F33D0F90C0E1A1E5950@DM6PR11MB3753.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GNZbRWkdR+YhZi/bWYACqsPI0TJ8q10eis92Ss08sRanDOURo97HuDeohMqR7YOs/mfVXaCQ78T8x28cAhcgChs9s2lXx6BdiEZ4TWiD+LmNniXPwFcA/FGC2182QvbMCwwjXGioC8g9/CospUhAcjnnmgC368y2Cwc/YYc7h74eH28S4QdqBiVZY+o2Qgr66i1FNVa+/YCKvVKLGTBqJlOXB65r2MkHqLIl+fiQpmF5veCWnySqD+xWgDHWPWXCROlwFA5pYXWQ56oFyVIQ7lP2Gbr+gCtZPgT0p9jB5nYot9Leo/hXkgtvQ+VRwHWAvIGk+T26IxZxerlyCh0Eqw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3676.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(396003)(366004)(39850400004)(346002)(316002)(186003)(86362001)(26005)(53546011)(52536014)(8936002)(15650500001)(8676002)(6506007)(7696005)(54906003)(76116006)(66946007)(66476007)(66446008)(478600001)(64756008)(2906002)(83380400001)(5660300002)(66556008)(9686003)(6916009)(71200400001)(33656002)(55016002)(4744005)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 +lM7EG17+ACxSYzoRolZo4ZXVpFVqze5UE3E5Mgbe6fkvgf8OdOA2gEzDAU1KsejJBKo9KUvS2JRuEkhinjdtaZyRwOoNSTn/AbBSVRxCN65cxHBc9017X936QXwjXS4nR1db1ZgCoVAKHalT0Qk54a6bLdswba47WL2twNDqgussxQm8Tk/c8VtGHJKxmSVttlbC2blcV/W67Kogs7gzFZKmuzi//Y9b+YoO5DDKIsANpS9ZHBaIm2oJ5jUO22vADkOyxBW4eWLAOmrY6QeArxdh/QH4sjR8RZKs1/dtFgZBa/dxTiHlVnmcS7CBfTZgP2IfWR4yOthxvQ+040c/BFauOPjh7h/VHq27Ph1aLNL2z0vQO+6PS5M7dZVy2AxFEb9oE7ytN93IFBjbwcnIqh8mu13a3ORpzl+SXVFnKAxOXGyPYmDEDkQLerxVvJ296NRPvsb4OqudQ+P390fJtxhIYYZ3n2nT/sX5KHPEUo=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3676.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291ddb20-4f73-4754-17fd-08d818786730
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 19:54:27.7463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K0+tjo7l0UwxCXD23L9KYGyquZPSmynDprhukO2YRtXU0yD06ut715bRb2fGeHmxuUbHOGUKRXEDTSMSX0Qtx9EkxVLOgMd90Q+ZQhLiv+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3753
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB3676665C903900BF80D5125DE5950DM6PR11MB3676namp_"

--_000_DM6PR11MB3676665C903900BF80D5125DE5950DM6PR11MB3676namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SXQgbG9va3MgbGlrZSBhIGR1cGxpY2F0ZSBpbiB0aGUgSUQgbmFtZSDigJMgSeKAmWxsIHRha2Ug
YSBsb29rIGFuZCB0cnkgYW5kIGZpeCB0aGF0Lg0KDQpUaGFua3MsDQotTWFyaw0KDQpGcm9tOiBU
cmV2b3IgV29lcm5lciA8dHdvZXJuZXJAZ21haWwuY29tPg0KU2VudDogV2VkbmVzZGF5LCBKdW5l
IDI0LCAyMDIwIDEyOjM3IFBNDQpUbzogTW9ydG9uLCBNYXJrIDxNYXJrLk1vcnRvbkB3aW5kcml2
ZXIuY29tPg0KQ2M6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnPjsgZG9jc0BsaXN0cy55b2N0b3Byb2plY3Qub3JnDQpTdWJqZWN0OiBSZTogW2RvY3Nd
IFtQQVRDSF0gTmV3IHNvdXJjZSBmaWxlcyBhbmQgTWFrZWZpbGUgdXBkYXRlIGZvciBUZXN0IE1h
bnVhbA0KDQpQUyB0aGUgb3RoZXIgZG9jcyBidWlsZCBmaW5lIGZvciBtZSBhcyBQREZzDQo=

--_000_DM6PR11MB3676665C903900BF80D5125DE5950DM6PR11MB3676namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiVGltZXMgTmV3IFJvbWFuIixzZXJpZjt9
DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCglj
b2xvcjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBz
cGFuLk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xv
cjojOTU0RjcyOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KcC5tc29ub3JtYWwwLCBs
aS5tc29ub3JtYWwwLCBkaXYubXNvbm9ybWFsMA0KCXttc28tc3R5bGUtbmFtZTptc29ub3JtYWw7
DQoJbXNvLW1hcmdpbi10b3AtYWx0OmF1dG87DQoJbWFyZ2luLXJpZ2h0OjBpbjsNCgltc28tbWFy
Z2luLWJvdHRvbS1hbHQ6YXV0bzsNCgltYXJnaW4tbGVmdDowaW47DQoJZm9udC1zaXplOjEyLjBw
dDsNCglmb250LWZhbWlseToiVGltZXMgTmV3IFJvbWFuIixzZXJpZjt9DQpzcGFuLkVtYWlsU3R5
bGUxOA0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2Fs
aWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjojMUY0OTdEO30NCi5Nc29DaHBEZWZhdWx0DQoJe21z
by1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNl
cmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46
MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRT
ZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVk
ZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0t
PjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0K
PG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+
PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIg
dmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90
O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojMUY0OTdEIj5JdCBsb29rcyBsaWtlIGEg
ZHVwbGljYXRlIGluIHRoZSBJRCBuYW1lIOKAkyBJ4oCZbGwgdGFrZSBhIGxvb2sgYW5kIHRyeSBh
bmQgZml4IHRoYXQuDQo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJp
JnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7
Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0Qi
PlRoYW5rcyw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7
LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+LU1hcms8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZh
bWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+PG86cD4m
bmJzcDs8L286cD48L3NwYW4+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLWxl
ZnQ6c29saWQgYmx1ZSAxLjVwdDtwYWRkaW5nOjBpbiAwaW4gMGluIDQuMHB0Ij4NCjxkaXY+DQo8
ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNFMUUxRTEgMS4wcHQ7cGFk
ZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNh
bnMtc2VyaWYiPkZyb206PC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtm
b250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPiBUcmV2b3IgV29lcm5l
ciAmbHQ7dHdvZXJuZXJAZ21haWwuY29tJmd0Ow0KPGJyPg0KPGI+U2VudDo8L2I+IFdlZG5lc2Rh
eSwgSnVuZSAyNCwgMjAyMCAxMjozNyBQTTxicj4NCjxiPlRvOjwvYj4gTW9ydG9uLCBNYXJrICZs
dDtNYXJrLk1vcnRvbkB3aW5kcml2ZXIuY29tJmd0Ozxicj4NCjxiPkNjOjwvYj4gUmljaGFyZCBQ
dXJkaWUgJmx0O3JpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcmZ3Q7OyBkb2NzQGxp
c3RzLnlvY3RvcHJvamVjdC5vcmc8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFtkb2NzXSBbUEFU
Q0hdIE5ldyBzb3VyY2UgZmlsZXMgYW5kIE1ha2VmaWxlIHVwZGF0ZSBmb3IgVGVzdCBNYW51YWw8
bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+UFMg
dGhlIG90aGVyIGRvY3MgYnVpbGQgZmluZSBmb3IgbWUgYXMgUERGczxvOnA+PC9vOnA+PC9wPg0K
PC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_DM6PR11MB3676665C903900BF80D5125DE5950DM6PR11MB3676namp_--
