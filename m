Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198DDC531D2
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 14:27:12 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24798.1784816821565539208
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jul 2026 07:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=hi/scEvG;
 spf=pass (domain: ericsson.com, ip: 52.101.83.9, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d03d7AcEljjstLWmOIkIZKh9zjFNkH4xpWpSi52xjgPCw1/Egr/ekThqQuzcz8VeE92i+9eZK782xvsQb7+LNMNgTsK0bt2Z4AbL2V9GPV6dfoGc29GDjmORXRBdySXBv6VI/+fyVVXbzvSb5b6oiahxM8udez+32jAwNKy9H0HUcHx6d9npLmQtQyxA6y3Oyz4QSocjtk/uzmyqnTcnWqAWZj7anIJQ8z+hVRlWmvWaZzxE5GNxbrdlhGG8qzGTCN2PQ+xZXCEfiXbiob8rCFtItRzU89yR+zI5wFm0CWeNs4X9JBqDT0GEkjcpJzPBzfI24a3o9W3sBOJMLsRBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOloj4504bdeXYWBHHlanQeucuhS2kSWNVqGZ7y2z48=;
 b=Jyf39mnldJ2Xa+kp/isd5fzhP4XK3uYB5wkV64LwnxvcmFG3UioozMFSYdPvPQNcjNzKYvifQXqE38kPzCBvpDHeYytaO29wQ/QNVVRPh0cN+UDADqxibSOoqImOYWOHXM1GVahK7nOWYuaT4KB8uWhR7SACkEwtRTV5CQpNb+8N0O0Ij2pbpqpVvThHE0vVYMMRaFjoWW54Nwr5QWz0ei8myVXbgOLu17WVAO2uHvgozJstZ9yDK78vHFFwId3MxCfDpwGua0pVf5p7U2MBMpe1drxQZgGMgh3pr0D1KndbR5dB28XhjgKhO/7FPYE5T2Weo01uaEmJ74wF7T53Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOloj4504bdeXYWBHHlanQeucuhS2kSWNVqGZ7y2z48=;
 b=hi/scEvGUfRNWz0+KfpvXOmhdjvGaw6miKgvRh32qumCVw/ABfuLZR8t44IiN4qgmUYINQjtL/z+Xs2/au/W24UgPn2HT8uaN8/bRg5UXtYmHNvvTSyMAml38thPg5cOqR+/+hFRzqFDfHd+ijAb6xiPIVyuytceSXMqA4aC0tATVEIxQ9NdqpwpNebCk6SDTrCQMVvSGC55lZDXQ+joD4QMgo1jFzxrIQF1H8C1Rk3U8tUR6TJlwWlhquvAvDTnAiGOCMSSnXNgVpuwywn/VtRrMbh6DU3cvLtNpxlm6GIiQmLFFXTJr4V2HjJDTlTNXg6BRr5CcZhaHkc9K23YEg==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by VI1PR07MB6509.eurprd07.prod.outlook.com (2603:10a6:800:181::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.6; Thu, 23 Jul
 2026 14:26:55 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 14:26:55 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"paul@pbarker.dev" <paul@pbarker.dev>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>, "antonin.godard@bootlin.com"
	<antonin.godard@bootlin.com>, "Randy.MacLeod@windriver.com"
	<Randy.MacLeod@windriver.com>
Subject: Re: [docs][PATCH V3 3/3] ref-manual/release-process.rst: add patch
 acceptance policies and stable point release upgrades
Thread-Topic: [docs][PATCH V3 3/3] ref-manual/release-process.rst: add patch
 acceptance policies and stable point release upgrades
Thread-Index: AQHc/iRYs3HKrSKKt0uEIZ0WB9wh9bZ7VkYAgAALcYCAAACeAA==
Date: Thu, 23 Jul 2026 14:26:55 +0000
Message-ID: <a5d35ab2c3edde68e4edf81ecf48ce5edeb8fb37.camel@ericsson.com>
References: <20260617064116.2672321-1-Qi.Chen@windriver.com>
	 <20260617064116.2672321-3-Qi.Chen@windriver.com>
	 <32c35bd7cc547bd2228323fea58a2c84c88476c7.camel@ericsson.com>
	 <CANNYZj_Zxr9o5J11L0Bmm472Q+VXppQ7oNgft0RZr-5_nXdnQg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_Zxr9o5J11L0Bmm472Q+VXppQ7oNgft0RZr-5_nXdnQg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|VI1PR07MB6509:EE_
x-ms-office365-filtering-correlation-id: 54decaa7-dd31-4b5a-d5c8-08dee8c67250
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|10067099003|11063799006|4143699003|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info: 
 x3698s5Mq03GgW+ILZxgSsfUsLZ7cszNUm38caa5rX4q0B+guv7HZw4HyagWBfeno2SFnhnUYwREljeaknlyzPBdJ2OFQG7PQDlva5kLfTIA6j7KKIdifBTJLklfMcWkqOdW/Tg6ac+cAlsXYKeoO//tGkOSC2MN5h/Ti7jQ2J5xt4pA4aIlKd8F4vsK2Cz+vOfbQz6tfXhRLky93aEPksEyxhFwDPtz/5oIUiBEmCprysdcGwUSd9D7hHv8NsW38SPF5hHm3QERBv0xZeZIKkCWSpzQ4tGsZFJru+Hn55wR2xhon7yg9LhhnfWFESSyU/IFkwIv7agxZS2qsprwngzkKLpCqL2/LB5r57fErccPjz3y4ylsE51ccmttFrHKU251j8wiBDPZ8y+jXNL1ajc0xkMBVcqQ3xAmAGdavP+mUe2n7UkZLvm7+KZz11HtaCpBeVM6T96zIf8c5g+84rLUBEPWk/IvZ7g66ymYeZkOC843NTUiXElKDIrE8rqj4RTCM1pc70QI1WV3zhMENsxpbwonCzMeCM6NIUlkN0F4QLEwVLFDoftjQ5cNVlnb0h4aUjXxGof3vt6zsjAYqfdt7tehy8/dGNRWUeBy9BminnZf1MvG/aIpm+pZPX9Btrex2N5Znz2Z/CSCZthrbcqTL04tEmqJfcdvqAU1tRW1EAJGZV2jezH3nAikIqLuUTb12Vbp7Zhgk/U4iB8RyQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cXBVSHE3S3JUc0Q2Rlk3QXlONWh5SnNmUnIrY3dXQXFMclNRdjI4S3hxaE8z?=
 =?utf-8?B?RWhqRlV5L2lsU0RQTWpuT2pkbUZndG9XV0hvZG5XM3ozd2dPMHZoRUlLMmdP?=
 =?utf-8?B?QVdBbFRMUXAxc2lTN2x6WTB2SWdnU1BHQzlYK2dmeU83bGNWdDF6OEk0eDBN?=
 =?utf-8?B?UU11TGxHYVVjVmZnenVMS1k5ZTdSL21VZWF5MVMwN2d2Mkkwd09wcTdKaXhL?=
 =?utf-8?B?bHFCNUJmYjZGM2kyeXdIREV0R1JKbDAvWFNRN2E4OVNaUWVGNDB2dWpnWXBt?=
 =?utf-8?B?RURpcmVobjhyYXpQRWU5RDV3ejljWEh1Q1E2L0xCd3RPZjltQ1RwL29WTzJC?=
 =?utf-8?B?MjR2ajB3bkRIbGN4RmQvK2F5NHk4Tld2NlVBNXdja1VvTUdBN0dlODBBcE5q?=
 =?utf-8?B?Z3IyTUordFpuNTFhaEFGSzQ0K3hvSG1BVzBkaCtYMzE0ZTVnTm9nMG83bUdl?=
 =?utf-8?B?cmdtaXc4aDY4T1RiZi8zd2N3N0dodGJpRVM4WFArdUFKVGh0RHFTK2czK2E3?=
 =?utf-8?B?clltMzFtbmMrdTQzVmg2blFyZ1BFdVdUODZ2YWtyYlJ6SzBoOXd6ajBUQjFS?=
 =?utf-8?B?WUFrTWZ4Y3lROTFXaW40TzZFVTdORnBjUSt4OE51a1N5YkhkM3pTdGRjczkv?=
 =?utf-8?B?WWZpL2svd1ZxaEhvWXRvcGVpUlpoalRMc0wrLys0MU4ycTdOS2hsNFJESEdw?=
 =?utf-8?B?S252cXVGRHJHNUFKTGdwcldpem5lcnh6U21EbVRRaTMrV3U2dWxBbmYreWJD?=
 =?utf-8?B?T2Jtdnlhb3JoS1Fzd1BPbDBlY0RTeW5QWExxSzVEa2pRZVJxNG9JZnY1T0Fs?=
 =?utf-8?B?OU1QdVcvRTRsLzRDQzFCaksyeWd6TmlnZDFMTFJxN0NLUE9WTHdxazZ4QkdZ?=
 =?utf-8?B?czFoMHhjNGpsamhUVTdQVU1hb29RYURFQXB0UUFuMUY2dUFyU1VUYmZjRUlU?=
 =?utf-8?B?ZVd4eDkxditHRmU1UUZPNVRDUjh1MUZHODVkZ011ZzV5Q1U2SUl2VWhmNGNT?=
 =?utf-8?B?em1kVUlLeERaZjl5WDNqbTdIQ3FoM2lER05JMjY2MVZpUkpHOWFKZ2NES1pL?=
 =?utf-8?B?VmJxOHBBbXlGd1pNNEhWaDJUbkN2cW1RU1hxRWNJK2FBQ0plc0tubXFQOWlv?=
 =?utf-8?B?elY0MTNwWXBJOGJIbmU0WHAyQzArQWNVL2I0bTNhdjNkc2RJUnRHZXVLL1Rq?=
 =?utf-8?B?d3lMNWsrRjg1dnJwclQyU0djRFg2cVI2V0duYmI0TDhjUkV5dGwwZHZrbWZ1?=
 =?utf-8?B?TEVSY1hMUlA3N0QyWDZXb2JUWEtWUnJBT2I5WGtTUGNBZWFSRlcxcGZnc2Qz?=
 =?utf-8?B?THFuS1JCYVRscWd3NDZ4QVpTU2x6eEUrckZjT2hiajlHMlVuWjlYTktZVTdq?=
 =?utf-8?B?b3JxeHBDMk9HNUVITXA1dzlxRkFYR0dqWWpYb3EvQ1Z6TlZnZlRRMERTWWM1?=
 =?utf-8?B?R3RVQ0dySk9iUEJ6UFZsVEFHbzBhMzl1QXdkUlh0THZsOHB1NW5sU0lPYjFI?=
 =?utf-8?B?ZktxWWFZV2lCREdBQUkyRnRDbWFTbEJ0Z1NFT1FRbllzYWZFbDBCWGJmNnBF?=
 =?utf-8?B?WFlvanExSFNldnF6dXF1LzgxVGV5RHRnK3BUTytOa2g4eENjREd4bEk3bW5n?=
 =?utf-8?B?RGl2SFhxY1hSUUxSdmZBZHRCSitxSm9zckEzNHRGTHNwVnRmNmlpbTdoMTM4?=
 =?utf-8?B?RWVqbVhhTlpvUk9HTnljc25Wd1lpTmJ1QmJOYlpJVS85dlFTN015YjJCUGYy?=
 =?utf-8?B?K1BuRnpTOXdVb3hWa3E2a3BtcXVJaThEcllVcElKU3lmbEpCd1pnZFB3dzZJ?=
 =?utf-8?B?WXFiQVFnTE4vUkVnUkRENnkvVUc2cEU2MlZ5SEU0SWhqMEFaUjlWNjdyVHcx?=
 =?utf-8?B?Sis4UExyTkd3L0xXbFg0L1NaNzJGZFdmeFNpdWhLdkVDakdFSXdWVkE1RU85?=
 =?utf-8?B?NjBabVdEUVhwRHNCTmR4QkFHVlFxR0svVFlWUVNhdjFWMjFNOUdTV29xSXg3?=
 =?utf-8?B?TE1MZzJZRU1TejVtMXF5aW5Kb1ZCV254V3J3Y2FmUHBYYmtoY3FPSjZlYjJz?=
 =?utf-8?B?N3kvT1BZL2JVdEovaVZrTVVJZjBpeWgvZlo3V3FmRlcwaEFMM3RVK1JoQW96?=
 =?utf-8?B?R25yZmNoUHRSNWxYYWp5aU05Z2drQ3R3YldBNCtSZktBd0o1UVhLYmVMUmJm?=
 =?utf-8?B?K3dsbnZNcVJFRkpHSlZrUG41TEE2cGFCcFh3VVBlaWV3OWNucFhkN2lFdk1p?=
 =?utf-8?B?VEVyT2JiR29obVNablFNUkZJUTRKMVlHaFEwdG9GZHN2cUJnbnc2L2wyeTBl?=
 =?utf-8?B?cTIvZ2NZQnN1aDhtL0RzRGdRR0RmTWkyZEl0RnZsMWxMa25lOEFZNEhSK0lr?=
 =?utf-8?Q?wykVJ7cvbrOUeiQQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A777DE0E958B0642A3AF772AA56ABA24@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54decaa7-dd31-4b5a-d5c8-08dee8c67250
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 14:26:55.2238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JjsSiHcjjl7WzreRF51EOBYAzRxyam/dGyQ0+tLWGGVw7RDdR8JMT153qiZKKlwrtRCIAaw75xsWztfVVRaH8lvMKSN14ux7QT3/O1ZBFYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6509
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jul 2026 14:27:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10122

T24gVGh1LCAyMDI2LTA3LTIzIGF0IDE2OjI0ICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gVGh1LCAyMyBKdWwgMjAyNiBhdCAxNTo0MywgRGFuaWVsIFR1cnVsbCA8ZGFuaWVs
LnR1cnVsbEBlcmljc3Nvbi5jb20+IHdyb3RlOg0KPiA+IFdlIGRpc2N1c3NlZCBpbiB0aGUgWW9j
dG8gbWVldGluZyB0aGF0IEkgd2lsbCB0YWtlIG92ZXIgdGhlIHdvcmsgaGVyZS4gVGhlIHBhdGNo
IGhhcyBiZWVuDQo+ID4gYWxyZWFkeQ0KPiA+IG1lcmdlZCBpbnRvIGRvY3MgbWFzdGVyLCBidXQg
SSBoYXZlIGEgY29tbWVudCByZWdhcmRpbmcgVXBzdHJlYW0gbWFpbnRhaW5lciBjb25maXJtYXRp
b24uDQo+ID4gDQo+ID4gU2hvdWxkbid0IGJlIGVub3VnaCB3aXRoICJVcHN0cmVhbSBzdGFibGUg
YnJhbmNoZXMgZXhpc3QiIGFuZCAiQ2xlYXIgaGlzdG9yaWNhbCBvciBjb21tb24tc2Vuc2UNCj4g
PiBldmlkZW5jZSI/DQo+IA0KPiBUbyBtZSBpdCB0aGUgc2Vuc2libGUgY3JpdGVyaWEgd291bGQg
bG9vayBsaWtlOg0KPiB1cHN0cmVhbSBzdGFibGUgYnJhbmNoZXMgZXhpc3QgQU5EICh1cHN0cmVh
bSBtYWludGFpbmVyIGNvbmZpcm1hdGlvbg0KPiBPUiBjbGVhciBoaXN0b3JpY2FsL2NvbW1vbi1z
ZW5zZSBldmlkZW5jZSkNCj4gDQoNCkZ1bGx5IGFncmVlLiBUaGUgT1IgaXMgaW1wb3J0YW50LiBO
b3cgaXQgc2VlbXMgdG8gbWFuZGF0ZSB0aGUgMyBvZiB0aGVtLg0KDQpEYW5pZWwNCg0KPiBBbGV4
DQoNCg==

