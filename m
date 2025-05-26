Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181BAC5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 07:31:00 +0000 (UTC)
Received: from HK3PR03CU002.outbound.protection.outlook.com (HK3PR03CU002.outbound.protection.outlook.com [52.101.129.134])
 by mx.groups.io with SMTP id smtpd.web10.24062.1748244656613136149
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 00:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=nvqyAA+/;
 spf=pass (domain: aspeedtech.com, ip: 52.101.129.134, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZrll4ZDI7afp0gN6HG5+7qekSuYq6lC3jE/M2oz2Z4I89UNzqhkuElcP9XVh+C2JfOn41B0wdc6FueYsX9veiWTeS0bnL5+d3TX+uuXOCfN0fddNK+jVUQgvRXDhkieFivnaWGJ6FWkciF3vKTnoGzc7lLkWJdDulyI/zzLsSMGjrRgEik8SCCm3Ylq96mhYWoDWXo5B+zKo8nhfK0yNfEcGtcPELe4t8Lrq37uqWAcgAncy3LElt+RIxo2rMO+vIYU8BGTsGUvPbJr2D96Fi6qltjamaHSyAoYZwR4v+AcLyCLNAYIBAU3reAEDo+KZ6O5QIalRStic/dbURTzCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i538aB/jaiC9goQ4ZGrWt7hn+hd39VnEexnYq0SG4Zg=;
 b=J2g9LyOXItSYr4LSAq2Y+XSENh60eOHpgzGt/4KRJz7fpRFdlu3/Nhz74fPuw8qmnRLRBKEQQ/u6xL7CI2r9kWQ3aw5P7RcdMbWuiw6Fb4RxkzkR0anA+EK+LmaRh9y0ooPyMMZCdgyxGxTO11FA+wfsMa/pQCoXYm+1TUkGB4h1c0h3XwJP8CvHxLJOl6NMKCBsoI5einnC8YCIdBKI1szis7hzL8EnIDp9dLlCJQjuxgXseZRi33w79CWX2Ovawp6D3UbvK9pGQrh6VSwkPlMSdvcO7auz81MUtRvzkWiL33P65srDLuhoSDllT3w9r7IP8EqMYgJ+9sUOXY9LmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i538aB/jaiC9goQ4ZGrWt7hn+hd39VnEexnYq0SG4Zg=;
 b=nvqyAA+/2PZ+JVumc4ZhoqMBFRMcik3x0ZLOeiObH6xFy/zkeoSpT2qlf1iife7YXZuhDDurU3SpJXYlOAdTLwb2rcM0q4gh3cMAeF+DSAHkF53JWO4E6sM/9+5XH2ShbE5mclZJZ0sjwCRxuiAS84Is7EDsjvjv95Z7h7QxKyGRlS55Dseoh1GHb8yvZQyceZKVLuH1kcN367dbA2c0d7Qy1yIUE0sJVbmsG3a3YIHRha0279vIvLQsAHiYzwpPslWW6zp2ertJ0zPVsQKlJltA5C5fhTzaPCUXIplz2Mi8/Y3oavuVrR5g7CFziFWGzmHbOss34EdZPeTNSKDjPA==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 SEZPR06MB6642.apcprd06.prod.outlook.com (2603:1096:101:17b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.21; Mon, 26 May 2025 07:30:48 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%4]) with mapi id 15.20.8769.019; Mon, 26 May 2025
 07:30:48 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Antonin Godard <antonin.godard@bootlin.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
CC: Troy Lee <troy_lee@aspeedtech.com>
Subject: RE: [docs] [PATCH v2] ref-manual: uboot-sign: Support firmware
 property in FIT config
Thread-Topic: [docs] [PATCH v2] ref-manual: uboot-sign: Support firmware
 property in FIT config
Thread-Index: AQHby769tKJibxF3skONRF4r9pH3/LPkevQAgAAMelA=
Date: Mon, 26 May 2025 07:30:47 +0000
Message-ID: 
 <SI2PR06MB504181B5FBEC5619F02D460FFC65A@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20250523084314.775497-1-jamin_lin@aspeedtech.com>
 <DA5VYJ7Z52JB.X035ZSW9HF3T@bootlin.com>
In-Reply-To: <DA5VYJ7Z52JB.X035ZSW9HF3T@bootlin.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|SEZPR06MB6642:EE_
x-ms-office365-filtering-correlation-id: 705919bc-6d2c-4a70-db4b-08dd9c273c06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bFZxUjVlZ2ZjNjZJK3JhSEZyWXVsSWtaSHFBZHYza2NyVy9qY0VHYzZFUUNI?=
 =?utf-8?B?a0VHdWdyQUtyYk1lSkFhelIwVkZlTXcycDJTL2dXQVJCQlZWeE5FS2xieGdT?=
 =?utf-8?B?ZitiNTNpZjdnNGd5Wmp5Ukd5Y1poTHp2SkZvWHgwZnNua3I4S2sranhvVkNt?=
 =?utf-8?B?T2s1VEs4ZER4ZWFxMUN1eU9nMWZORzlFY3I4NEdkYkdFU09iLzhjY2EzTitz?=
 =?utf-8?B?WEsyOUgzazg3Q3hKdlppejkrWlZabXFJWTZYQkJ2eGN4NThwL1pmSXB3NTVC?=
 =?utf-8?B?SGJGRXVVVDdxMWNTWXJoM3dEZEtCeDVHZjNuZ0IyNE9ma2RmQTJ4U1ROWUx6?=
 =?utf-8?B?NTVwQzd0WVFkdUVXZFJ4K1R1Vk5USDlDUkNxSnI3ZUlTRkZzb0VPTUdjSm9q?=
 =?utf-8?B?VmNYNEVVQnVFS0dVUjBHa0p0cXRZeUNsK214K1Jwc2VtcUU2UkNVQUd2UXJq?=
 =?utf-8?B?TnpydFlHdzYyVitoNVN1WU5xeFZ3M05TUXhIUWJwUmUvS3dCbHl1T0tINzR0?=
 =?utf-8?B?a0JVcFUyUXRPcmgxUlVVeXVBbDRXL2JteWtQWFQxSHRsRUlIcVNCVTY4ZjAv?=
 =?utf-8?B?UFBHMkkxemxubVVrVGkyTTBsUkp5OEdkMlFmUS9CVTEvcktRcFBZdEhrNnhD?=
 =?utf-8?B?dllSWTlYODRrNzdJaiswRmNXRWJpVVFwdmVTcTFWQ09lV2R6dE15MjdmL1BZ?=
 =?utf-8?B?ZnV0MjdDdFhZK2tLQnBPdVFJSGgyS1MwYWNwamlqU1Q4V0JiOG5GbkhlRzNT?=
 =?utf-8?B?VUhhaWN3eW9tVWJ5YkUraFZWdk1BbW9hQk43TmFFNnpoTTFleERaSEpQbzFh?=
 =?utf-8?B?MVdMQUhaZHdkVE9HUHJ0a2YySWRJQ2UxR1lqT3BTUGxjbXd3N2tTNy9mblgz?=
 =?utf-8?B?SUgyRVY4eFV1NFlIallhTFYxRWRnaG4zeG1kR2FzbENaMlFWVkU0dXJxbDBO?=
 =?utf-8?B?NERkZFhGbnlnUlB4TkdHQ09SdTFVYUoyRTUvQklvUWFTeTdKWFp2TU4yQllP?=
 =?utf-8?B?VGY0d3dnVzhJakQrVzRqanFTQW9EZWFxWERjZGhLTDhhblRPZXBUVFVjdzdo?=
 =?utf-8?B?QnIrZ1c3K1BNRUpTTDBYZXFzOEZWczRyNURuTU9jdEFORUtnQlV1WnRFYkdl?=
 =?utf-8?B?dGFPbjVGaGVDSnlLd0VVMUdwOVVSOUUyZDRtZXpWb2U0ekZ0QTVwZGdObFZh?=
 =?utf-8?B?eXdoM2hWODczU3Z2NzFMYWcyQTRzbUFnQlFyZzcrZ05jMkhjZUxLNStISzVQ?=
 =?utf-8?B?cnpzZU5UUjYzNlhHL3BJeHFxb0xVdVZUWVpHT0tvbkFITm91TExLTGxCdFhr?=
 =?utf-8?B?aWpXVEx3MlQ1bG1GZS9DVWpMbGJETmgxd1VFL3lYQzFDMUExb3pRbit0b2Ux?=
 =?utf-8?B?RDBQMFlvQ0Jnb0RhdytwMlFLa0tWN25SZ0ZoV1owclc4ZEpEN3R2NFVMc254?=
 =?utf-8?B?L2JFb1hIVDYvelluMjJ2d0VFdXR5aHNBKy94RXRHQXFYYjRRWk1Db0lxN0lV?=
 =?utf-8?B?VUJSbWFsRzQ1d0hxazJhYzBlL2h5bkp6SWJ4czZ5UU0rQS9pWnUrVXMrNWs0?=
 =?utf-8?B?cXcxdlpadzVPR0kzekpMSXVSV2FRckJZc1dGZWl0UkgzcjgwTkNVV0F2M0w0?=
 =?utf-8?B?LzV2VEpSR2FReDVHemMyM3Bna0pqUGlnTHRxV3JJSW5pK3JDYis2NC9IclhH?=
 =?utf-8?B?UmErbWJ6WEFrZ1M3dTdlaUJISHFZZ2RmNVQ0OE9wbGlQYjNTOFVnRjRGUkF1?=
 =?utf-8?B?RjVnemdpODVpZW5yeXZtc0M2ZDFSeWJYbzhuYVRUYlZhbXU3YzRnQmhvSUcv?=
 =?utf-8?B?dFYxaEhNU0xMR1RmV3h6VFVqZmhHRXRaV3hMSzc4dStNQXl5S0tQU2VCb1l5?=
 =?utf-8?B?ZVRUaXdTdTZFYTJOZ3ZoU2dEdEQwSW90cG94R1FGMGZvSTdUUTRYY3B1Ynpj?=
 =?utf-8?Q?dW5pSw48hXo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UGNla1ZxY01SZlRqMWcyWE44M281Unh3TFNpRThmMGlZb1pyT0JpZWNpYWJv?=
 =?utf-8?B?SkFxQ0ZCWXpSVHdaMWoyQXhCaVV4RXAxcFRjdjh3UDkrWVg5dmsxMm50Ulpo?=
 =?utf-8?B?eUFxTWVFeEpINzVxSThoNklvYWpYdllLTXg3R3VOMzF1SXppUE9hUUZidmtu?=
 =?utf-8?B?OG1jYmFyZXFZRE9XRkJlSi8xeU9jLzlhMVlHNHFWb1B3dUVUNmNsenRBVGE1?=
 =?utf-8?B?UGFxY3dRSFA1ajlVdVN0dnovMWREK0FZeFM1d3VZcDJaSUo2cXczYlk0bisr?=
 =?utf-8?B?TWFzazhjcG91aGxVOVZLVEx4Y211TWVMcnE2MytjV1FCd1ZaVVp0cFlGYmlo?=
 =?utf-8?B?WHZJTnRiUUF6alp4b1VINWpObVZQMWh1VUdGT1pwNXlHNHNGMG8zditldklM?=
 =?utf-8?B?cGpRNFBwb0JXalQxZmdPNVpjQlJ6Z0VMZnRtUmRmMjlGaUM2MGROR1RhYjE1?=
 =?utf-8?B?c08xaVlpZGdTN3E3TS96U1ZHdHhhRkwzRGhzMEs3aXJYSVI3RFJBaVFCMmNx?=
 =?utf-8?B?VkNsNnVablVpVDFSUFA3eG1FWUttUzBLNFR1VGJ2WmN2SWV5ckJyb1RveHow?=
 =?utf-8?B?R3lvNmJuSGZiQURjMEl5NnFDR0pNSFRpcittUm11M0lCYVBCQmlQcU1PN0g4?=
 =?utf-8?B?b0JCdjQyVk9CK3BJL3gvL1RlRjExdnl4eElTeDdvQVhXY2JpbkFIUXVpY1hq?=
 =?utf-8?B?dkhOTlY3clM0T3lNRzNMa0xqTDcwTUNzajFPektKY284Vk9VT01CYTdPVXQw?=
 =?utf-8?B?ZzZTSmtCd1Z2ZWtkVUNoNDRCdVR0ZmFJVHpZRzJwZXozY3lvQ2EyLy9uRzhh?=
 =?utf-8?B?YzZhVlYwQ0ZXbE9LRmxHd0lGY0hNWVVtaFQ1U0NnWURYM1ZwSjFYMkRIUVo5?=
 =?utf-8?B?dTNrTFQyTTFOUVNUMWNzSHBKeVZzRlpybU1kYkJxY1h0S1B5WTV6SllWR1Bu?=
 =?utf-8?B?TE9BOGUyRUFyMTg2OTNka04wczNHOUU5Nk5IVUtaeG1GUFhhaTJWUkpVS24y?=
 =?utf-8?B?eDQvbUxZS0dTeVFRV0toc1c5dC9GUTM2Y01WV1Jlc3J2Y0RiTlFabjlLMDk5?=
 =?utf-8?B?YVVMRzNUMjMyQnVqSlRFYUQrUW1MWkJpVGJ5aWdYa29BU2FTay82ZkxpcHFh?=
 =?utf-8?B?eGIwT0Z6elVBN29sSWh5clQrWVZZNEdrdWh4NklHNS96OSt5ejRtNXVPWS81?=
 =?utf-8?B?U2U5SWdYU3Fid3RoUlZjVFRQcEJaaFA3N3p3U2x0V29TUjFLak5wUEJZNkJr?=
 =?utf-8?B?bFkyUEZHcFBNcDdSTlMySGtrdUtpR3NiR0VYcEZ6cmpSNnFSWlQxQXNTbXlX?=
 =?utf-8?B?WjNoclpReStrSkY0NUFNK09vaGNRYW03OXNzd2Nrb2hiOHhhRDE3V3VYWCtM?=
 =?utf-8?B?andRMjhrZUVzWUV5RHRmbGlLMkZRenQ3cjlkb0Rpekl4QWFhSVlYeGh1NHBr?=
 =?utf-8?B?NTRJdWEzUnBMZ3lPN1JpRjVnVEM4SUJKOGJTWXN1dEVKN1FOOGRBU1QraSta?=
 =?utf-8?B?bWd6aHVtRHRYNFRRZjZlcjZxWGdRTTU3MlhyNDhDaC9yZUI0RThXeHZNbTNx?=
 =?utf-8?B?NnZHTEtqNVIyZGVRRnZpQ1ZHL1NWRyt2di9pUXRlOTlnb3kxWndUd0h3VGxQ?=
 =?utf-8?B?ZWFncFdEbmhkc3VqYmsvYjJuNm52d0dvMGNpeTdpUjVIenVDVG1tZEgwcWda?=
 =?utf-8?B?Uzk4Rm9CTTFhUlgwRjVnM21pK3hMcEhaQ2xrZGxla0lQaTZRNnozZE5qby9r?=
 =?utf-8?B?bFB2QTUyNU9MSDduRG5OaWNCdnZOM25nd1R3K2hsRGxaeEUyallNd2tLNDFi?=
 =?utf-8?B?SURIa2lybjJXUHR5TFlPWmZqdW9kTjgydXBCYkxjcGhSZ3NSTWpOWDRJbjRV?=
 =?utf-8?B?M0haM0paQitUR1ZhMTRsVVI1YW5oUlRSSmh0cFNBSW9mTldLS3h1VDB3anJU?=
 =?utf-8?B?YmRWd25Ta0x2aVBKMEJxc0RGVkVoMDRIZTdxdlVTanV6WEpOc1Z6L09GOXU1?=
 =?utf-8?B?K1o1cm1rTzR0K0kwaHVKZ0NreWVKWjNqNm45RGpEd2NBUVpOdTZjR0FUNk5w?=
 =?utf-8?B?cGVCTjljcGE3SEtMa0toRW50M0xIU2pPQm1LVVpuYmIreWhzME9CaFZXUW9u?=
 =?utf-8?Q?hNfimCJqzUQZVG+IYiYu3XRwc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 705919bc-6d2c-4a70-db4b-08dd9c273c06
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 07:30:48.0696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RY2RYVnGUOQXZI0opyiV8/0EFBP/zkmgo5i41ZouEYgDPln4aj5aVSR5JZYlmlCPwIhUcB5Yb5nBiM9KXhKMCwvJIzCps/5QMWEnb1Fq3Rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6642
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 07:31:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6906

SGkgQW50b25pbiwNCg0KPiBTdWJqZWN0OiBSZTogW2RvY3NdIFtQQVRDSCB2Ml0gcmVmLW1hbnVh
bDogdWJvb3Qtc2lnbjogU3VwcG9ydCBmaXJtd2FyZQ0KPiBwcm9wZXJ0eSBpbiBGSVQgY29uZmln
DQo+IA0KPiBPbiBGcmkgTWF5IDIzLCAyMDI1IGF0IDEwOjQzIEFNIENFU1QsIEphbWluIExpbiB2
aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiB3cm90ZToNCj4gPiBBZGQgZG9jdW1lbnRhdGlv
biBmb3IgdGhlIFVCT09UX0ZJVF9DT05GX0ZJUk1XQVJFIHZhcmlhYmxlLCB3aGljaA0KPiA+IGFs
bG93cyB1c2VycyB0byBzcGVjaWZ5IGFuIGltYWdlIHRvIGJlIGFzc2lnbmVkIHRvIHRoZSAiZmly
bXdhcmUiDQo+ID4gcHJvcGVydHkgb2YgdGhlIEZJVCBjb25maWd1cmF0aW9uIG5vZGUuIFRoaXMg
ZXhwbGljaXRseSBkZWZpbmVzIHRoZQ0KPiA+IHByaW1hcnkgaW1hZ2UgdG8gYm9vdCwgaW5zdGVh
ZCBvZiByZWx5aW5nIG9uIHRoZSBmaXJzdCBlbnRyeSBpbiB0aGUgImxvYWRhYmxlcyINCj4gbGlz
dC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphbWluIExpbiA8amFtaW5fbGluQGFzcGVlZHRl
Y2guY29tPg0KPiA+IC0tLQ0KPiA+ICBkb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvY2xhc3Nlcy5y
c3QgICB8IDIgKysNCj4gPiAgZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3Qg
fCA4ICsrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL2RvY3VtZW50YXRpb24vcmVmLW1hbnVhbC9jbGFzc2VzLnJzdA0K
PiA+IGIvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL2NsYXNzZXMucnN0DQo+ID4gaW5kZXggNTE4
NzAzM2Y3Li41NGE5OGJmMjQgMTAwNjQ0DQo+ID4gLS0tIGEvZG9jdW1lbnRhdGlvbi9yZWYtbWFu
dWFsL2NsYXNzZXMucnN0DQo+ID4gKysrIGIvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL2NsYXNz
ZXMucnN0DQo+ID4gQEAgLTM0MjYsNiArMzQyNiw4IEBAIFRoZSB2YXJpYWJsZXMgdXNlZCBieSB0
aGlzIGNsYXNzIGFyZToNCj4gPiAgLSAgOnRlcm06YFVCT09UX0ZJVF9VU0VSX1NFVFRJTkdTYDog
YWRkcyBhIHVzZXItc3BlY2lmaWMgc25pcHBldCB0byB0aGUNCj4gVS1Cb290DQo+ID4gICAgIElt
YWdlIFRyZWUgU291cmNlIChJVFMpLiBVc2VycyBjYW4gaW5jbHVkZSB0aGVpciBjdXN0b20gVS1C
b290IEltYWdlDQo+IFRyZWUNCj4gPiAgICAgU291cmNlIChJVFMpIHNuaXBwZXQgaW4gdGhpcyB2
YXJpYWJsZS4NCj4gPiArLSAgOnRlcm06YFVCT09UX0ZJVF9DT05GX0ZJUk1XQVJFYDogYWRkcyBv
bmUgaW1hZ2UgdG8gdGhlDQo+IGBgZmlybXdhcmVgYCBwcm9wZXJ0eQ0KPiA+ICsgICBvZiB0aGUg
Y29uZmlndXJhdGlvbiBub2RlLg0KPiA+ICAtICA6dGVybTpgVUJPT1RfRklUX0NPTkZfVVNFUl9M
T0FEQUJMRVNgOiBhZGRzIG9uZSBvciBtb3JlDQo+IHVzZXItZGVmaW5lZCBpbWFnZXMNCj4gPiAg
ICAgdG8gdGhlIGBgbG9hZGFibGVzYGAgcHJvcGVydHkgb2YgdGhlIGNvbmZpZ3VyYXRpb24gbm9k
ZS4NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvdmFyaWFi
bGVzLnJzdA0KPiA+IGIvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QNCj4g
PiBpbmRleCA2NDNhM2U3YWUuLmIzODJlMjI4MSAxMDA2NDQNCj4gPiAtLS0gYS9kb2N1bWVudGF0
aW9uL3JlZi1tYW51YWwvdmFyaWFibGVzLnJzdA0KPiA+ICsrKyBiL2RvY3VtZW50YXRpb24vcmVm
LW1hbnVhbC92YXJpYWJsZXMucnN0DQo+ID4gQEAgLTEwMzI3LDYgKzEwMzI3LDE0IEBAIHN5c3Rl
bSBhbmQgZ2l2ZXMgYW4gb3ZlcnZpZXcgb2YgdGhlaXIgZnVuY3Rpb24NCj4gYW5kIGNvbnRlbnRz
Lg0KPiA+DQo+ID4gICAgICAgICAgIGRvX2NvbXBpbGVbZGVwZW5kc10gKz0gInRydXN0ZWQtZmly
bXdhcmUtYTpkb19kZXBsb3kiDQo+ID4NCj4gPiArICAgOnRlcm06YFVCT09UX0ZJVF9DT05GX0ZJ
Uk1XQVJFYA0KPiA+ICsgICAgICBBZGRzIG9uZSBpbWFnZSB0byB0aGUgYGBmaXJtd2FyZWBgIHBy
b3BlcnR5IG9mIHRoZSBjb25maWd1cmF0aW9uDQo+IG5vZGUNCj4gPiArICAgICAgb2YgdGhlIFUt
Qm9vdCBJbWFnZSBUcmVlIFNvdXJjZSAoSVRTKS4gU2V0cyB0aGUgZmlybXdhcmUgcHJvcGVydHkg
dG8NCj4gc2VsZWN0DQo+ID4gKyAgICAgIHRoZSBpbWFnZSB0byBib290IGZpcnN0LiBJZiBub3Qg
c2V0LCB0aGUgZmlyc3QgZW50cnkgaW4gImxvYWRhYmxlcyIgaXMNCj4gdXNlZA0KPiA+ICsgICAg
ICB0byBib290IGluc3RlYWQ6Og0KPiANCj4gUmVhZGluZyB0aGlzIGEgc2Vjb25kIHRpbWUgSSB0
aGluayBpdCBpcyBhIGJpdCBvZGQgdG8gcHV0IHRoZSBleGFtcGxlIGJlbG93IGFmdGVyDQo+IHRo
YXQgc2VudGVuY2UuDQo+IA0KPiBJIHdvdWxkIHN1Z2dlc3Q6DQo+IA0KPiAiIiINCj4gU2V0cyB0
aGUgZmlybXdhcmUgcHJvcGVydHkgdG8gc2VsZWN0IHRoZSBpbWFnZSB0byBib290IGZpcnN0OjoN
Cj4gDQo+ICAgIFVCT09UX0ZJVF9DT05GX0ZJUk1XQVJFID0gImZ3YSINCj4gDQo+IElmIG5vdCBz
ZXQsIHRoZSBmaXJzdCBlbnRyeSBpbiAibG9hZGFibGVzIiBpcyB1c2VkIHRvIGJvb3QgaW5zdGVh
ZC4NCj4gIiIiDQo+IA0KPiBXaGF0IGRvIHlvdSB0aGluaz8NCj4gDQpUaGFua3MgZm9yIHRoZSBy
ZXZpZXcgYW5kIHN1Z2dlc3Rpb24uDQpJIHJlc2VuZCB2MyBwYXRjaCBoZXJlLCBodHRwczovL3Bh
dGNod29yay55b2N0b3Byb2plY3Qub3JnL3Byb2plY3QvZG9jcy9wYXRjaC8yMDI1MDUyNjA3MjYw
MS4xNzY2OTE1LTEtamFtaW5fbGluQGFzcGVlZHRlY2guY29tLyANCg0KVGhhbmtzLUphbWluDQo+
ID4gKyAgICAgICAgIFVCT09UX0ZJVF9DT05GX0ZJUk1XQVJFID0gImZ3YSINCj4gPiArDQo+ID4g
ICAgIDp0ZXJtOmBVQk9PVF9GSVRfQ09ORl9VU0VSX0xPQURBQkxFU2ANCj4gPiAgICAgICAgQWRk
cyBvbmUgb3IgbW9yZSB1c2VyLWRlZmluZWQgaW1hZ2VzIHRvIHRoZSBgYGxvYWRhYmxlc2BgIHBy
b3BlcnR5DQo+IG9mIHRoZQ0KPiA+ICAgICAgICBjb25maWd1cmF0aW9uIG5vZGUgb2YgdGhlIFUt
Qm9vdCBJbWFnZSBUcmVlIFNvdXJjZSAoSVRTKS4gVGhpcw0KPiA+IHZhcmlhYmxlDQo+IA0KPiAN
Cj4gQW50b25pbg0KPiANCj4gLS0NCj4gQW50b25pbiBHb2RhcmQsIEJvb3RsaW4NCj4gRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoN
Cg==

