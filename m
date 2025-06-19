Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5D5C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 09:38:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.59])
 by mx.groups.io with SMTP id smtpd.web11.10773.1750325896311807077
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Jun 2025 02:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=LPiXqFcf;
 spf=pass (domain: ericsson.com, ip: 52.101.65.59, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ysxe+d+smO7JAdj17NdexS7T1vKYkBzY9jECgAO2sEOzCGOjczpUv4vHUnZAlYrjgPL0GAP47goIzpWirFuyWshaIpp1hZA+zuxS80PK5ndf25Ctol3fWgKRZvgO55Fr423QitOTDzIqvrEIlt30rNR62FRipxMaGjxyNboCSLe0zlmxb1DlyoO/G83CbpKCcXDcoTCKa/1K/i5lNFCxfAjJ105gbwPrIdu//2otGjwohGrdK7kKAQ9ZsbF09bFpOu+wewUgD5lrPMkfM0NmGL7fLogbrDFVy1a1wn2q4dUlVvVj8avMLBTDKRK5fg1ilKZYaM2db3fIKCl8rWWlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CL7juqMhsdaIQGPpmCuAWo3OH2oqLsrgBySC+yMy0d0=;
 b=uDXGRoeObOslihQYIAGQQ6vI6gD5lRl1FY9N0XCnzLav4QB73kKwKmh9iK7rxl76Hfo8/cbdfUunV8KLUbgypctNUkEgXKygHiPoJSSWisWgx/pR5OGNJKLmmH4lHrgnvc3/U0CMx7Db5Touu8sVVLsPNQ4Tr6fIM7c+ZVmJXVWX0/PR9EC83IfsoPLIJXPzh9zhU9FU2JQpwDHfGcrbj7e7zu3H2chw5V4CcHEYOuNTz4rknWeXo436JJ95eHgm4Fu7RkgzM2ZHIougUQPw/l03czoc58uUUAxtmK52CD+uhgj6LZ2wxpZF3zD4qdi37WOXZJF2Rbs3Qxd3qC7etA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CL7juqMhsdaIQGPpmCuAWo3OH2oqLsrgBySC+yMy0d0=;
 b=LPiXqFcfWzzv+CbKDom6orVtutofbrnYgFyVW/M1EAAoIqSSSHkHZ+gnLBEoxG4kQRcqwlUu556/Ro/6K0w1zybpeAh0umUxLgt3Wt0QF1UIYcdQcEOTnbHE2PxZwmGcOQFBHR2GWjNePxSH33trbFDUEEFcF6Yf+fiZETlSMR3u5DFw/Iy3sF/QM3oQC9IBRNgw0STPkj7ha1+n7veKCf5bm6ZKechJBWIKvLY7xtRsDTuad+2EnQFPrd8zFni6rU3DQTtQt5Mep5KIYe7jwYLn0whKm4/Ikv2Qs+Z3sc70XGoTHIDdlmqSL7hBrgsyIYK+ejLwxEtE3hSTmvxozw==
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com (2603:10a6:102:61::16)
 by AM8PR07MB7425.eurprd07.prod.outlook.com (2603:10a6:20b:242::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 09:38:13 +0000
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b]) by PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 09:38:13 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Antonin Godard <antonin.godard@bootlin.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] Add SPDX_INCLUDE_COMPILED_SOURCES documentation
Thread-Topic: [docs] [PATCH] Add SPDX_INCLUDE_COMPILED_SOURCES documentation
Thread-Index: AQHb4PeC/CWzmQLT3UG9S8M3ukwqCrQKMu4AgAAGXOA=
Date: Thu, 19 Jun 2025 09:38:13 +0000
Message-ID: 
 <PR3PR07MB6666CC82C3EDD9673003C8498A7DA@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250619085215.1942667-1-daniel.turull@ericsson.com>
 <DAQE7ZMJGJP1.17C6FNYGWZM4J@bootlin.com>
In-Reply-To: <DAQE7ZMJGJP1.17C6FNYGWZM4J@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6666:EE_|AM8PR07MB7425:EE_
x-ms-office365-filtering-correlation-id: 71135e6e-a618-4ccb-ea4d-08ddaf1502c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eUloYVRQOXNGVXR4ay9QQng0bVFoRWRlSGVRSXVaRkxJQ1BNU09uN2JRMHVz?=
 =?utf-8?B?Qy92S1ZWL0JhM1ZuL3Jkdks5aGU0aFdZVGpmV3VBMVVodWMvMVZDMDNydjJI?=
 =?utf-8?B?VXZ6VCt5a1k1U1N0N3pXc2pYMG5zb2poc2Z2cTlzN0lVOFVLajlqK1NHU2RX?=
 =?utf-8?B?bCtrbTNLR1RPalJ6dHJwWFBtWUZ3R29YQklPamZ1ZW9wSjB1eE5HNU5ZZ0w2?=
 =?utf-8?B?Y0hOaDZZblg2NWV0azNuaEh2QmxJSWV2S2o0bjZJUGltdmRMcFo3a2p4NUFL?=
 =?utf-8?B?TVNKb0R2cldWYzJ3ZjFVZ0pobUxmbFlSZHROZ2xCZ0hOVkxTSVhTT3RhdElU?=
 =?utf-8?B?ZWhEY0dxRExyUlVHZTR1SnZodzJWdFBJb0gzQlU2UnpuTStTTTdPZVVyQ0NM?=
 =?utf-8?B?ZXU2SVNOdjl2V1BFUnpaeXdPelphK0E2dG9lcG9pN2RNNk43TWtxRU1YNWZC?=
 =?utf-8?B?SG5OYUtpd0tOOXppU3E3bUNSQUdpVlMzeEZTUGdUYWVCU01uUUZ1eW52ZHYy?=
 =?utf-8?B?K0MzME5nbXZLemVUZzlOdk9hSUxmakZYUkxublBVV1pTa3E3a2U3Q1I4Rzda?=
 =?utf-8?B?R3lxcGg1MnJGVjVZUmJESWRBYW9xTnlobmR6MmhXbVc3MHVFa0lJNEliSEJE?=
 =?utf-8?B?KzhNV0tlYUlYeWNDQXBOOW5rdytyQ1UvTFU2ZGVHUk5QNU5UQUYrVVVpQ0VI?=
 =?utf-8?B?RE5KVnJTTGx2dWptd2dHbzRJTk4rd0VSVktJNlFiYmkzN1Z1c3l6L1VpWFQ3?=
 =?utf-8?B?dEl4VVpBelFQNjIvNkVYZXZLZjVMbXB3QVI5cTNOQmQyOVRxZlZlT3NWRGJ4?=
 =?utf-8?B?bDhzRXNlRzRSTnBQcW5UWVJ5Y29Ed3J3ZlFOU3E5ZWxWNGJTUGZlVVV5dWx5?=
 =?utf-8?B?c0NrVjFJRHZ0cXBadTR0QlNOVGx1RTZQZ0dVcStHTWx4bWphZlFORUJmME5O?=
 =?utf-8?B?NG55NFFTNHJrbTF3MTRRbVhQR1UyR0I3QzNTbzkyOVlYcUlPQWtLWnNmUjhY?=
 =?utf-8?B?NytSZlhEMHlUbjgxZnk5SXVLSHA2b3VEa0EwWmJpdmRlZjk1WEtRMEU0cnhx?=
 =?utf-8?B?QURDOENlMFdyOGFnV1l5bkMwZlliMVEyV0t1bGVTdkJlZGszRWRwUDh1Ulh5?=
 =?utf-8?B?bVF2VkkrWk5PZDFKVzRjUkMxT0laQjV6MUZNbVNBaGpsaHJ0Q3locUdHV2pC?=
 =?utf-8?B?d09VTWVIenk0UG1JTS85enMrb3dVSC9SY29xc3dVL3lsZlBwN0hlREFQUXlL?=
 =?utf-8?B?VStrMHBDSnlTNGVYbnoyNWNEVnFRZ0VGUG5tWkM0dnc2M09UYTFxUDJnUDBu?=
 =?utf-8?B?bDg4dlY4YmZ2Nnp1SVdxbFgwZTdXMXpwcytQMnFKa0Y3UUJaalJVOE03bzF0?=
 =?utf-8?B?dk92ZjZ2TElmbDVwMnlaSVBacG9XWlNzdGdSelVETHlNak5CS01JeTVwQk9a?=
 =?utf-8?B?MTh2bUI2TEZPOENpOUVadGJxT1E1VVBleFEveGh3cDE3Nk1PWnZBbGZzL3Fr?=
 =?utf-8?B?N3ArekpqSUdTNVJPSFlkaGVzMStSTHVPeExsNGt3NEN6cXpMcDBWRzFuTHNR?=
 =?utf-8?B?ZU5YZ2ZHN1pXK0wvZFBkQWt0RTB2N3NjV2EzZy8wNzJFVENNbWl4NlFXbXJm?=
 =?utf-8?B?dk5NS2l4SXRpdGJNY3IxM2JSRm1Da3ZsT1BLOUZFQ2diYjVTRmFEaUgxRzZp?=
 =?utf-8?B?YzhPS3Fya0k5VTJoc3Y4aWFjOGhLbzkzTHNYUHhmdnZFSitWaExOUGsrNm5S?=
 =?utf-8?B?T3F4Q3lvWG0yTWtpa2pGeHB6V0h6UmxjNWRFTVlGSmM4cmNpVWNsRXVXeUFV?=
 =?utf-8?B?QUtSa1M1b3Y0bjlmSnhvMEQxOUVxZ05CWkU2RFNGQXNra2k1cFVsMDFhVWY3?=
 =?utf-8?B?N3I5UXU2ZUc1TEFvQ3RoZ1ZaK0toYmhCa0xEZnl0cHdqU01sQm5WQlhqUnBy?=
 =?utf-8?Q?zw+jFvcUvt8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6666.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bUdpaUg2WmsxeFc3ZlFFT203d1grRHE1NW42RHBjVjh6RUs5L3lIUXpqSHBT?=
 =?utf-8?B?Q0RwVzVjRzJ0WHhKWG4vejJwOXl3WlFmVG1kaHVwVWE0Rm9XaWFtd3VFRFQ1?=
 =?utf-8?B?TzU1enVEc2dFcVdsOW53NG51ZlpRWWZlYVNiVG1McVYxRXpjeVdjZVB1dCsx?=
 =?utf-8?B?dk5ScFpoWWJpT1o2OSt5emVkNlpEWEVpckJFL1oxRk1UblBMQXZuS0pQQlNX?=
 =?utf-8?B?Q281YW85ZHMxY1puRjA1c3l1TjhMQmU1TG1XbEJVbExSMlh2NXlIbm1oQWF2?=
 =?utf-8?B?Qitla2doa3hCdFVheFUwc3V3OHNNZHE1YnpBWkQ0eDFVZzdpNXc1aVZvR0pV?=
 =?utf-8?B?SllmMDk5Z1ZycnNUVjh5bFdmQjBkZm85NmRjR3BGQmpJWVhrTzZJYTI0OHlJ?=
 =?utf-8?B?RUhmZjhSYVU4ejg0OXhtb29PeTd4TDBEMnpUSFZIaDRBdlJnVkx5VHprMmt5?=
 =?utf-8?B?azBHNEVQQ2pmUXJybEFiaEgyTTRldzJhS1RnV1pJazVsQ0d2ZU12Sk1hQ3Q4?=
 =?utf-8?B?M3RCWi9CWDNWcUlrMlEvZHhwZ0JFaFBPSlF6bGRVRnpBdUJvdWNkVVRQbDJW?=
 =?utf-8?B?QVlQQ21sajdZdzNYSS94ZVVQc3M3ZDNrc1FwU3Ziazg1LzNROURFczFLdDFN?=
 =?utf-8?B?SEtmcDg4T1JnODBuN0tDdnhSQ2dVVmZ4QkRzckdZc21VWUlrVDRXSzl2M2Vh?=
 =?utf-8?B?NnlwaFU4Q1lEQVV1WlV1bWs0dklmdHA3M2c0T2pINmxqbnRIQzZpblVPd2hI?=
 =?utf-8?B?MWhhQXJ3K2Z1eXNTQ2lodlIvV3drM3J2SVczMEtvbDZ3ZVNwWXdadXlLSFRw?=
 =?utf-8?B?elBFZUdhUEdnbXJESnE5dDdBdHg3amhCZUpJNVFiZjl4RDUvTDlwUUFFaFZD?=
 =?utf-8?B?VEkrVFJJSXR3VDhIUnN6dzBMK25hM01TUnU0Mk9JeTNPdVAreFgwMmoyYkY4?=
 =?utf-8?B?SURFSk1RaUNkMHREdVkzaTNuVEdnWC9SVnhoaVVqbFNXbk9zZ09aL3hROWh6?=
 =?utf-8?B?Z0tUa011TUFiRWNoTnZVQ01rZW5hSzJWNlZ5ditLbHNiRGhLWTZIUVR5Y1po?=
 =?utf-8?B?OEl1RjIzckYzNWpEK0svQU5Yckl3Mlh2cmN5bFRIcThpN3N5VDBDczJkRVly?=
 =?utf-8?B?VG43STRvcnlXYTBPeVpKcEd4b0RhZ1JsOHQ1UGhzQ0hTbG5TTXVpM3diQWxJ?=
 =?utf-8?B?Q0h2WDZSQnljbEhFRmN6emhkYUVBcDFWeU8vTWJ4bkJkU21KQnR4aEdETXhB?=
 =?utf-8?B?emxwaUpkN1N5RThEclBjbnZVSGYxbzhubnJlQlI5NzBPWFBQb204NnZtenFQ?=
 =?utf-8?B?R0dLd04xT1I3N0pNVjBNR004dHE3VWdrTzRwdG9oZUlWNFVIL3Exa2NGQm16?=
 =?utf-8?B?SUhZM21sbjVZWlYxUTEzNFVjaU0wSlY5cmppbjcxZVAvYUNvdFlQT0xENWdD?=
 =?utf-8?B?MUNNNVVmTzI2RWlSVDdHRk5UMGY4WmlTUUVSd0NyWlJ4RE1ZK28vU2NydGYv?=
 =?utf-8?B?cHdad1lmZWJMRm56RXVuS1YwSW40Y29TS1NKcVMyRjI5VStrUE1KaXpwbEw5?=
 =?utf-8?B?OXNPWlprSVl4THZHSjVxNVp0b2hPcS9aU1kzbDBPYUlwRENJUko2SjIrd3JH?=
 =?utf-8?B?aGJGRTZWYkxjZ0wreE52RG5lSldIcXI5cHZpN0UraFJoT2VsZ2pCbEhJemtj?=
 =?utf-8?B?ZU84M1U4THZOZW1LbjNWK0xBdW12QVpwSGVDSFJ4azBGWnY5L0c4Qi9ENkNP?=
 =?utf-8?B?TGJ6VXZhY1doQUhQeUN2bXMyaWN3bEFvOTVqaWdCZXgrbHhUNkF2TkZNRGdZ?=
 =?utf-8?B?ZVp6cHB6aUVSZ1craEthT1lwN1BqZ1dtRTYxUlZaVFpiZHhLUXdzclNBNnht?=
 =?utf-8?B?WERSaVU0bjRyNVVDY1JaVGZ6Qk45NThVakozZHAwVmgyTytBTjlhd1hGSGdr?=
 =?utf-8?B?MmVCOWN4VDM2ZXAzbndEdW9SaUtiM1FLcys5SjZkaS9MNmlpSEJJaTRhOTJa?=
 =?utf-8?B?UWNYckNaaGxYUGFwOWRmM0VZQ24zdnRuNUdYYnFPWFJ1NU5oNElsb21EaDZq?=
 =?utf-8?B?QXJrZEdHRDV2Umw1Y0YycmFUeVNJbWdOVDlEMmVpdklja0lQSjJLcEYyK2g5?=
 =?utf-8?Q?tpWGKnYPm0iKP0VZgtRDkfR4e?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6666.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71135e6e-a618-4ccb-ea4d-08ddaf1502c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 09:38:13.1726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pLJsYNcvdKs4JngjXXhPlxnCwY90p37DxJz0DaFLQeFyDQG6I+MrYtUO6m/Usf0iI/k4Ea8RNfg7NhvtzjWRo3zYjJbscPd7WyZxeQFrOHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB7425
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Jun 2025 09:38:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7109

VGhhbmtzIGZvciBsb29raW5nIGludG8gaXQuIEknbGwgZml4IHRoZSB0eXBvIGFuZCBJJ2xsIGNs
YXJpZnkgdGhlIGRlc2NyaXB0aW9uLCBleHBsYWluIHRoZSBkaWZmZXJlbmNlIGluIGEgY2xlYXIg
d2F5IGFuZCBpbmNvcnBvcmF0ZSB5b3VyIHN1Z2dlc3Rpb24uDQoNCkRhbmllbA0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFudG9uaW4gR29kYXJkIDxhbnRvbmluLmdv
ZGFyZEBib290bGluLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIDE5IEp1bmUgMjAyNSAxMToxNA0K
PiBUbzogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+OyBkb2NzQGxp
c3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtkb2NzXSBbUEFUQ0hdIEFkZCBT
UERYX0lOQ0xVREVfQ09NUElMRURfU09VUkNFUw0KPiBkb2N1bWVudGF0aW9uDQo+DQo+IFtZb3Ug
ZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gYW50b25pbi5nb2RhcmRAYm9vdGxpbi5jb20uIExl
YXJuIHdoeSB0aGlzIGlzDQo+IGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0
U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPg0KPiBPbiBUaHUgSnVuIDE5LCAyMDI1IGF0IDEwOjUy
IEFNIENFU1QsIERhbmllbCBUdXJ1bGwgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gd3Jv
dGU6DQo+ID4gRnJvbTogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+
DQo+ID4NCj4gPiBBZGRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIG5ldyBmZWF0dXJlIHRvIHN0
b3JlIGluIFNQRFggb25seSB0aGUNCj4gPiBjb21waWxlZCBzb3VyY2VzLg0KPiA+DQo+ID4gTWVy
Z2VkIGluIE9lLWNvcmU6IGM2YTJmMWZjYTc2ZmFlNGMzZWE0NzFhMGM2M2QwYjQ1M2JlZWE5NjgN
Cj4gPiAgLSBzcGR4OiBhZGQgb3B0aW9uIHRvIGluY2x1ZGUgb25seSBjb21waWxlZCBzb3VyY2Vz
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVy
aWNzc29uLmNvbT4NCj4gPiAtLS0NCj4gPiAgZG9jdW1lbnRhdGlvbi9kZXYtbWFudWFsL3Nib20u
cnN0ICAgICAgfCAgMyArKysNCj4gPiAgZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxl
cy5yc3QgfCAxMyArKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0
aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RvY3VtZW50YXRpb24vZGV2LW1hbnVhbC9z
Ym9tLnJzdA0KPiA+IGIvZG9jdW1lbnRhdGlvbi9kZXYtbWFudWFsL3Nib20ucnN0DQo+ID4gaW5k
ZXggZTY4MDZjZTkyLi5jYTBmYzhiOWQgMTAwNjQ0DQo+ID4gLS0tIGEvZG9jdW1lbnRhdGlvbi9k
ZXYtbWFudWFsL3Nib20ucnN0DQo+ID4gKysrIGIvZG9jdW1lbnRhdGlvbi9kZXYtbWFudWFsL3Ni
b20ucnN0DQo+ID4gQEAgLTYwLDYgKzYwLDkgQEAgbW9yZSBpbmZvcm1hdGlvbiBpbiB0aGUgb3V0
cHV0IDp0ZXJtOmBTUERYYCBkYXRhOg0KPiA+ICAtICBBZGQgYSBkZXNjcmlwdGlvbiBvZiB0aGUg
c291cmNlIGZpbGVzIHVzZWQgdG8gZ2VuZXJhdGUgaG9zdCB0b29scyBhbmQgdGFyZ2V0DQo+ID4g
ICAgIHBhY2thZ2VzICg6dGVybTpgU1BEWF9JTkNMVURFX1NPVVJDRVNgKQ0KPiA+DQo+ID4gKy0g
IEFkZCBhIGRlc2NyaXB0aW9uIG9mIHRoZSAqKmNvbXBpbGVkKiogc291cmNlIGZpbGVzIHVzZWQg
dG8gZ2VuZXJhdGUgaG9zdA0KPiB0b29scw0KPiA+ICsgICBhbmQgdGFyZ2V0IHBhY2thZ2VzICg6
dGVybTpgU1BEWF9JTkNMVURFX0NPTVBJTEVEX1NPVVJDRVNgKQ0KPiA+ICsNCj4gPiAgLSAgQWRk
IGFyY2hpdmVzIG9mIHRoZXNlIHNvdXJjZSBmaWxlcyB0aGVtc2VsdmVzDQo+ICg6dGVybTpgU1BE
WF9BUkNISVZFX1NPVVJDRVNgKS4NCj4gPg0KPiA+ICBUaG91Z2ggdGhlIHRvcGxldmVsIDp0ZXJt
OmBTUERYYCBvdXRwdXQgaXMgYXZhaWxhYmxlIGluIGRpZmYgLS1naXQNCj4gPiBhL2RvY3VtZW50
YXRpb24vcmVmLW1hbnVhbC92YXJpYWJsZXMucnN0DQo+ID4gYi9kb2N1bWVudGF0aW9uL3JlZi1t
YW51YWwvdmFyaWFibGVzLnJzdA0KPiA+IGluZGV4IDVjMThiODUyZC4uMzlhMTM0YTA5IDEwMDY0
NA0KPiA+IC0tLSBhL2RvY3VtZW50YXRpb24vcmVmLW1hbnVhbC92YXJpYWJsZXMucnN0DQo+ID4g
KysrIGIvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QNCj4gPiBAQCAtODc2
NCw2ICs4NzY0LDE5IEBAIHN5c3RlbSBhbmQgZ2l2ZXMgYW4gb3ZlcnZpZXcgb2YgdGhlaXIgZnVu
Y3Rpb24gYW5kDQo+IGNvbnRlbnRzLg0KPiA+ICAgICAgICBpbWFnZSksIGNvbXBhcmVkIHRvIGp1
c3QgdXNpbmcgdGhlIDpyZWY6YHJlZi1jbGFzc2VzLWNyZWF0ZS1zcGR4YCBjbGFzcw0KPiA+ICAg
ICAgICB3aXRoIG5vIG9wdGlvbi4NCj4gPg0KPiA+ICsgICA6dGVybTpgU1BEWF9JTkNMVURFX0NP
TVBJTEVEX1NPVVJDRVNgDQo+ID4gKyAgICAgIFRoaXMgb3B0aW9uIGFsbG93cyB0aGUgc2FtZSBh
cyA6dGVybTpgU1BEWF9JTkNMVURFX1NPVVJDRVNgIGJ1dA0KPiBpbmNsdWRpbmcNCj4gPiArICAg
ICAgb25seSB0aGUgc291cmNlcyB1c2VkIHRvIGNvbXBpbGVkIHRoZSBob3N0IHRvb2xzIGFuZCB0
aGUgdGFyZ2V0IHBhY2thZ2VzLg0KPg0KPiBzL2NvbXBpbGVkL2NvbXBpbGUvDQo+DQo+IFJlYWRp
bmcgdGhlIGRlc2NyaXB0aW9uIG9mIFNQRFhfSU5DTFVERV9TT1VSQ0VTOg0KPg0KPiAgIFRoaXMg
b3B0aW9uIGFsbG93cyB0byBhZGQgYSBkZXNjcmlwdGlvbiBvZiB0aGUgc291cmNlIGZpbGVzIHVz
ZWQgdG8gYnVpbGQNCj4gICB0aGUgaG9zdCB0b29scyBhbmQgdGhlIHRhcmdldCBwYWNrYWdlcywg
dG8gdGhlIGBgc3BkeC5qc29uYGAgZmlsZXMgaW4gLi4uDQo+DQo+IFRoZSBvbmx5IGRpZmZlcmVu
Y2Ugc2VlbXMgdG8gYmUgInRvIGJ1aWxkIi4gWW91ciBkZXNjcmlwdGlvbiB1c2VzICJ0byBjb21w
aWxlIi4uLg0KPiBzbyBJIGRvbid0IHJlYWxseSBnZXQgdGhlIGRpZmZlcmVuY2UuIE1heWJlIGJh
ZCBwaHJhc2luZyBpbiB0aGUgZGVzY3JpcHRpb24gb2YNCj4gU1BEWF9JTkNMVURFX1NPVVJDRVM/
IENhbiB5b3UgY2xhcmlmeT8NCj4NCj4gPiArDQo+ID4gKyAgICAgIEVuYWJsZSB0aGlzIG9wdGlv
biBhcyBmb2xsb3dzOjoNCj4gPiArDQo+ID4gKyAgICAgICAgIFNQRFhfSU5DTFVERV9DT01QSUxF
RF9TT1VSQ0VTID0gIjEiDQo+ID4gKw0KPiA+ICsgICAgICBBY2NvcmRpbmcgdG8gb3VyIHRlc3Rz
IG9uIHJlbGVhc2UgbWFzdGVyLCBidWlsZGluZw0KPg0KPiAnbWFzdGVyJyBpcyBub3QgcmVhbGx5
IGEgcmVsZWFzZS4gQ2FuIHlvdSBzaW1wbGlmeSB0byAiQWNjb3JkaW5nIHRvIG91ciB0ZXN0cywN
Cj4gYnVpbGRpbmcuLi4iPw0KPg0KPiA+ICsgICAgICBgYGNvcmUtaW1hZ2UtbWluaW1hbGBgIGZv
ciB0aGUgYGBxZW11eDg2LTY0YGAgbWFjaGluZSwgZW5hYmxpbmcNCj4gPiArICAgICAgdGhpcyBv
cHRpb24gY29tcGF0ZWQgd2l0aCB0aGUgOnRlcm06YFNQRFhfSU5DTFVERV9TT1VSQ0VTYA0KPiA+
ICsgcmVkdWNlcyB0aGUgc2l6ZQ0KPg0KPiBzL2NvbXBhdGVkL2NvbXBhcmVkLw0KPg0KPiA+ICsg
ICAgICBvZiB0aGUgIGBgdG1wL2RlcGxveS9zcGR4YGAgZGlyZWN0b3J5IGZyb20gMkdCIHRvIDEu
NkdCLg0KPiA+ICsNCj4gPiAgICAgOnRlcm06YFNQRFhfTkFNRVNQQUNFX1BSRUZJWGANCj4gPiAg
ICAgICAgVGhpcyBvcHRpb24gY291bGQgYmUgdXNlZCBpbiBvcmRlciB0byBjaGFuZ2UgdGhlIHBy
ZWZpeCBvZiBgYHNwZHhEb2N1bWVudGBgDQo+ID4gICAgICAgIGFuZCB0aGUgcHJlZml4IG9mIGBg
ZG9jdW1lbnROYW1lc3BhY2VgYC4gSXQgaXMgc2V0IGJ5IGRlZmF1bHQNCj4gPiB0bw0KPg0KPg0K
PiBUaGFua3MsDQo+IEFudG9uaW4NCj4NCj4gLS0NCj4gQW50b25pbiBHb2RhcmQsIEJvb3RsaW4N
Cj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPiBodHRwczovL2Jvb3Rs
aW4uY28vDQo+IG0lMkYmZGF0YT0wNSU3QzAyJTdDZGFuaWVsLnR1cnVsbCU0MGVyaWNzc29uLmNv
bSU3QzIxM2I5ZDAyODViMzQxMmYNCj4gYWZlZjA4ZGRhZjExOTIzMiU3QzkyZTg0Y2ViZmJmZDQ3
YWJiZTUyMDgwYzZiODc5NTNmJTdDMCU3QzAlN0M2MzgNCj4gODU5MjEyMTc5MDM3MzE5JTdDVW5r
bm93biU3Q1RXRnBiR1pzYjNkOGV5SkZiWEIwZVUxaGNHa2lPblJ5ZFcNCj4gVXNJbFlpT2lJd0xq
QXVNREF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRXRnBiQ0lzSWxkVUlqb3lmUSUzRCUz
RA0KPiAlN0MwJTdDJTdDJTdDJnNkYXRhPWc2bVoxZ2lPSWFSJTJCQm9GanIxcnloMFM0QWI3MGs1
UTVWR0NneXNrVVNKDQo+IHclM0QmcmVzZXJ2ZWQ9MA0KDQo=

