Return-Path: <JBezem.extern@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4BBC47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 13:04:34 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.83])
 by mx.groups.io with SMTP id smtpd.web10.12463.1709125463978627166
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Feb 2024 05:04:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arri.de header.s=selector1 header.b=C9aA/ANN;
 spf=pass (domain: arri.de, ip: 40.107.7.83, mailfrom: jbezem.extern@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjxrY4EssM2A9MGLFH7E6M1tpcZoZXBeSxYKYamanzwT31xCxCkU9IMUnhveTS7vGpu/chLWBNI8NjI3KKL5e3wrDUkGD9aaPYieTCpkRg6h0V2KI9K2rPP9nIrCDXHHXthZkZy2o7bYcD8j1IksFrhkBp8VZmEEROYBuWMrW84fzn1BwhOim5/Iqv82kRY7wcsfIoP+UXgh5K4zpZdPZscxELe6JrRDtt79+P+gxFiSG8FR3/+IkV8OGzx70CKEtUT22JcHjxwcQKvf7Y0LhI2dFD21RNqS/Ic1mertYKJOnCu57yaSA0nPQRmD/sY9VKjAlwvtgMbZo9eAZ9vSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+MksydJwabToqPc5oFf3NQNluWf7Y136XpYlgj0yJw=;
 b=bmfLnr5b4az7XyFHRfzfxd1co4qqZRkxSPIM7ndGinGevQeb2nZFottavKRXZ4Li4YlRM4whyYb1EIedxKvqBC28yvolKhoD63hYu/2/JYX8JldESePpU73xDPdvw05XKerPN4PhU7Z7ZLr5/J07tjbXuPclFwzEBWdcvKc/+PUrW2c9j2rqq6ZWnz4SKf2CV6BEwfgnjUq1R1K6gAIWd0e9qC9hTGgL/iG3uAwSaXH8wyTHjFQVm+PnGHrk2Bteq6PRfeH1YcUqCteZbo17q1T7tswxmJbDsy1m/ocOb0JOgh91/HpghXkvF4HPL6z0XwzjV96oa8AyL+NxhXVo5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arri.de; dmarc=pass action=none header.from=arri.de; dkim=pass
 header.d=arri.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+MksydJwabToqPc5oFf3NQNluWf7Y136XpYlgj0yJw=;
 b=C9aA/ANNFLo34jfMyWLo95HhTU+P/geYCRHF4/o4WBLHf1tdBHDEjIp6wO8M9oekr9qsyCloYYf3Hshv5qef5FSwIeHAICnugdw9qk7d5i47FoOJ7v7hCms/hZHirOZhzkCCAeF7l8bHgZTxwnc5J9/AwWKJXQUUhS9xFXjrlE0=
Received: from PR3PR07MB8243.eurprd07.prod.outlook.com (2603:10a6:102:17a::6)
 by DBAPR07MB6744.eurprd07.prod.outlook.com (2603:10a6:10:193::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Wed, 28 Feb
 2024 13:04:20 +0000
Received: from PR3PR07MB8243.eurprd07.prod.outlook.com
 ([fe80::8f54:967f:d738:dffa]) by PR3PR07MB8243.eurprd07.prod.outlook.com
 ([fe80::8f54:967f:d738:dffa%7]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024
 13:04:20 +0000
From: "Bezem, Johan (extern)" <JBezem.extern@arri.de>
To: "michael.opdenacker@bootlin.com" <michael.opdenacker@bootlin.com>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] variables.rst: SDKPATHINSTALL correct installation
 default path
Thread-Topic: [docs] [PATCH] variables.rst: SDKPATHINSTALL correct
 installation default path
Thread-Index: AdpqRqMpQ/YGzkomSvKIN5hRqTXAvw==
Date: Wed, 28 Feb 2024 13:04:20 +0000
Message-ID: 
 <PR3PR07MB82435E8C803C061724597041FC582@PR3PR07MB8243.eurprd07.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB8243:EE_|DBAPR07MB6744:EE_
x-ms-office365-filtering-correlation-id: 4ab86866-199b-4879-f775-08dc385dc722
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gPzYYshiZJcVgwqeRQzAEyE7Kj2VeuAwmX6G/eQaVZ81lqiRaTQRjCU6SU//SOVb4ZBPrKvpzju0arUVliPqEIWXVBSgHcwfoGDhgyzKLU5HE/rnT0I/ix+Ti0NtJkTPeHsRTZxOiEUmiDXzt5TwuHj4GIKrKHKiRwiYcuU+s3lf14Vb9507sL+nFPXv+fOmO30EjiolL+Gz5w2xG5pfzrYXXtRktYdBafKNjBhEuKTbUIrKguKdJRlzieJN92ir2p50Ir9nxyFqTWFLlS390y53AHC0jZYPQ5aVdkoFA34G3GUlERbMcA6M2yu/mynJBebU2IDNRNbvrl67WC5oiIfU6p/VeqCuKAMSEzZC1wUq21ZDrO+rsZlRLvo9O9lQ2dVJPREWsFeov+mcaa0HhBhKhjax70oUhMbKTe8VWqHcaBBTyYATtyvxC6OtJh7ZqSflndHCBeFLlkj5+6C+00exdiIPFaFA/wCbRQ44A+XpTsvSKHOtBvF0Zn45h52WjMzcXK9+BxWtqBZGkxME5fhI4yVYXNzEn+i7vkwuNVxW0zCl2ckJUKo3uK1swTXNH7ekaGDB4GPwAldIZ+J/D6Yu8+bVhjVOVYuhxjxQgrsbEWM+eBdDs0DBJsM+MUkqUpm57rLZLrny89XhGowo705XZj0haofAz2HklYc5UFw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB8243.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M2cwdE9IMlRHdG5UQWIyUmtTN3htTXJNTkVFUzBHSmJMa3B4MjViUWlNamdV?=
 =?utf-8?B?ZXNUR2NKNE9KektXZ1pBRGJvZ3lUSTBrdHpVWVd1U3hhOExiUWl6bk4ybWFh?=
 =?utf-8?B?R2FvWlRPTVVuamZuelZ4dzlXdVV4SWE0dUR1QmFrUXhTK1hGb21XTU9jV1Bh?=
 =?utf-8?B?MzdPVnhPYmhvUy8yakZnWEFWSW1ROUR4TEphV2p1RVl0NnVZYUd0Sm9GSDFa?=
 =?utf-8?B?aUlOUlAyTEt3YVhzbDlRVUFyU1pBZlJRc1FjWG5xUm0rQ29iRzlKYkR4c2ZV?=
 =?utf-8?B?ZC94ajY3VFNGY0JrU1dvQ2tUanJnMSsyZ2lNU2pRb3RkYmZZNlc2U2N0TlUx?=
 =?utf-8?B?N08zVCsyS3dLMEdqaGlUcEkwTzdlSVZLTU1Rd1loU2k3bWI3ZzN6cUFoZ1JM?=
 =?utf-8?B?RUpDUG5Nd2VTajMvSFppa1BrRE5mS0oxMy90ZjYxOHJqcmUxeW9oODZqL1k4?=
 =?utf-8?B?SWpuR3dGVy92QmNwWmlUeDRISnJlVDc5bVdwZHVNN3NYZS8zakp4Q3dBRjQy?=
 =?utf-8?B?UmpoSGw4NWUvSG9Hb2RVSy82TzhDdGFvcHUvNzBqc0liamJmNDFsUWFiSnFM?=
 =?utf-8?B?dVlZMGt4elFWTFRuZHVJSkxMQk8vOWIvQlRmTExkTGw1dzFjMU1NWHVtMUQ2?=
 =?utf-8?B?elgwbE14VDJZNjlDL0RGbFRZZWVITzdMRHlXS3lYWENaU1dRNGJiVXAyRG5u?=
 =?utf-8?B?aUlLTEtLZGVkM2FHTzdHSWhOR21XRk1iQkRvYXNMMU1QT2psRmZlUDJaaWw2?=
 =?utf-8?B?bjZhK0RNN0dpeWE4MUdsSGpJeFdWS083K3E2VXNyVTEzZ2I2NzFIUWlaTDhY?=
 =?utf-8?B?L3hITVNmYlJOZW5uY2JFaVg5R3ZSVUpDRkhCQWRvdGV1MkQwZHpzRnZRbnh5?=
 =?utf-8?B?d0VJZnJLamdTWXV1ZENWSm5wcTllcndUKzFrMytIamtWeDMvbDZGWEJXdTFu?=
 =?utf-8?B?M2dJTnhZYm1yWDJ5K3p4UXNia0lMUnJneTRYb2hBQVlwNGRaRm5lSThVUFd1?=
 =?utf-8?B?M1AxYTJDRzB2elZMQnVxWWdBbkhXYUxPcGw4dXJYTGY2T3NCc1YzL2ZZb0JS?=
 =?utf-8?B?Y3picmpCVGR5dnRFRnExeVovUHFXK2R4Y0lNekU1MnVIVitpOXpGSW5TeTlS?=
 =?utf-8?B?RG4wN2ZaM2hSWFB6K0FtTE1HU202Um5QQTlnbDNjMitXUlViY0dBbFlYYTJR?=
 =?utf-8?B?d052a3dRdEVHRlBYaWx1MGpnUWJHaStqV0RxWVdQNktBT0ROWDJqVFNWNXdu?=
 =?utf-8?B?M1hiR0RpL3RzajJ1VkZMOVhsM0NVL0kyU3N3RlRwRTE0SlBWc2liU1FVL0tF?=
 =?utf-8?B?cDE2RXY2cktkMXNvbjNIeTNkaVlvZmd2TllIUDBydFRMejR4YjJCSFBNOG5V?=
 =?utf-8?B?MHBVNjNlRmN3czRmYnl0THpZbVIrVHpDL1lHVHRmQnJwQ0EzOUxIVXVicEhI?=
 =?utf-8?B?czUvMlhMa3l1UDRYOXZiYkkzOU9CbU9vT3IwcXQ1ZS9Zc09QSEhGaVJCeUhu?=
 =?utf-8?B?S252QVNqdlErQ3h0cUY3R3grNVJRN0pEdlRROHYyZ2phUGp0NFFMR1F2VGZ2?=
 =?utf-8?B?OVFSY2lEdVlZR2pOT3d3UnRYc25VTmxLMXdWSXhZOXViYVYyNEJpU3Q2NC9s?=
 =?utf-8?B?NVdheVF6YTZ3eVhBd0hlVzMwYzF4aHU3SXUyYXkzYldhME9yVkRSOHJiWnpI?=
 =?utf-8?B?MWczSzZ6dUpEN2RoNTBYY1J5S0NzaHM0NlNXMDcwVlA1V0FOdW11bGgxTWNj?=
 =?utf-8?B?eGwzdXhVNjdPZW56ZWtKNGZGMzR6QzR4OVA5ZkJCSFRMQ3dTUnRJY0JFY1Vr?=
 =?utf-8?B?eXdhQm9QRS9kaHl0d1FHMVg0WEM4U3NHUVBGaWRmSUlndzFUazZlYkdDSkhV?=
 =?utf-8?B?K1p6ZXhXdjQzS1o3ZWd3L0hsd2FWWHBXdFY3MjlyT1BjM3RQc2o5cXkvZnBG?=
 =?utf-8?B?QmdaSndQNHhodGR6ZFp0aEVHZFcxMEI1SWdzN0VuV0tNVjZwd0NVZjNQOHVB?=
 =?utf-8?B?MnYwcExEMlNBYlV5ZjRDS1c5VlJ4TXJIeUljSENUa01mWk5pMzhBOWtCeDd3?=
 =?utf-8?B?NjQyVHRhZ3k1Z2tWM296ZDQzNlBOeVN0UmFaMzBVS2RWM0ZrWEhqRGl1TUx5?=
 =?utf-8?Q?aLTo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB8243.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab86866-199b-4879-f775-08dc385dc722
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2024 13:04:20.3393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yrX26r2C2VVaexftSfZFsZWZv3gD5vC6Vl47spA/auaz86JaUaUDgWe28LDv/Lxb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6744
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Feb 2024 13:04:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4916

SGkgTWljaGFlbCwNCg0KSSBzZW50IGFuIHVwZGF0ZWQgcGF0Y2ggd2hlcmUgSSBjb3JyZWN0ZWQg
YW5kIHRlc3RlZCBhY2NvcmRpbmcgdG8geW91ciBzdWdnZXN0aW9ucy4NClRoZSBtYWlsIHN5c3Rl
bSBkb2VzIG5vdCBzZWVtIHRvIGxpbmsgdGhlIHR3bywgYnV0IGhlcmUgaXMgdGhlIGxpbmsgdG8g
dGhlIHNlY29uZCBwYXRjaCwgdGhlIGZpcnN0IG9uZSBjYW4gYmUgaWdub3JlZDoNCmh0dHBzOi8v
cGF0Y2h3b3JrLnlvY3RvcHJvamVjdC5vcmcvcHJvamVjdC9kb2NzL3BhdGNoLzIwMjQwMjI2MTYx
NTA2LjQ4MDIwLTEtamJlemVtLmV4dGVybkBhcnJpLmRlLw0KDQpSZWdhcmRzLA0KDQpKb2hhbg0K
DQotLS0tLVVyc3Byw7xuZ2xpY2hlIE5hY2hyaWNodC0tLS0tDQpWb246IGRvY3NAbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZyA8ZG9jc0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBJbSBBdWZ0cmFnIHZv
biBNaWNoYWVsIE9wZGVuYWNrZXIgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCkdlc2VuZGV0
OiBGcmVpdGFnLCAyMy4gRmVicnVhciAyMDI0IDExOjIwDQpBbjogQmV6ZW0sIEpvaGFuIChleHRl
cm4pIDxKQmV6ZW0uZXh0ZXJuQGFycmkuZGU+DQpDYzogZG9jc0BsaXN0cy55b2N0b3Byb2plY3Qu
b3JnDQpCZXRyZWZmOiBSZTogW2RvY3NdIFtQQVRDSF0gdmFyaWFibGVzLnJzdDogU0RLUEFUSElO
U1RBTEwgY29ycmVjdCBpbnN0YWxsYXRpb24gZGVmYXVsdCBwYXRoDQoNCkhpIFlvaGFuDQoNCk9u
IDIvMTQvMjQgYXQgMTA6MzEsIE1pY2hhZWwgT3BkZW5hY2tlciB3cm90ZToNCj4gSGkgSm9oYW4N
Cj4NCj4gVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dCENCj4NCj4gT24gMi8xMy8yNCBhdCAx
Mzo1MiwgQmV6ZW0sIEpvaGFuIChleHRlcm4pIHdyb3RlOg0KPj4gRnJvbTogIkJlemVtLCBKb2hh
biIgPGpiZXplbS5leHRlcm5AYXJyaS5kZT4NCj4+DQo+PiBUaGUgU0RLUEFUSCB2YXJpYWJsZSBz
ZWVtcyBtaXN0YWtlbmx5IGlkZW50aWZpZWQgYXMgdGhlIGRlZmF1bHQgcGF0aCANCj4+IHdoZXJl
IHRoZSBTREsgd2lsbCBiZSBpbnN0YWxsZWQgYnkgdGhlIGdlbmVyYXRlZCBpbnN0YWxsYXRpb24g
c2NyaXB0LCANCj4+IHVubGVzcyBvcHRpb24gJy1kJyBvciBhIG1hbnVhbCBpbnB1dCBvdmVycmlk
ZXMgdGhpcyBkZWZhdWx0Lg0KPj4NCj4+IMKgRnJvbSB3aGF0IEkgdW5kZXJzdG9vZCBmcm9tIHRo
ZSB2YXJpb3VzIHNvdXJjZXMsIHRoZSBpbnRlbmRlZCANCj4+IHZhcmlhYmxlIGlzIFNES1BBVEhJ
TlNUQUxMLg0KPj4NCj4+IEkgaGF2ZSB0cmllZCBvdmVycmlkaW5nIGJvdGggU0RLUEFUSCBhbmQg
U0RLUEFUSElOU1RBTEwgKHNlcGFyYXRlbHkpLCANCj4+IGFuZCBvbmx5IG92ZXJyaWRpbmcgdGhl
IGxhdHRlciBoYWQgdGhlIGludGVuZGVkIGVmZmVjdCBhbmQgd2FzIA0KPj4gc3VjY2Vzc2Z1bC4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKb2hhbiBCZXplbSA8amJlemVtLmV4dGVybkBhcnJpLmRl
Pg0KPj4gLS0tDQo+PiDCoCBkb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvdmFyaWFibGVzLnJzdCB8
IDIgKy0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvdmFyaWFibGVz
LnJzdA0KPj4gYi9kb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvdmFyaWFibGVzLnJzdA0KPj4gaW5k
ZXggNmY3ZDZmZjAxLi5mMjkyYjhkYWQgMTAwNjQ0DQo+PiAtLS0gYS9kb2N1bWVudGF0aW9uL3Jl
Zi1tYW51YWwvdmFyaWFibGVzLnJzdA0KPj4gKysrIGIvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFs
L3ZhcmlhYmxlcy5yc3QNCj4+IEBAIC03NjExLDcgKzc2MTEsNyBAQCBzeXN0ZW0gYW5kIGdpdmVz
IGFuIG92ZXJ2aWV3IG9mIHRoZWlyIGZ1bmN0aW9uIA0KPj4gYW5kIGNvbnRlbnRzLg0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdmFyaWFibGUgaW4geW91ciBkaXN0cmlidXRpb24gY29uZmlndXJh
dGlvbiBmaWxlLiBJZiB5b3UgDQo+PiBkbywgdGhlDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b25maWd1cmF0aW9uIHdpbGwgbm90IHRha2UgZWZmZWN0Lg0KPj4gwqAgLcKgwqAgOnRlcm06YFNE
S1BBVEhgDQo+PiArwqDCoCA6dGVybTpgU0RLUEFUSElOU1RBTExgDQo+PiDCoMKgwqDCoMKgwqDC
oCBEZWZpbmVzIHRoZSBwYXRoIG9mZmVyZWQgdG8gdGhlIHVzZXIgZm9yIGluc3RhbGxhdGlvbiBv
ZiB0aGUgDQo+PiBTREsgdGhhdA0KPj4gwqDCoMKgwqDCoMKgwqAgaXMgZ2VuZXJhdGVkIGJ5IHRo
ZSBPcGVuRW1iZWRkZWQgYnVpbGQgc3lzdGVtLiBUaGUgcGF0aCANCj4+IGFwcGVhcnMgYXMNCj4+
IMKgwqDCoMKgwqDCoMKgIHRoZSBkZWZhdWx0IGxvY2F0aW9uIGZvciBpbnN0YWxsaW5nIHRoZSBT
REsgd2hlbiB5b3UgcnVuIHRoZSANCj4+IFNESydzDQo+DQo+DQo+IEkgYmVsaWV2ZSB3ZSBzaG91
bGQgYWxzbyBrZWVwIFNES1BBVEggYXMgaXQncyBzdGlsbCB1c2VkIGluIHNvbWUgDQo+IHJlY2lw
ZXMgaW4gUG9reS4gQ291bGQgeW91IGRlc2NyaWJlIGl0J3MgY3VycmVudCB1c2FnZSB0b28/DQo+
DQo+IEFub3RoZXIgdGhpbmcgaXMgdGhhdCB5b3Ugc2hvdWxkIGFsc28gdXBkYXRlIA0KPiBkb2N1
bWVudGF0aW9uL292ZXJ2aWV3LW1hbnVhbC9jb25jZXB0cy5yc3Qgd2hpY2ggcmVmZXJzIHRvIFNE
S1BBVEgsIA0KPiBhbmQgdGhlIGRlc2NyaXB0aW9uIG9mIFNES1RBUkdFVFNZU1JPT1QgdG9vLg0K
Pg0KPiBZb3UgY291bGQgaGF2ZSBjYXVnaHQgdGhpcyBieSBydW5uaW5nICJtYWtlIGh0bWwiOg0K
PiAuLi4veW9jdG8tZG9jcy9kb2N1bWVudGF0aW9uL292ZXJ2aWV3LW1hbnVhbC9jb25jZXB0cy5y
c3Q6MTM3ODogDQo+IFdBUk5JTkc6IHRlcm0gbm90IGluIGdsb3NzYXJ5OiAnU0RLUEFUSCcNCj4g
Li4uL3lvY3RvLWRvY3MvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3Q6NzYx
NzogV0FSTklORzogDQo+IHRlcm0gbm90IGluIGdsb3NzYXJ5OiAnU0RLUEFUSCcNCj4NCj4gQ291
bGQgeW91IHNlbmQgYW4gdXBkYXRlPw0KDQoNCkRvIHlvdSBuZWVkIGhlbHAgZG9pbmcgdGhpcz8g
SSdsbCBiZSBoYXBweSB0byBoZWxwIGlmIHlvdSBkb24ndCBoYXZlIHRpbWUgcmlnaHQgbm93Lg0K
Q2hlZXJzDQpNaWNoYWVsLg0KDQotLQ0KTWljaGFlbCBPcGRlbmFja2VyLCBCb290bGluDQpFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQpodHRwczovL2Jvb3RsaW4uY29tDQoN
Cg==

