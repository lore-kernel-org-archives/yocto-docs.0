Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8052FC47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 17:44:06 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.75])
 by mx.groups.io with SMTP id smtpd.web11.24905.1706204639783796758
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jan 2024 09:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=kIhhB+j0;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.94.75, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYtqKCHZAFGh/Fn3ACA12PEWyrzSRQWCcT4TPyqc6MsHHQTDE4Sb7CKEY8QFG8zzg0P7Sp6ESuv56KBFbOSRL9xJemxvUMvVlS53YJzitHvDhrz0KgO9tVzL66a2K4B7i/GXP3hFdoPjgFty3IJS91HYx8QqOnJfMMo2Q+TqDWmoodlhuNWL25qiYeQZ/V53dmJoCpkZzdNu6ctKY9J+NntLoEx494GPATecuC9vRwJE37LlX5ClrXGah1g+668+fAqNb//hn6shCVd4dUEQRIHj+MLrg6i7+SbBx49zbXAwGYGBZtjJt8p7xph3f1iiMATgOCHnH4ePY893HJ5WpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRRTuBMm9t3jp3qSdsFyYpNyKDPhQOH3g8nlaTHePRM=;
 b=OLTduhqLpAnIbkLGxeMLjuuXL5Nga/HvlXj4dyHM9v+aRk/qTh5+Oqq0dDGodjttpMrhhr7oIXP+qZaMX+Xe18U6TC4zxu6RKbYU8C6tCLRYjhwJ0nXdrV3AFtTxQzmh4O435GIS9GZDrG0nnfcd8Kaek+6EaQpLAR2Qu0fsiLKj9d+KvZ/YjcgNSAwP6AhAbQ2OAZgdYSSBLwIM9dycyqJ9ZbLQAoXYyzd4WTpEzBjup2Czv4uNr60lHdxZ2BAYMg67I1pI3I2espWmoGaK88hC5f4lM8KNv0viWrqV+SkEvM6CuhDpBujezJ+sHQoKSPDBMTw57zuLx6e2oX4NrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRRTuBMm9t3jp3qSdsFyYpNyKDPhQOH3g8nlaTHePRM=;
 b=kIhhB+j0VmQDPX8Vxh5gDUPKVNF2NPl+hkTZFokzhkqBv16LIJR7FBAVh98DAmCT3ANjogk5I5oQl6TqiOk8sIJqUvAzadaAAgkDh28oLra8P7GqflkxwRi8WeezmxHws3T0wyBoBbeBvaozfZzBmS1HhqITGH+CkeMtqc+T771CFsP5H9IH1jC06EiOqPk0hUKdsFlvA2Lw6Mxrm8GB+7VoImx28GBBw4ZYDjJDjA7mnzRKoe1pJCVA2FQ7r7eE85yMP31bqbRqgMIhVmFLBEy05B1PJ+9jwmpFZnhvvJfOlga3h8DcKRwJFAIXjrXHwGKgg9nUDktYI1LQnnErjQ==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 SA3PR12MB8439.namprd12.prod.outlook.com (2603:10b6:806:2f7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.22; Thu, 25 Jan 2024 17:43:55 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::a0e9:1e42:58af:ba95]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::a0e9:1e42:58af:ba95%6]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 17:43:55 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] Possibility to use 'noindex' or rel="canonical" to stop
 Google from indexing old versions of documentation?
Thread-Topic: [docs] Possibility to use 'noindex' or rel="canonical" to stop
 Google from indexing old versions of documentation?
Thread-Index: AdpPsu7u9Jkwri9pR1eSUE2qWRGI6wAAqpUAAAAI9+A=
Date: Thu, 25 Jan 2024 17:43:55 +0000
Message-ID: 
 <DM8PR12MB5430B9DFA3D7B1DABD0C4EE28B7A2@DM8PR12MB5430.namprd12.prod.outlook.com>
References: 
 <DM8PR12MB5430C1F3DF524811569BF9A08B7A2@DM8PR12MB5430.namprd12.prod.outlook.com>
 <df129fbff9b6a2c77be7354b302307e7b67ce806.camel@linuxfoundation.org>
In-Reply-To: 
 <df129fbff9b6a2c77be7354b302307e7b67ce806.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=5a19419a-8f62-4e29-9a80-2f7d35791069;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2024-01-25T17:41:34Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|SA3PR12MB8439:EE_
x-ms-office365-filtering-correlation-id: 3e7a9648-e1f0-4010-92ba-08dc1dcd33dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3hrGC9IyaNtHkAzgCOz0E0ExFZi/PZ/cV9IJr9MOAJ/BFUeny4L2za1kQ5iwTFF3XMZpM0p4wkkkPuGU7p62CTLu0guXfMqOrfXUK0x37rZZNkg32Eqd2c+5YyNzra+puZ7IlgmVX/50fR5ycPXcva5e+749LcK55g7holfUDkZJFJ02d5u4Z4GSGh3j24Zi3crdTXJScNc/3ZuVNUI/HJ1umfiqPvONqkhTv5nVmLPjTjrXt3lghfupw7Nh2kaKiGx/OkixYZK3z8M74cKiKTogufY5KAjoDyxkgJMoEZ+inBkv/zv7sM4NsmtR2javm+MpO5/4WdWOUKsDKplXH05HDwNQOuYfEkaIjUBN6k5ztg9ZMbb39/JKW1nAA7mwP8tAjFGZgkfoJDOwxpn36O1tIVMijs/0Dl4G6XMONsuHNm7Qfx5gn4Kuc4oByFexanBCUx4r0wz4qPQ2TzpbjIVCH+K8wXhMinJul41zCWymEGDZsVQk05OQ2H/CxKo0QRxKakLukb5vQ5xTtMB08r/e+n2DIZ5TEZcN0a4svM30GUbOZJdKklSP9VXejkWTGr1lQ+OWkV8YnxDOQBwU3AiZvNw90NWpYfsIhIgUOOUzwyUJCLp89QcIYAjTsSaV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(366004)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(478600001)(71200400001)(41300700001)(122000001)(38100700002)(55016003)(26005)(83380400001)(9686003)(66899024)(6506007)(7696005)(316002)(2906002)(33656002)(8676002)(52536014)(76116006)(110136005)(66446008)(38070700009)(8936002)(66946007)(5660300002)(66476007)(66556008)(86362001)(64756008)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TVM4V2pRa2JiQ2dnaVV3MzJKbTlxemtOaE1FQWJXNnNYQzUwNDFaaVZsSGtP?=
 =?utf-8?B?TmRZcHdKWk5xcXRvbHRtWVZUVXdob3JtKzdnbm9Rayt3dW1JenRhaUY4dExm?=
 =?utf-8?B?U1A5RzRURFR3VllwQnlWREpDVlB3cE9PdW51MGp5Ykt1Sjc3RU81enEvZnRs?=
 =?utf-8?B?ZkV5Uk5ueDFEOThHdGlza2RhM0NnZzg2eTZkbkU2S1YwMlVzVEJENUJTYVg1?=
 =?utf-8?B?WS9aUFRCaTF5Qm40ZWlkVjVjbWpBbHVpd2hIcGxmaVdFK0ZjWTF6bTFUbm1P?=
 =?utf-8?B?aS9JTnNUcDd2a0dGNFcxRnM2TW5mSjhxL3FpQzV3WHB0ZEFPdHFQd1crVVVa?=
 =?utf-8?B?YlNRUmpMckRLNGxEdHlma0x5aFpUK3d1a25RWFVETGdpNWNsWE50VVBXd1Qz?=
 =?utf-8?B?ZkN6NEF6Z3p4LzFIZkFZNjltRkZjWXovZ2k1blNkWTY1OUNCT3gwcEFRbDNP?=
 =?utf-8?B?NGYzcGxuRVdld0swQWVROVNlTFAreHZmRkZlZW5ldlJhdHh0R3ZYdWpTVWRh?=
 =?utf-8?B?Rmx5OXJFUlh4OU1kK1U2UjA4OG9McDhCbmg4TkRlWmU5K3U5MkthVzd5ZDBp?=
 =?utf-8?B?dnM3UFBXeDExblZySXIxM05NQUIvS0NoOHFGd0VSUFUzcmNFdHBXbk1VYktW?=
 =?utf-8?B?SVU2SzliM1piN3NXaGFCd1J2c3JvTmVOWXFweDhFalhUZmxiWDgxVUpOMzEv?=
 =?utf-8?B?bVFLS3V5V3A3N3ZzYjBOK3Nzck04TmxTRGdYeno4OU84VTNoL1NFelNQWTFn?=
 =?utf-8?B?bDVOamdaTnRaeDZMOXJjaXYvckZBVFFjb2EwZFB2cUlHbVJqTktoZWEvNmww?=
 =?utf-8?B?MGVyK0s1R3g4K1EyNkhKV1JpUzFSRyttYUVaeXM2azhkTi9Ea3BVblNmWVAr?=
 =?utf-8?B?TUM4RXVVRlR6aVd0a3k3Y1VaVDJmeXhScnQxMjlsbjZ0cHlzOUNkTS84M2x0?=
 =?utf-8?B?NGRzUy9nUUZnZ3JDeE5hYWh2U2gyMU80ZWdubStvWTZBQkhXY0VZUmk0WHNr?=
 =?utf-8?B?MUtXc2xkS3lISSt5WFErSWdjdnZySGdnUW52a2xrcUFyWFNXRGRlSVFUMTRE?=
 =?utf-8?B?cmxmZW5zbGVrT3MrOW9tc1FRa1N6WmdzRjNKa2xBMC84cTZpWFkvRWIyVXE0?=
 =?utf-8?B?K1JVVm5VMG5OckpMS1IvcUZMWUJZOHE5WkJLeXFGN1dHaDhVR045Qy9SbG5G?=
 =?utf-8?B?RXpJRDM4ZzlMNmI3d0NOWGhhYmhiUCs3aE56Ym1uY09BV2MrZ09nek9oenZW?=
 =?utf-8?B?RHpQdGlqTDUyYXBYTURqRXJ6ZFdKbWxzNzRPdklxTysxNHdIanBkdG1LZ2JY?=
 =?utf-8?B?dXp3VXNHTGkvN3IrdUY3TDA1SG9UVzRCQ2JEcStpQzRhNEwzalllVGxFZXVR?=
 =?utf-8?B?L2oxQkxhSkdpUGpQdUlmU0dNdzN5TGF6NWJCVUF5MENSTzIzbmEvdSt3Y25G?=
 =?utf-8?B?b3BNTTBqQ2dkb1VhYklJWUpqWi9RaTRLbUdGSXkvRmVjMDhpZ2dZSzlyaUhx?=
 =?utf-8?B?LzBQNmJabXEyamx3RFNGeEFTS3I0akU5ckhSODBTUGEwV0pPci9pbWQ1OE0y?=
 =?utf-8?B?VVJQaVpESjVOTndrOEEvelVaVk9Wb01yVHRJVityU3kwYTI0ZWlBaS8xQXBh?=
 =?utf-8?B?SFplTHFTVEpvSkp0UlJiM3VBN1BhM3ZWMHZRbTZqSXVlamdqSjlrZEw1clpM?=
 =?utf-8?B?MTg2RzRWRVFDQmR0dGsxZUtMQ1VWdUszbzh6TVA4N1BiZ3g0RVRCd2VSTDht?=
 =?utf-8?B?UEtkUkM1dy9nZU9Mc3MzTGIrVjk0enF5SUVFNDFSQml3TUwzeHhwckFEYlU0?=
 =?utf-8?B?NDZOeUNVRHg2WXBpL0RSUU56dWtNaG45d2lRRjhRa0hIVjdIaCtQN0FtNHRi?=
 =?utf-8?B?MVBkdGZSV01rN1Q1TFlzWlZVdlUvZGk4SWpKb3Y2MUNzNmdjOFNDbUgxU1Jp?=
 =?utf-8?B?WDVBdEltbFVrRWMwVElldm9XQm5PelBBSEp3RFhySVY5amNCTHlkQ2didVk1?=
 =?utf-8?B?Nm9iMjlRazc1Mk04YWRja3llaEs5MU82RkxoZnZMT2tWYnNiWHF2K1MrQXJG?=
 =?utf-8?B?VVUwMGM4UHh5UnFHdHRQMDhGc2VVdCs1QTVFNlRUQ21aemdZcEMxdXl3SGJT?=
 =?utf-8?Q?SVlxfciTnkMQxxuhgk6SWyLsp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7a9648-e1f0-4010-92ba-08dc1dcd33dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 17:43:55.4928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zICM3J0mM5FEzK+/W4VOVz9KRa/TbxwWx8PSz4r9L+X3QUUWYiH809vwmi89WNd3bdxEekJKj1LWlHaBW8yltCM4R2G6OYyuIWIbXxDirYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8439
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jan 2024 17:44:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4793

SGkgUmljaGFyZCwNCg0KPiA+IElzIHRoZXJlIGFueSB3YXkgd2UgY291bGQgYWRkIOKAmG5vaW5k
ZXjigJkgdG8gb2xkIHZlcnNpb25zIG9mIGRvY3Mgc28gR29vZ2xlIHdpbGwNCj4gc3RvcCBjcmF3
bGluZyB0aGVtPyBPciBtYXliZSBhZGQgY2FuY29uaWNhbCBsaW5rcz8gT3Igc29tZXRoaW5nIGlu
IDxoZWFkPi4NCj4gPg0KPiA+IEnigJlkIGJlIHdpbGxpbmcgdG8gaGVscCBvdXQgd2l0aCB0aGlz
IGVmZm9ydC4NCj4gDQo+IEknZCBsb3ZlIHRvIHNlZSB0aGlzIHNvbHZlZC4NCj4gDQo+IEl0IHdh
cyBwYXJ0bHkgb25lIG9mIHRoZSByZWFzb25zIHdlIHVwZGF0ZWQgdGhlIGRvY3MgaW4gdGhlIGZp
cnN0IHBsYWNlLg0KPiANCj4gSSdtIG5vdCBzdXJlIHdoYXQgdGhlIHJpZ2h0IHNvbHV0aW9uIGlz
IGJ1dCBvdXIgZG9jcyByZXBvIGFuZCB0aGUgc2NyaXB0cyB3ZSB1c2UNCj4gdG8gYnVpbGQgdGhl
IGRvY3MgYXJlIGFsbCBvcGVuIGFuZCB0aGVyZSBhcmUgZGVmaW5pdGVseSBwb3NzaWJpbGl0aWVz
Lg0KPiANCj4gSSdtIG5vdCBzdXJlIGlmIGFueSBvdGhlcnMgaGF2ZSBvcGluaW9ucyBvbiB0aGUg
YmVzdCB3YXkgdG8gZml4IHRoaXM/DQo+IFBlcnNvbmFsbHksIEknZCB3ZWxjb21lIHByb3Bvc2Fs
cyB0aG91Z2guDQoNCkknbSBhbHNvIG5vdCBhbiBleHBlcnQgb24gc2VhcmNoIHNvIGRlZmluaXRl
bHkgd2FudCB0byBoZWFyIHdoYXQgb3RoZXJzIHRoaW5rLiBOb2luZGV4L2Nhbm9uaWNhbCBVUkxz
IGFyZSBqdXN0IHdoYXQgSSBjYW1lIHVwIHdpdGggYWZ0ZXIgY3Vyc29yeSByZXNlYXJjaC4NCg0K
UGVyaGFwcyB3aG9tZXZlciBjb250cm9scyB5b2N0b3Byb2plY3Qub3JnIGNvdWxkIGFsc28gcG9r
ZSBhcm91bmQgaW4gR29vZ2xlIFNlYXJjaCBDb25zb2xlIGFuZCBzZWUgaWYgdGhlcmUncyBzb21l
dGhpbmcgaW4gdGhlcmUgdGhhdCBjYW4gaGVscD8NCg0KVGhhbmtzLA0KQ2hyaXMNCg==

