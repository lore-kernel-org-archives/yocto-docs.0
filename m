Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE08C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:36:13 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.64])
 by mx.groups.io with SMTP id smtpd.web10.50025.1710952570329313324
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 09:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=YX2zjZLq;
 spf=pass (domain: axis.com, ip: 40.107.104.64, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVRhdKI6rMvG8Wtei+d+auvmE9usjWQHw5KOofKCFKNvEypXoeWegepawuuOy5LynMAf0FjsOqMWkGsmF/SnlC3ZNjyi2CCYaJ9ywnSRTCSMDxTonMIIOXyTsM0Ihmve+kX7WOLTOXpO/vpqm29wk0xEx3XuJqZY/IHXRQ4vbUW5GnauSpYXAbAEvQ1RFOncYPBMUItyPeF0hiMAgURgPb6eyw4FtpyxnlihagMXiMcBqkESNDQbKzGhIMlT1pgJP1B1ZAFqBP63WPhvql7CuLb94wTZOTTMl8eOmkreTqLOcdzmpAM+LorW3u5MMb0jxs2eEDVi70SFwL3KtvHNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nA7sTEjkb5IApGF2xuag7Lod8B6fZE51XEpY+sNpetQ=;
 b=HOLJVFrUZmUqtknlMkcxSJctK0fZU3Oqlwuf478AUeikrDxGL1kpQyTHHD16A2zIIeUPdHKfqra3PLh+CPXrQEdnLfieNAeEmyUIiFZUU0Zn2udiLE6+/267ilSnaWoJ8SYlhhywFclYaK8aypQeUcEy51UWBNIAZ/s6LGbhtT1YDb9625iGfbVabnjfR9dKHLWVG8P+VcShvgOzTBX0UlzMgozC9ZV0MDNzRyE2zXiG0Ltzn/0zrTaqnluaoWKFXHm7+IGrKOHl6rgc2OyKlRynbmA5x+V1QmgLXYoh7unk9oprnGnDtJbIy5xXT5g6qtOlQfyeCJB3dGZqVkFcyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nA7sTEjkb5IApGF2xuag7Lod8B6fZE51XEpY+sNpetQ=;
 b=YX2zjZLqUQV8rq9fdg76HRPyeyzCvK6bFOYbivj5RKSK5TEh69gIFvof2eT199+BiOBuGP2VtA5bVVtwpDwSH5IEQFOzNzKx2h2jtEv/d+ZFHFtqfAath5QktAnwfl1pit5a0FaLkgR7T6qf5HM9UsC+TROYeK/3Oae2BHGZa5U=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA6PR02MB10614.eurprd02.prod.outlook.com (2603:10a6:102:3c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Wed, 20 Mar
 2024 16:36:07 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0%7]) with mapi id 15.20.7386.025; Wed, 20 Mar 2024
 16:36:07 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] ref-manual: classes: Add the kernel-module-dirs
 class
Thread-Topic: [docs] [PATCH] ref-manual: classes: Add the kernel-module-dirs
 class
Thread-Index: AQHabt0cl5a/ulxw50OE87/xG3v9MLFA6v9Q
Date: Wed, 20 Mar 2024 16:36:07 +0000
Message-ID: 
 <DB5PR02MB102134A7398892442BECC8DD3EF332@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240304160044.2325620-1-pkj@axis.com>
 <07b6b326-bee8-442e-ae5f-4cfd1fadb0bc@bootlin.com>
In-Reply-To: <07b6b326-bee8-442e-ae5f-4cfd1fadb0bc@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA6PR02MB10614:EE_
x-ms-office365-filtering-correlation-id: 805dce33-0b59-42cf-8709-08dc48fbd79c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 unDYHPuKcQHCtLVJZw8g8qF1/SNvA1h90ViL1TEeSOXXdsCdJ7lKFsAbSRk/F84+xumfehmZTsjCS/zNrVrJtDzBPxTmGFbpCWtl/qe0gaEmJLKVl7JktT78XXseu12esm1Sv6zKKH+cbTp9VbUBbxhZfxhs+3jvrXybbqOxpOd1QZ6WPEEAmK2lSMt4eRErtbUn0QiU+4uMQgfk/hlGh2DI68mHZmPXw40+ZPbCk8Kga9n6CcGIHVQURp2dk9BQXuHop2AylXLabm9WkWksFLqeHWdEdUz8Tx3qohff5yxs2GUrfMRrmB89Uw4A7sBW1aO3fDbPseAtifssE3Pg3prTmNTbZofkXiLHndL5YcOKlCrLH3tbPX5AT4QazPdDt3OCrnV5tnaTxNDguQdzatnHgYscRRT1WcXNHZ0SAeILFpjRYgzi3IqVp+p5SNppDFmRYI7fG4WqZlMwHmVCpxhZFBPzpScf6+rN+zR8K5SkHRqxruwV9/PDT95MsP0ajqK82dNImsMNDXtyWFsPEtN6aPm22F57ZSVIcxg0kO5tCLUt7+CxmvtOS2DQ4BlHPg3MFi2mnzwQfemklGPc3rbFmsiw5Ilid8BS9CFNs0a2XjIia2D0D/TzTuPiJsqAMvSz26g0qn76/bkj0gnPlBL8mgeAJ1BlBySqBTn2/PoJhTGq4/ZlSJ6b3pUR3vjKuSt+ubdLb1eVC0eqX470Zw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dmtIR1pjZy9WOElacHYyVkkvQnpYbkNJUU9xSU5peDZYT2NjUUw0UDVKRWRi?=
 =?utf-8?B?dGVMRWJKSUszTVhKSFovQmUzTzBqRjRYdUFxSExHUUVac0VGVi94dHlsSnN0?=
 =?utf-8?B?UnMzNnh6SnV5UnRKWmo1T1BhTWIxL2RwY2o3eHNyVmIxeGZqcGd3cmZBbHB0?=
 =?utf-8?B?Z0RzV3BVUURMTkxYZVEwcXVDcDNRQXVESnZaRzRUaWhaRVNySnhmRHdObVNP?=
 =?utf-8?B?QnQ4bFA1RkJja3k1VnJhVWJhVGVGS3ZkTTArK2RNY05STVJPMmlKMGVBTVJQ?=
 =?utf-8?B?MUpLSU4xQzgwMTkyUEV4U2NMc3ZWUGtqeE5RS0JaWndFd01WanhnR051WTgr?=
 =?utf-8?B?VmpvSlJpQklzTXpNc0JPdFhyZ2N3NTJpNGVueU1NYkI1YVNzNXlvSUZaRkU1?=
 =?utf-8?B?aWJHQXBwakF2REpXVGpKZ1g2NEFFWEdPeXNLVVBHSmNvcjR2Rk0vTy93Um5D?=
 =?utf-8?B?NElBS0Fra1BKS2Qzdm1nOTgxcVNobVVkZVJzY1NwajIyS3BtL3MxTDdwRnR6?=
 =?utf-8?B?RXB0QWYxbjdOUUdBNzEySEZnaWhBeW9yQ0VXUkI3RmNIeXRoQmIwWmdqQWZy?=
 =?utf-8?B?amhIQ0FVaHI2c1VvUzRYaVFqdmx6NlRPaFpwQm1BbklFK0hscnVmaFdPb0M3?=
 =?utf-8?B?TGdjMEI1d3JNeEFWeGdBZWFqQm5tREJOUjVNWTZkemV3bnZycGZncVdsRFNB?=
 =?utf-8?B?azBQNm9JRWhXTlVjWlNKRmJPVjRDMWtNZmZqM0VObWoxeDY3YWxVb0Y0ME5R?=
 =?utf-8?B?MWc2REljMk50R0ZCM29hNVp6c0ZwR1BLWmFDbEl3aVhsY0lRRlpxU3o3TjBE?=
 =?utf-8?B?enZMc01EbU94MERSVUNsdkM0ZUJ2NUdrZjlWL0MxRU5kVE15RjdNc0EzL2JN?=
 =?utf-8?B?b1RYUWdJaVNaanJFUm5NN2RDVWZrRXYzZTRDR3VjQThTYlJJZkdCOFl5VlRi?=
 =?utf-8?B?bmtLck1JVVlKa1JCT2ZMdklrSStpOVhnZFJRWnZDT3VPVWRXWU51U3hHRHY0?=
 =?utf-8?B?UHo2bVJycTd0Z1QyVUUwUkN4dlU1dG1FV3orYzdwZUFnckF6Y2dYbXNBRms5?=
 =?utf-8?B?THJNTEFVV3dMajdQUFBmcGtrejBpWjltWXd0MFBsRXFHWjIrVE0yMFlybWIv?=
 =?utf-8?B?bXgzT3djcDgzN2pQQlBiL05Ddk9xMFVTSmUrS3RHY0hsNkQ2R3luMlBFZ1Ji?=
 =?utf-8?B?WUJDSjZXVHVWVE1hWG1kbFJqRXdHV2tFVlpFOGozK1ZnTTB3K3BNNzE2ZFBU?=
 =?utf-8?B?WlBDTmNucmlib2VhL2RkR1IvSjZBaVA4cVN1V2d5SlBxSUpCVXRzRHRRQVNP?=
 =?utf-8?B?WlFndGl4bm5mMmREQU9tbEhWSWZZT0Y4S1hSQTJ0SHN0RDRMejF1aDhYRWhB?=
 =?utf-8?B?Z0RodnRNTTlJdnFFQnlYOVp1bEFTZ1gxMi9LQUhOT0V2QVpkWXFHS2VSZzAv?=
 =?utf-8?B?RXBLMDRWK0k3TWN6WHAzNjNBMjlva2RNYXU3NGNtMGlpN2VRdzF2aS9NRlg2?=
 =?utf-8?B?eUZscDE2Wmt4cTJBR2RLYWVLdWZVTXdZWmQzSXE3eVp3REFrNDBSTFU3SElD?=
 =?utf-8?B?dmJVVnR0bis4bjJzRGlodkt5bk5tVXRSWkZWNFZwVWJzb2x3NER3Wi83MFpq?=
 =?utf-8?B?ZWU3WFhIZXFLTkFNUm5Wc1h5UDU2cW9PblNMR2dqL3ZueXA5dTZnK1o0aDhh?=
 =?utf-8?B?MS9iTS9SL09idWd1bEcxMy9nU3JHVG9meENtcHRpY0RiRldpYThTbEdWOWtk?=
 =?utf-8?B?RjRCZFQ2NFV3L3BMT0JnWUM0cFJCN244T1kwdjhSaVlFVWJROW41WXk5a29s?=
 =?utf-8?B?U1c3eWxrVVZ1amFEblRRYXB4NVZzZkxzamFZc3NWc1E4bU9LSXEzbDBJb25B?=
 =?utf-8?B?VnRNNFJqbWJtc3hvbmtKdUw1UGJYWEEwbERTLy9QK1g0T2o0dEYxTnJWRTNx?=
 =?utf-8?B?MFFDWW92R1pCeFRjb3NtYURxdmF3UE13SVRibmdqWGpUWkg2M1Bvd3FTMjVh?=
 =?utf-8?B?MUxpendsSnRVMktJYjkzS1BzNTdkcjhTWVlnSTF3dE1Hc2hsK1N3SlJBK0pZ?=
 =?utf-8?B?NUZ3SUhVc0ZtWW82Z0IzWDZzL0R2RVpsOFNGOE9ERDFybVl2UHUwbFBIbkM5?=
 =?utf-8?Q?kz6s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 805dce33-0b59-42cf-8709-08dc48fbd79c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 16:36:07.0675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZM4d0efW3I9UPOVhlDAn38KEhB0RlKRFbu9nE6/Wy5GeosEV2xYdJ+9z/SauWChc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10614
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Mar 2024 16:36:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4997

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWNoYWVsIE9wZGVuYWNrZXIg
PG1pY2hhZWwub3BkZW5hY2tlckBib290bGluLmNvbT4NCj4gU2VudDogZGVuIDUgbWFycyAyMDI0
IDEwOjExDQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlz
LmNvbT4NCj4gQ2M6IGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTog
W2RvY3NdIFtQQVRDSF0gcmVmLW1hbnVhbDogY2xhc3NlczogQWRkIHRoZSBrZXJuZWwtbW9kdWxl
LWRpcnMgY2xhc3MNCj4gDQo+IEhpIFBldGVyDQo+IA0KPiBPbiAzLzQvMjQgYXQgMTc6MDAsIFBl
dGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPiAtLS0NCj4gPg0KPiA+IFRoaXMgaXMgb2YgY291
cnNlIHBlbmRpbmcgdGhlIGFjdHVhbCBhZGRpdGlvbiBvZiB0aGUgbmV3IGJiY2xhc3MgdG8NCj4g
PiBPRS1Db3JlLg0KPiA+DQo+ID4gICBkb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvY2xhc3Nlcy5y
c3QgfCA4ICsrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL2NsYXNzZXMucnN0
IGIvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL2NsYXNzZXMucnN0DQo+ID4gaW5kZXggNzMwMDAy
MGVmMS4uZDYxYmU4ZTRiYyAxMDA2NDQNCj4gPiAtLS0gYS9kb2N1bWVudGF0aW9uL3JlZi1tYW51
YWwvY2xhc3Nlcy5yc3QNCj4gPiArKysgYi9kb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvY2xhc3Nl
cy5yc3QNCj4gPiBAQCAtMTcwNSw2ICsxNzA1LDE0IEBAIFRoZSA6cmVmOmByZWYtY2xhc3Nlcy1r
ZXJuZWwtZ3J1YmAgY2xhc3MgdXBkYXRlcyB0aGUgYm9vdCBhcmVhIGFuZCB0aGUgYm9vdCBtZW51
DQo+ID4gICB0aGUga2VybmVsIGFzIHRoZSBwcmlvcml0eSBib290IG1lY2hhbmlzbSB3aGlsZSBp
bnN0YWxsaW5nIGEgUlBNIHRvDQo+ID4gICB1cGRhdGUgdGhlIGtlcm5lbCBvbiBhIGRlcGxveWVk
IHRhcmdldC4NCj4gPg0KPiA+ICsuLiBfcmVmLWNsYXNzZXMta2VybmVsLW1vZHVsZS1kaXJzOg0K
PiA+ICsNCj4gPiArYGBrZXJuZWwtbW9kdWxlLWRpcnNgYA0KPiA+ICs9PT09PT09PT09PT09PT09
PT09PT09PQ0KPiA+ICsNCj4gPiArVGhlIDpyZWY6YHJlZi1jbGFzc2VzLWtlcm5lbC1tb2R1bGUt
ZGlyc2AgY2xhc3MgcHJvdmlkZXMgcGF0aCB2YXJpYWJsZXMgcmVsYXRlZA0KPiA+ICt0byBrZXJu
ZWwgbW9kdWxlcy4NCj4gPiArDQo+ID4gICAuLiBfcmVmLWNsYXNzZXMta2VybmVsLW1vZHVsZS1z
cGxpdDoNCj4gPg0KPiA+ICAgYGBrZXJuZWwtbW9kdWxlLXNwbGl0YGANCj4gDQo+IA0KPiBUaGlz
IGxvb2tzIGdvb2QsIG1hbnkgdGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiBEb24ndCBoZXNpdGF0
ZSB0byBwaW5nIG1lIGlmIG5lZWRlZCB3aGVuIHRoZSBjb2RlIGlzIG1lcmdlZC4NCj4gQ2hlZXJz
DQo+IE1pY2hhZWwuDQoNCkkgZm9yZ290IHRvIGZvbGxvdyB1cCBvbiB0aGlzLiBUaGUga2VybmVs
LW1vZHVsZS1kaXJzIGJiY2xhc3Mgd2lsbCBOT1QgYmUgDQppbnRlZ3JhdGVkIHRvIE9FLUNvcmUg
KGF0IGxlYXN0IG5vdCBpbiBpdHMgY3VycmVudCBmb3JtKSBzbyB0aGlzIGNoYW5nZSANCnNob3Vs
ZCBub3QgYmUgaW50ZWdyYXRlZCBlaXRoZXIuDQoNCi8vUGV0ZXINCg0K

