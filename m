Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4DDCD5BA7
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 09:11:06 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19726.1763025066196268779
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 01:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=KvG74PwB;
 spf=pass (domain: ericsson.com, ip: 52.101.70.2, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXKz5KU0FuSiXXiVECM0Hk68yyrzgopFA5Zxbp8cYNQ0TJyWTqsnMy9BNpdblJK6YRU8aU5/OGOXX6VS/v75GPw3cSGv07TGTd+NkMqmBDzDT7nXqAsWJXv0y5Okpy3WFgplsNFvE7iGUnBZYaZdqyRA0qwPkKcauHfR3TyEFgKkw2OL3s7h016hTzgKdO0K0VJh31izclutXJe91gom4K73IjuXSHOph/EDu3qGdtVBftv3naTwt8fSExwMWKeTljM4zC5rg8IHiRHzkyjdDArWsHv+OAIMPPXoJPMaeY2j7ORh2VbfRj/aRkS/HWfOMVIk5l3e6uw7ra25g8Rrlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TW5X8hxbYBaU0pdaE4oXCLuHbp8NlpcTU0fjrldFz4w=;
 b=MLfLGC5n/FG6KM6580GQttzMFSae2QC2R8cHRzn7+WM8R5tgmjXoVYYPjVrCT3C6f6gfY0vknwAonGmosS4xxw47f3+ivHbwoQ8o2FOprjiUfazdVKw6ymG9EUxvFmNXK80kT08BunjVCGqcQQqF1Yiy7VLH2dt31og7wSrabNzaruACCZpNAiPzFn4YqoGSkKgoeZSml0PzwYHsuEsMzzcHSSzucaWNa7uL/eRtKLR9ubBieP8y11rwk8HValRv/aKxJU4s2MbvfwsKXKPEh7Bs42I6BswhTSi60brXVteVC7SDBbdtbSzivOR6n5bwASaNtRauhn7vHijwsvuIFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TW5X8hxbYBaU0pdaE4oXCLuHbp8NlpcTU0fjrldFz4w=;
 b=KvG74PwBwZ/jUCSOD1yrNABEgM2ayuqAv/i/K7RZWbw4Z5M/GwTAvOkRp8+SOM817vYmKAvSFVXhpQGiBL/bT9DC/MVByDV6RiKdvs5ASBISvczO1ZnnEBt2Z/KKNtz1RDA6JsWlxMMDQksWQqHQ9vAAhB/7Kao8fZkvhTi7TEs05ywPLXeX7Y8ABpHQY+EnsHCbu6KmqDEUwvmMtQ9Jhx23j7Oqb91XTVlcc+gjqy1B95SJ/X1YOMzplYvwjb1hItt5WA8JbG30afKDz2ixl8FP4o40l/RJzX6VC3BXdI1VEEiBdOSH6YIN7FGntG1V2JC8B+RUnry6hmFYAFHojg==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by DU0PR07MB8972.eurprd07.prod.outlook.com (2603:10a6:10:40c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 09:10:59 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 09:10:59 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Antonin Godard <antonin.godard@bootlin.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH v2] vulnerabilities: add section for kernel CVEs
 vulnerabilities
Thread-Topic: [docs] [PATCH v2] vulnerabilities: add section for kernel CVEs
 vulnerabilities
Thread-Index: AQHcUh54VAE4SlQgbEeMO58g8OZJobTwTpyAgAAH1sA=
Date: Thu, 13 Nov 2025 09:10:59 +0000
Message-ID: 
 <PA3PR07MB10721F3BB21A8D9404CE47F178ACDA@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20251110084548.3333453-1-daniel.turull@ericsson.com>
 <DE7FM5UY8B22.3BSZWV4MP4558@bootlin.com>
In-Reply-To: <DE7FM5UY8B22.3BSZWV4MP4558@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|DU0PR07MB8972:EE_
x-ms-office365-filtering-correlation-id: cf6dfba2-ddd4-4752-d2b5-08de22948fad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MTR2QWZXZDZ4Y3NMazdhMHZaZjdCWHF4Qk16NXJySENTTEFia056UTNYYVU4?=
 =?utf-8?B?eWlpVm9PMkg1VllBYk9sZVJHMFhkZkpmbXZPQklEZzBLaEtJTzVjVENmOGJl?=
 =?utf-8?B?WWk2b1YrdzF5QlRwZG52M1BFZW1GNFBqanNxa2JHbXVZY1FZdVFWNUE4YjB6?=
 =?utf-8?B?TVpYYjZ4VUhLRW1LRG9jNkFISnlNdDhHbmtWSEIzYm1xR0VYLzhRNUx4NUFv?=
 =?utf-8?B?Nm9lWWhtNWRMTk9GbmNHNVVRRXFNRU11dEQ0QXoxamJNRXJCZDVBOG1xeWRw?=
 =?utf-8?B?VXMzV25nLzFYeUx3aEpWQVcwdXc3Q3pSZXg2cGdBMmpSZzMvajVVTWE0MmxR?=
 =?utf-8?B?RXBlOGRGeTI5dGZEWGlOR1VKSkFNV1hhZmc2Nko5MEE4elo3TUsvT2ZsbkdD?=
 =?utf-8?B?bjhpOXVXN2VnVEJBcTdNcmRMMGovS2N3dnppdi91ellMY0RGUGh6N2FmanBy?=
 =?utf-8?B?em80RkVFMU9laXNSeFVlT1pRbzFRZ2JmUm43WXQ0WnRDeFFvS1dGZENlWnBv?=
 =?utf-8?B?bXhpeFlMa1RScWo1a01zQVpSbXc2TE5YejB0S2kwRkVqY3I2MHlLc0RQOE1I?=
 =?utf-8?B?aEJ2M1Q3UWxMUTdkbXhlTnNpRlRRZ0llUEh5NnhSc3B6UkgrbFNpV2hSZm1R?=
 =?utf-8?B?Y1dKUWJaL091Qkl4OEFvSkh4MjJwQzJlTzVmbEdDb1RxS0lrdEZpOXVSNG10?=
 =?utf-8?B?dW40cVlxelBEbE9rdTgwQzJiM0VYQ3VSWERZbHpHUmwrdlJzZ0kxWXUzMWF1?=
 =?utf-8?B?V3Q2ZExsV1VUdlRPZUQrSzR3OXpCOEFQSzBMMktvTW5yOWNOKzlSR0crc0Nx?=
 =?utf-8?B?L09EN0twSkJob1ZGR29OL1MvNkJ0Y20rNGg0S1ZmNlJZZ0IyUCt3NXhHWktv?=
 =?utf-8?B?MjZEMTlIR0QxTWNDenRTZnBpZWlQY1NZQ1dzSkhLeDF0aVZZc2d0bzQ5bGZL?=
 =?utf-8?B?Ym9YUENCTkVYOHA1VUFNc3YxRG1CajhNWFNRYU5OYUVYdm94SG9xM1FDNUQ0?=
 =?utf-8?B?WnUzZTd2TlF0WFVyNjkrRlgvQ0RZS29SL0V1NkZYNVg4bmlQalRkMmNwY2Iw?=
 =?utf-8?B?dStVMksxVDZGOXFyMElPNzNXK1JaemowdEJ3SmkwS2MwNjF3eXRTdnRZeHlK?=
 =?utf-8?B?ckRsSEZtTlVSbFgzRGpjSzZLa0hhTUM4U1ozNFAzRXRROEM3bmZ6bXovdXVV?=
 =?utf-8?B?ZzkycVByS3hOQWRMdzNOVGhUSDc0TDRBNDVTLzg2UE9EK1d4WXMwWDNCU2tP?=
 =?utf-8?B?aUZESGUvUUNkMmFYeGh1ZXpEeVNENDlCSTZkNXZkNzVQdnBwZlYvNWs2cVgy?=
 =?utf-8?B?aENteU5JclNSWkJlNm5RWlphSlNGSGpFc0d1b1JaN2d0ZU9CSW0rQVJVUzFJ?=
 =?utf-8?B?bDBNNFFyOWxlYkVlL1RJZUxodENiMk1rblNFNHpBUGdQTFFhbXJvWmZGMm1R?=
 =?utf-8?B?SnplcUh2QVhiL3NQNnRxS2VVZDZjYXJNNFJNbC90M3U1MklzaHJLYUZNcFNx?=
 =?utf-8?B?aG1CYWNWTlR2M1JCazVpc1V1THIrZ0dTTi9Wd2FUdnJkemdHbHlwSnU1ZDNK?=
 =?utf-8?B?Si9wdE5SSlFKei9mcFhNUllZNEFVSjYwMFV3NHR0d0s1dzNacFlNWjNxR2hV?=
 =?utf-8?B?YzczVEI3UERNcko1WHA2RWxkOTNJNHdMQ0RPM0kxZWR6dFYvWU1SbmZNNGtM?=
 =?utf-8?B?SW5KR3dMd1prR1hlZ29aaHhFMUxrQzI3alc0a2NnQm53aGFCWjZJZUdtRTl1?=
 =?utf-8?B?QUJYWGdKUnVJS1dITE51cy92UUI0WFFPOEU2QkNLd29mbjhYWlpIUXBKQ2VG?=
 =?utf-8?B?YVBBSm5NUTNNMUNZSENMd3BGZjYrVHd0SmI3b290UUV3Rk5OS2JpNVR1V0dY?=
 =?utf-8?B?T1l0R0RzUkFLNExZelVBZVc0Rk1aSlZiNm9LRVpBbzJWeFM5NEsrK25oTGF0?=
 =?utf-8?Q?5QgzOeRbEVWuXkKWfF2U+USO+5J7oikG?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cGYySXlaN0NGdk1XMS9IdFpaSWVxTXhrM3pkbS85Si9jbWxFWko5MWxXK1Za?=
 =?utf-8?B?NWoyV2ZWQUJ6WG9oQW56UVRjSU1aVkZ4cURUMEhGVmpiYWpqbG5qUEIzaG1C?=
 =?utf-8?B?enZaL2JHWDI1MzR5REtJdTd5MVhjT05NYTlDdFdDY3VKYyswRkpuNnI0SXF4?=
 =?utf-8?B?TnloUzdqeWhjZjJlV0lGTzF1VThkejJEZzhack0wOUd5SlBVM0NmVkQ3SXBP?=
 =?utf-8?B?bmR3cUczQVhVa1hHcHZGNkU4bkFCNTAxQlJ5NS9ZNC9weTkwVDdud0IxQk5S?=
 =?utf-8?B?dUg3N3J2R0pFd1E1aTFadlIrSzRrWVRxb3hqRC8wdFVid1A3eHdsOU05d1VZ?=
 =?utf-8?B?KythcFU4SnNuK25mTnRiNGllVkpQaWloeDcydGtUU0E1R09lM01Za2doRTdr?=
 =?utf-8?B?aGhidHNuNEcyM0VUL3RzemdNMGhaR2JYeFJJalFjR2ZFRGZDRjNuMEwvYTJZ?=
 =?utf-8?B?dWd1N1QrOGhXS1BtSUhjcURwWWsxS1BkMFh0aGVLVUN0S0JReW5lcTU2WVZM?=
 =?utf-8?B?bFNmMUZNcjU1emMxTjI3RDN4SE5kaUpvUEN5ZXVYSkFSVldOMzdRc1hRNHhk?=
 =?utf-8?B?RkdpRkgzWStMeXN0N1dMWTFsOVlXQlV6MkNFcDFCQzZRZTZGMU9NTlIzY2lQ?=
 =?utf-8?B?alRRd0ZEaGx4M01FSnJJcDdNQnZFRk5UUTRXN1JMSi85UCtzNmlFbmNuUmRp?=
 =?utf-8?B?Rld6MldkNlN4NGErWHprM0VpZmw0ZkltWWJmbC9JaGZXUm1zdDJ6UVFZdFN6?=
 =?utf-8?B?d2VqeWVjL3JMa1VMczZtdEw0dnllcHhvWE9McWpXTnpxL0FqMEdPOGp0Q1Rl?=
 =?utf-8?B?MGZhWXRuOUNlK3U0Q2h4dFhGSUVRTDdKODJKeC9yelpSdVk3cWc2RFh1aEVP?=
 =?utf-8?B?RmptWEh5cW56T0FKMHNhN0liM2VGenNGMEpyU1FtQ3N5YjdEZE5nL1dCT3lV?=
 =?utf-8?B?anF0Zmptd1B0R0E2LzZnMWp6SFhCY0pTeXVOcDVTTGFWRVlxQVJia3pXL0NV?=
 =?utf-8?B?OGZ2bU9wMTg3aVZkUXJMZkhsUlNjOU8xQ1U1eG1YeGU5RXg0bCtlVFAyYUh6?=
 =?utf-8?B?ZGIvb3VFTjM1Z2JyeFhtSlJVWTJpd2Y1VExhUEZDTjJNZjU3ZmRCdmg3ZjBp?=
 =?utf-8?B?R3VZT0R5U1V4eGpuNWhQUG85Q3RIWFJrZ1gxcEJLV3dqRGl3c2NpZXNQbGZa?=
 =?utf-8?B?VmZWNncrYVB4S3lkNGdsOTdDeGlEZTJBb3oxNHByRGxQeG4rV1oyNktiRU4r?=
 =?utf-8?B?SXRZMXk4YzVibmg3amxzeUpObitid0l0YkIxSGRscnNUbjcwZHRYNEVPZDE3?=
 =?utf-8?B?Q1d0enE0Z0hlMUU4b1RNVFlpU2twTWlhZ0U4SVJIY3p3Y040YWZCakNzNmhy?=
 =?utf-8?B?Q25zZmtvLzJRbEVYK3dQV1RZcjJmQ1V3RVBwRzQxajN2aW9URGx5NzhpaWZG?=
 =?utf-8?B?cmdHeUhodVE3YkZWSzlCVnNKYmtvQ0trcVY1NVEzVE93dUo5bVpINDVERTl0?=
 =?utf-8?B?Z1hFQTk4dFJFN2V6VjU0dGd2bnNoV1BoSEJNWmxMOVJJOURXV2FYZXdWcGY1?=
 =?utf-8?B?dC9TVHlRdlltVjhrY1QxeEJlVmREaFdKb3p2RE80WXQ1TzJLZXRXTjVzWnlT?=
 =?utf-8?B?SFYvOUUxbG81dDJnR0o0Z1o1UnY0SG4yYWZ0QWdBK3pjYlJXNzU5R2pWT2dR?=
 =?utf-8?B?bWhLVkZ4STRSd1VSR1VxMUFmNXF3L2xydmptb3lVS29adE9xMkNaa05IMCtI?=
 =?utf-8?B?NCsvbkRmS01nYjVHcXllSnBsd2tHNjJEOUJNR2NpZTZFeVVBbWRrSk0veU4z?=
 =?utf-8?B?di9BTzhRNllPZmNSS0syYVV6QzZ2Q1VuWFVSWjE0WXRaSWVvK01ML1NmZjdM?=
 =?utf-8?B?dmdCTmcvMnRBZnJZWUtiTU9YMUppcGRJRHpVMzY0ZWtYMnJ2WlJoMTlFZ0N4?=
 =?utf-8?B?aVIwdFRNSTlhY1hIN1JNSWl2SFhPWVlYd3VPMEJrRG94VW9FK0N2T1l5YzNl?=
 =?utf-8?B?ektUTDcwWEZ1TWRKMG8wUWdSOVhtdjdXT2RMblVlWVZMaXhUVlNKbnpuVlN0?=
 =?utf-8?B?bkNydGlHTUNRQjNSZG0raWE2T0RJaWRMYVZRdHJ3NlMvdjNtSjNBZE1hYWFs?=
 =?utf-8?Q?gnV8LDxgxDhp0h+ZQm+wl/dyH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6dfba2-ddd4-4752-d2b5-08de22948fad
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 09:10:59.3795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hy8UyZ8ElDFfteQqc6RMtL5AhrTGAAjz2e+kVdnWU2N687YB/4yQg2GsGerYeD7+YPQew3F34LUCXeYHaDAL+Y1E1RYSfN3vKDLsZapgIbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB8972
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 09:11:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8029

VGhleSBsb29rIGV4Y2VsbGVudC4gVGhhbmtzIGZvciBjaGFuZ2luZyB0aGVtIGRpcmVjdGx5IGFu
ZCBzdW1taXQgdGhlIHBhdGNoLg0KDQpEYW5pZWwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBBbnRvbmluIEdvZGFyZCA8YW50b25pbi5nb2RhcmRAYm9vdGxpbi5jb20+
DQo+IFNlbnQ6IFRodXJzZGF5LCAxMyBOb3ZlbWJlciAyMDI1IDA5OjQyDQo+IFRvOiBEYW5pZWwg
VHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT47IGRvY3NAbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW2RvY3NdIFtQQVRDSCB2Ml0gdnVsbmVyYWJpbGl0aWVz
OiBhZGQgc2VjdGlvbiBmb3Iga2VybmVsIENWRXMNCj4gdnVsbmVyYWJpbGl0aWVzDQo+DQo+IEhp
LA0KPg0KPiBUaGFua3MgZm9yIHRoZSByZXZpc2VkIHBhdGNoLiBJJ3ZlIG5vdGljZWQgc29tZSBt
aW5vciBmb3JtYXR0aW5nL3NwZWxsaW5nIGZpeGVzDQo+IEkndmUgcHVzaGVkIGhlcmU6DQo+IGh0
dHBzOi8vZ2l0LnlvY3RvcHIvDQo+IG9qZWN0Lm9yZyUyRnlvY3RvLQ0KPiBkb2NzJTJGY29tbWl0
JTJGJTNGaWQlM0Q3MGNiOTAzMTJlMjNiNGIxYTUzMWIzZWM5YmQwMzIzMmFiMTE2ZTk5DQo+ICZk
YXRhPTA1JTdDMDIlN0NkYW5pZWwudHVydWxsJTQwZXJpY3Nzb24uY29tJTdDMDk1YzU4ZDU4MGMx
NGIyNjNlNTgwDQo+IDhkZTIyOTA5MTRhJTdDOTJlODRjZWJmYmZkNDdhYmJlNTIwODBjNmI4Nzk1
M2YlN0MwJTdDMCU3QzYzODk4NjINCj4gMDE0NzQ1MzgwMTklN0NVbmtub3duJTdDVFdGcGJHWnNi
M2Q4ZXlKRmJYQjBlVTFoY0draU9uUnlkV1VzSWxZaQ0KPiBPaUl3TGpBdU1EQXdNQ0lzSWxBaU9p
SlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMA0KPiAlN0MlN0Ml
N0Mmc2RhdGE9SGdRRXFWRzZtU3ZWJTJCUzBTZG1WaWhtMW1YSklXNVpYS1A2VW9yUCUyQmZLDQo+
IDZJJTNEJnJlc2VydmVkPTANCj4NCj4gTGV0IG1lIGtub3cgaWYgdGhleSBtYWtlIHNlbnNlIHRv
IHlvdSwgSSdsbCBqdXN0IGludGVncmF0ZSB0aGVtIGluIHlvdXIgcGF0Y2ggaWYNCj4gdGhleSBk
by4NCj4NCj4gQW50b25pbg0KPg0KPiAtLQ0KPiBBbnRvbmluIEdvZGFyZCwgQm9vdGxpbg0KPiBF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5j
by8NCj4gbSUyRiZkYXRhPTA1JTdDMDIlN0NkYW5pZWwudHVydWxsJTQwZXJpY3Nzb24uY29tJTdD
MDk1YzU4ZDU4MGMxNGIyNg0KPiAzZTU4MDhkZTIyOTA5MTRhJTdDOTJlODRjZWJmYmZkNDdhYmJl
NTIwODBjNmI4Nzk1M2YlN0MwJTdDMCU3QzYzDQo+IDg5ODYyMDE0NzQ1NTg2NzglN0NVbmtub3du
JTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9uUnlkDQo+IFdVc0lsWWlPaUl3TGpBdU1E
QXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJQ0KPiAz
RCU3QzAlN0MlN0MlN0Mmc2RhdGE9MVRPMURtSkY3eHVNUGw0JTJCTGpQJTJCUmoxS3lkWkFqY21U
MmgwSlANCj4gR3VzY0NrJTNEJnJlc2VydmVkPTANCg0K

