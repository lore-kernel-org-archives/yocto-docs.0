Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD719C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 08:44:52 +0000 (UTC)
Received: from HK2PR02CU002.outbound.protection.outlook.com (HK2PR02CU002.outbound.protection.outlook.com [52.101.128.102])
 by mx.groups.io with SMTP id smtpd.web11.17927.1741077890655659716
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Mar 2025 00:44:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=edtYWENP;
 spf=pass (domain: aspeedtech.com, ip: 52.101.128.102, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKzCG7f64y2BnoAKpRD3jW+PgQBkIIuX/13mbwRQuS6x59RCAuXKvDuO0CzzhoQO875yXikPDksPr2lMZoMoDgeE1/D5HxVbwM93Ywqd1vT49MnhgUAwQ+wUDZW+sKIKCGgHbMTYF2x3mNL2TFyTohV9QfPTZB2rivaavN5oZQaXy+CT+C3juB/Hlmh0OqhQ2ApIrGa6vip49WfLHpHO5PCcEDAjb23dXsl6FQiZxmzw+4f/rZvraNzPulczdyuRPRvTK8qs7PQByb8S3l5baqm4SBCokTn7/NbCNintuAsvzPGbS28+ylIBeQ+YjIXCV4j5IjwghZmvhObw89TFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxlvU3EU7lblq+arVtoMoSZa8QVyTmSOGhuw6W2K9Zo=;
 b=yMma5YgHQWRys5NHLOjsb5b+tW/4yuybWeOWggFJo8QZJi5HpuSZJxsqLaxyZWUYv6Fc/7KKaQ9MCcmfvkVhP4LwDO7ORDil9qMgAuXRUdvV0OfKlK+NDc4GmCGPXxCzbKDkeblxV46ko1l/Wbmm3rpupi+PjzpQUerBURKHeUlIDkHimmLnsK9xqGeZfdW3+5dNrnXcraqf9tVawkZo5/rntsO9dKqwSjpTP0h1Y6HDyYrGRjc327C26XtR652+bbHZmsQ3kSbRYsfoNbW7gVOVM308AuCxNl0mu3t876RYOhWPURON5h/8h8k4sns7GtidbPlUIye4NqE+MyN5kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxlvU3EU7lblq+arVtoMoSZa8QVyTmSOGhuw6W2K9Zo=;
 b=edtYWENPYUqfrXILD9N3lRh8N5/D61V5RiZat2WYRDh6zKPVnEmF6l9OZg5EjWdhkXwFAtICJjZpk5llRqmUsqdD/8Nr2arm7vAgZV01BaZTtTI0GcH9aeZldIAGQZipRduYyXFecLGOyzcjzn8Q9+zAZOhFWRyuHG3cWpgVir1XlhCibEQoaySrip6u1MemAONszjK/smPUZSRVnC7bkrBJk1oXA/9DBHRRZOrtC47scuabONdaItX97W+/injcGyGMSU/CC+imqifeEVT8aUsnSN7Fj/tIsr3Z4eLwInj81AW8cdM2L2QXfxO2niBMnyOPAlf4gPj1yLbsTb5S+g==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 SEYPR06MB6455.apcprd06.prod.outlook.com (2603:1096:101:166::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Tue, 4 Mar
 2025 08:44:41 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 08:44:41 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Antonin Godard <antonin.godard@bootlin.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
CC: Troy Lee <troy_lee@aspeedtech.com>
Subject: RE: [docs] [PATCH v1] ref-manual: uboot-sign: Add how to enable ATF
 and TEE for U-Boot FIT image
Thread-Topic: [docs] [PATCH v1] ref-manual: uboot-sign: Add how to enable ATF
 and TEE for U-Boot FIT image
Thread-Index: AQHbOYIW/Uk1P1uzVEaEBlYYA/bvdrNiDL0AgAFCGHA=
Date: Tue, 4 Mar 2025 08:44:40 +0000
Message-ID: 
 <SI2PR06MB50418DFA8BFD2D5A4E6535C6FCC82@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20241118062113.269253-1-jamin_lin@aspeedtech.com>
 <D86NYU2LCQQL.1Z2582IJ4S7Q@bootlin.com>
In-Reply-To: <D86NYU2LCQQL.1Z2582IJ4S7Q@bootlin.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|SEYPR06MB6455:EE_
x-ms-office365-filtering-correlation-id: d1642bc2-f3ab-40fe-ec7c-08dd5af8cdea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cEttMGFDaHBuejFYNTA3ZUJEVC9Cb2FpdG9nUTArbGc3R1BucjdQMHNXTHNE?=
 =?utf-8?B?VFk3ZCtuU2NjSmNFUTR2eTExTHlLb2dDRms4T1dxQXBtNkd2aGxlYVN4bHBY?=
 =?utf-8?B?MTZFMmZHajVyVSs2NUhPS3dxcS9GUUVZMTZyT2h6R1BFdksrTDQ0V1RPVTVB?=
 =?utf-8?B?Y25aVmhsbkxoZ2U2NTlnN0p4cWVwdFpHNXZnaGVEbHNvY2poNVNPQ0EzRTBW?=
 =?utf-8?B?ZEFjM2YzaE5mSEFES0gxcng2cWlIWE5QYitjOVRmQXR6bzRNN1cxbDlaMEg2?=
 =?utf-8?B?U3NydVh0UVRxN0hVSFBkUEtLaUNULzVwNkpIM044c21IRE9VS1dZNlVobXVK?=
 =?utf-8?B?LzFNcmpLOC9WMnFNOGNSaUYrYVlQeFZqTjgzUms5SE9BWFBSYWxSaUtkZ1N1?=
 =?utf-8?B?MzJobzhMZDllNkN0SVN1aFU5RS9DL0srWmNwK1VCZHVDdkpLTHFUa1pXR0pR?=
 =?utf-8?B?TXZpYlQ4ckdFL2lnVHJ3WStTYjgyU3NTRVFYRDRIRVpxUlJIbEpidHB4cEJt?=
 =?utf-8?B?bFErRVh0bTZJazBNUU5MeTdLTFUzMEdpMnFlTlhnNlhjRWZRVGpUM1ZRYlZF?=
 =?utf-8?B?SDJzUWtJTGxEYkEwTG1HZkJXaTUzbHcvaHp5MWFvMTdoSVltVGVnanBuUkcz?=
 =?utf-8?B?cytBWjc4UTA5Y0ZHbitESjhUVUxVaSsxa0RueFBhZk9RS1g0eTdZR1lXVDdK?=
 =?utf-8?B?OFk4QlpOUXYwVHJMYzdJUnhqSWw5MVZOanF0UDIzRHdMRFppVk5HaVZoTlhq?=
 =?utf-8?B?dzQ4VnpaUG5TclZJRndUMDVoR0lUblZUckJ4ZWhxOGVoeWFCS3JSb1BhbjVm?=
 =?utf-8?B?aHo1OW1FWWIrNHhPWUhTQlFENUpsenMzU01CcjVVZGE2UmtXK0R1alY2a2pK?=
 =?utf-8?B?SG03SG9UZnVCdTJsZ1ZCenJ0TXliczdSRGxSOTViTzFoNHg1cGZzY2RheFJ6?=
 =?utf-8?B?aC9ITEF1OXRSVks1QUZETi9NN3hTV0hJUXhybjY5TzBPQ2JqaHNNVkFzU1p5?=
 =?utf-8?B?WjdQQTlGRHR2aWRUa0d3Z0xaMUNiMnpSRVVSdTdHT2NTSDMycDRpM0VGQjlq?=
 =?utf-8?B?RUw4RWhid1hzMmFZMHZqdkJDSnFNYVdiMlNoTHo1Y0JlaWNmd3dVSWp5QUds?=
 =?utf-8?B?aUdGRlk3STkzRG5kNGxmcytJalN4ZUpoTEZVN3ZjaXJBeUdIeHJGQ21RZ2dG?=
 =?utf-8?B?elY3dE1KclhLMlEwV08xNy9aZ3JrSkJndUpXVlM2R2M1WlRITExEYUk2RHI2?=
 =?utf-8?B?aDFsWmlMRXUxREVDVFNYMGxCaTRDaHNHTmlEQUViMllQVEFFbHJpVk9DUjdG?=
 =?utf-8?B?WXZFbmlXTjVxM2dJK2p5dWEwRWs2NUVDL1JsT1h4bHJwSy92M1VlNU0wUHQ4?=
 =?utf-8?B?dVkzRlZIZmlMRjltekV5V0lLN2JTOGJrU1ZmRHJlVmVLdURZaGJKcUJOa0xy?=
 =?utf-8?B?QkIxTlNYR0NIaE85cjFWcDFDNkp2NHMzNlJqRnN4czBaeFNPTEJRc0lkUTIw?=
 =?utf-8?B?OGh1MlRoWDgxVnc4dEZHWG9aaUV2dmNCOFBVa0MxZWpZSFB0eDd0YkxSRVRO?=
 =?utf-8?B?Nk1oM1h5MTd1L1RYbGtoK0Z3NUN4ektWeEdueUFFZTBJYjFSb215dzBWc3VN?=
 =?utf-8?B?a2t3S2psWVhiQlFEMldObFJaK2ZLdXd6ak9NRjkvYk9JZ2w5a2FWWk0wb0Nt?=
 =?utf-8?B?VkxOUWMvbllmQjdKVmVBOGg3RTFIdWF5MFh2bmtBenNkeGFOcDM2NS9IUk1U?=
 =?utf-8?B?M0FZV0Q3TW5vVW10Q3VjVWNFZzcvV2NWZGVvTFRiVEtLdXl2L2NkK1hSVk5G?=
 =?utf-8?B?Ri9TUEU0VlpHM0VsVEVuMVVpWXgzYk9TRWlSQ2RSLzVtK0hRQ0tvZWVpZmwr?=
 =?utf-8?Q?WXvfnDZNfyLLk?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OERpbk1MdEFGOHpaTTZ2SjNzeGJVZ2E5eElLYTR4YS92a1ZVUkFOUkNPRU4r?=
 =?utf-8?B?UjVCcUx6czN0UXJXZGdJNUVUcWJwRkJVUG9EWEYvMTZsRGtINDc1UGJHTGwx?=
 =?utf-8?B?U2RtL2E1eHJaYXZzU3R2L2FYekEzdDdqek9DNS9vR3NXN1pJRGE5anZuRHhl?=
 =?utf-8?B?QzB6UUZGeXAvR0N0RHB3QjAxdldyMW5SSENzU0hRU0MxMjJJMXkxTldscmJr?=
 =?utf-8?B?aiszNTljOUNZa2xVT0NvRHQ2Z1o3a042V3czUzAxdzFSUGRjNjE3RmNiUEhx?=
 =?utf-8?B?TUY4cEk3QXl1KzFLajJtZE1UQUp5WW8vTjNwOHFVcWhtWjdDYnFEYiswbW03?=
 =?utf-8?B?TmVIVG51eXlkcEI3ck0xLzFuMjVlUm5hMFliTGthaVlhbldwTERWbE15YkJn?=
 =?utf-8?B?c2h1VStLUHB0ajZOR04xYU81THl4Ky9sOVlKSDduUWk2ZnR1NkYwNnY3TnNk?=
 =?utf-8?B?MU1LN09kNnZlLzZ4dUplY3NiQURVekNnNitnYkFGd3pJc1J3ZTlPaUN5YnVx?=
 =?utf-8?B?S2hxTGNINStxckZzSGtNZXZyQ25uQzZiTTVQMGJHWWdtUjBUQnhUN0QxbnVI?=
 =?utf-8?B?ejB0UzlrSE9RUjhqKzRMNWFEUGJjcWlQTHo1b1ZDcWgxL0FpZDJEWW4vUlcz?=
 =?utf-8?B?cnNGcmk1VVJpTmI4QkxjOGtGRyt0cHhCSkgwZ09LV0NNTWJJUGk3ZEFqSWh0?=
 =?utf-8?B?YjhRb3JpTWo3ZjgrTkl0ckYvdGd3U3hvYUlxVDhjdTI5YjFnMVFLTStxcHFC?=
 =?utf-8?B?R08vOVd4WUthZWRsYi9qOTNzZ2wvRGlXY2FrcXZ4a1NZZlR6azRrcmdWRDUy?=
 =?utf-8?B?TERFSFZGbDNzdWFvamFHaFNMaS9jRktNc0hBaHdjbHREWVlJWWUwMEhQWnZo?=
 =?utf-8?B?YnB4YlVUeDRudVNVd3QyRFk5K1lNR1J4Y3ZSakIzYmxyTFlEUFRWSTExTGY1?=
 =?utf-8?B?UHcwRkMzMW9RUU9sNHRVZk1xOWFpMUpPU1FUL1VyaTZuakdDSnV4bTNwdFh3?=
 =?utf-8?B?ZHdqamVuMUVldE52cDJxczBpejRURllOMUtVRjlTQ29pZEZ2OVh6d0NUakJp?=
 =?utf-8?B?djhrZ2tLVnlIMVNSd1hValoxbEt5OG5XVG41dWRmRXhJZG9OMmJrNzk3UmMw?=
 =?utf-8?B?RHNVRDJaNng4VDN4aWI4Um9LZGhFTmVhL2EyeTY4dW85RHBiRXNXUTFQZmlj?=
 =?utf-8?B?T1podG9WOFFEcU5BWFBnTDFIMU15NDFvZEszejlQTy9VeDJ5MXpCKzYrZGlV?=
 =?utf-8?B?MUNGOUlHYWg1SjVWczdUZytDNTZCdEVBQUMrcGl1OHpua0ZORHlrUml5ODY2?=
 =?utf-8?B?TnJqWGxCeWFoUWlqaGROZzgyQzRwVXlOVXRwbCtsTEtJVmtyeFdhbFN1NHNv?=
 =?utf-8?B?MWRNL3IxQ3NidlNvb29WMGNWUWVlTWozS3hnbHNDNUpBQ0ZpQmNtbzZMdEl4?=
 =?utf-8?B?MktpTEZ4UWkwZkdoTkE0RDdBT1BrQk80bkJDV3RpbU1uemlsa1B2Q0VwWWNJ?=
 =?utf-8?B?cDM2ejhwUWRQcUF6SldHSjBrak00bDN3WkpTZDB0cjh6RER1RzdvUXFNNUpx?=
 =?utf-8?B?MjVZaFN1R0IrYUZRMVBFcklHZXkzUk9ZQzVvUmxJVmM5OXlBUEc4aUlhV0NP?=
 =?utf-8?B?ZkJBbzdzaERqd1E1Z29wZzltaU5ad2lrTkpLNXkzQXNFQjNjMmcwTFVzeVZE?=
 =?utf-8?B?SHBqSXoyQ1FTRk9BbWpta3pwRGNGQ2NZc2hIY0ZMQ3NBajdFNFVodTlhZ2dD?=
 =?utf-8?B?V0NWRUtKMHFvemV4SmdXQnkvK29LT2hvMXR5ZXdIaVU3MGEzSnBhYU1UTXdY?=
 =?utf-8?B?dFYxUVFHaFQzSXBtSndobjY1djBYNUNRa3dFY0JMcjhqRktNRjk0OHFYM2ls?=
 =?utf-8?B?ZFNzaUFOTlBZNVNQQi9vWTZaYzlqSFJaUHBXNWh0eXpseWxuWUR1M2F0OHJm?=
 =?utf-8?B?K0xqc3lNRDN4TnNNci9rbG1ZN0J6VWV3aXU0cnRsMGlsdFVuYzIycTBGV3lw?=
 =?utf-8?B?UU1mcExpV2VGQjIxYWh3bUNQMVVIMzlabjQ0ZDQwUUZqbWtUa3owa0x5NUxJ?=
 =?utf-8?B?WXRURFRpRnlmcDRYd1hqVi9YKzVUUjY5S0NWV084cHJSc1MyM3JoVkgrb29X?=
 =?utf-8?Q?U516bQNt6gHWa94Zmn+O7KKs+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1642bc2-f3ab-40fe-ec7c-08dd5af8cdea
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 08:44:40.9394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yx4XanD1ZkMhZCb7Xw6mWQ9RDCPHhaYBhbpOMudpErZAoa886FX/m6B4GMU08xVr8jD89mJ2HjEZrEX+6iWQrvFIAWP0AHIEukZEhBHnkts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6455
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Mar 2025 08:44:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6493

SGkgQW50b25pbiwNCg0KPiBGcm9tOiBBbnRvbmluIEdvZGFyZCA8YW50b25pbi5nb2RhcmRAYm9v
dGxpbi5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMywgMjAyNSA5OjI3IFBNDQo+IFRvOiBK
YW1pbiBMaW4gPGphbWluX2xpbkBhc3BlZWR0ZWNoLmNvbT47IGRvY3NAbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZw0KPiBDYzogVHJveSBMZWUgPHRyb3lfbGVlQGFzcGVlZHRlY2guY29tPg0KPiBTdWJq
ZWN0OiBSZTogW2RvY3NdIFtQQVRDSCB2MV0gcmVmLW1hbnVhbDogdWJvb3Qtc2lnbjogQWRkIGhv
dyB0byBlbmFibGUgQVRGDQo+IGFuZCBURUUgZm9yIFUtQm9vdCBGSVQgaW1hZ2UNCj4gDQo+IEhp
IEphbWluLA0KPiANCj4gT24gTW9uIE5vdiAxOCwgMjAyNCBhdCA3OjIxIEFNIENFVCwgSmFtaW4g
TGluIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IHdyb3RlOg0KPiA+IEFkZCBob3cgdG8g
ZW5hYmxlIEFURiBhbmQgVEVFIGZvciBVLUJvb3QgRklUIGltYWdlIGFuZCBJbWFnZSBUcmVlDQo+
ID4gU291cmNlIGdlbmVyYXRpb24uDQo+IA0KPiBDb3VsZCB5b3UgdGVsbCBtZSBpZiB0aGlzIHBh
dGNoIHN0aWxsIHVwLXRvLWRhdGUgd2l0aCByZWdhcmRzIHRvIHRoZSBtZXJnZWQNCj4gcGF0Y2hl
cyBvbiBPRS1Db3JlPw0KPiANCkkgaGF2ZSBzZW50IHRoZSB2MiBwYXRjaCBoZXJlLCBodHRwczov
L3BhdGNod29yay55b2N0b3Byb2plY3Qub3JnL3Byb2plY3QvZG9jcy9wYXRjaC8yMDI1MDMwNDA4
Mzg0Mi4yODI4NzYzLTEtamFtaW5fbGluQGFzcGVlZHRlY2guY29tLyANClRoYW5rcy1KYW1pbg0K
DQo+IFRoYW5rcyENCj4gQW50b25pbg0KPiANCj4gLS0NCj4gQW50b25pbiBHb2RhcmQsIEJvb3Rs
aW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPiBodHRwczovL2Jv
b3RsaW4uY29tDQo=

