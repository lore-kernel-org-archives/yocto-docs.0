Return-Path: <JBezem.extern@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF4AC54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 10:59:56 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.86])
 by mx.groups.io with SMTP id smtpd.web10.8196.1708685989633540178
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Feb 2024 02:59:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arri.de header.s=selector1 header.b=cNo6XazP;
 spf=pass (domain: arri.de, ip: 40.107.247.86, mailfrom: jbezem.extern@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zkw/Gig76jkd4HjDBlCgUPZz2RTDNhlcFg9rfaQ31gLdyodpiiPBbMXmVUECElDL/MGhZc5d7ST1cpQY2qn8CxEEpTeb/ODTHqfaarxOJE7nAGzsZ+sUWckIx+sM9aPHvpr1W9fzHfFIbw76cbpP7RUfcU5wMn+ZJ52vln7BddSMG0T4T3PDpE14xdEf+O5s/NWXEPJhC4oaudUtGKpwTI1Tyalddm9X8ar9nK8/nmFw6iPHh86doLUHdckncMuCm+45rP2z08/5uEnv5li42rYIbzsBMYYXnpZlgjLTlncYsw5POYuFrKyyH2g9d9eq6uervUaySqmLDX+w+y8AKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AA+plY6FYEN2PGWK2RXmvyr2gUxYzkRbWDoVfLQlDs=;
 b=ltl8c90LXob91Lw2/EAsF9E7BStRUURyc3e73UajQZiiPSYqt5EMR6bXIbqTGJqa9I175hOXxLHe0CYGEnd8aT3o1KYXAVnk7TM1fRpmhgaVxjTUJuDnsyTesS4Cf2Jpc/T7aSUS+LWCsqbp80iAE/8gnDKnbFCySj070uOK7yTB9MTo8OGnJUBpJRI482fJxN//zmlfxlzQtje3KMX/j54HsAt1SQ09xnxorRSCIyhhoSi2PQK7mPQnvYGgVsQp2/B4SjQea9boZcJXXA+UCF6B5IlbrET0GZW2FxWdODe/7V7AbSepatswZFpHF+29ycLJ9Kp1guYjh/JlJyN6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arri.de; dmarc=pass action=none header.from=arri.de; dkim=pass
 header.d=arri.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AA+plY6FYEN2PGWK2RXmvyr2gUxYzkRbWDoVfLQlDs=;
 b=cNo6XazPSLo86vCHubVIiDfOrkNL7VnM0OcdMfMHFiQ0RZLLX4gzdJm4lJRbzkVTcLl7mL37Cylqffa7IoSxzUFuXSiiJeEPi6sT1xWxuXZ3t3/RtMpf75XlXXljpyqKFOxtqZZU8ur7SfgCFsvuleOjaY38JN44+l5qkZg8dc0=
Received: from PR3PR07MB8243.eurprd07.prod.outlook.com (2603:10a6:102:17a::6)
 by GV2PR07MB9082.eurprd07.prod.outlook.com (2603:10a6:150:b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.23; Fri, 23 Feb
 2024 10:59:44 +0000
Received: from PR3PR07MB8243.eurprd07.prod.outlook.com
 ([fe80::151b:e98b:8328:ab6a]) by PR3PR07MB8243.eurprd07.prod.outlook.com
 ([fe80::151b:e98b:8328:ab6a%4]) with mapi id 15.20.7316.018; Fri, 23 Feb 2024
 10:59:44 +0000
From: "Bezem, Johan (extern)" <JBezem.extern@arri.de>
To: "michael.opdenacker@bootlin.com" <michael.opdenacker@bootlin.com>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] variables.rst: SDKPATHINSTALL correct installation
 default path
Thread-Topic: [docs] [PATCH] variables.rst: SDKPATHINSTALL correct
 installation default path
Thread-Index: AdpmR2fckbrjKotvRZun9Pdk8TgA5A==
Date: Fri, 23 Feb 2024 10:59:44 +0000
Message-ID: 
 <PR3PR07MB824382E96561F0F922CFC445FC552@PR3PR07MB8243.eurprd07.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB8243:EE_|GV2PR07MB9082:EE_
x-ms-office365-filtering-correlation-id: 4c2225bb-26db-437f-b12c-08dc345e8aff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4B6mSrRX0cmhRHu9kf+pLlxfx3zSVR4GGCdShjdChYv/7cPNzeSQ45UXkt/SwQnHNQwOFCnphkeF8o9lUtxG6fD0WhQpCAYm3QY9S61ynAKkOWuihgki25/eQpKFXuX4Q5ZawgjwtmZvzXBAo/RPK/QppcmfvcbaolUH5Vq3wBTTtvo0Z3JxAdUs9sMeF0X6nGqu81bm9WyHIXpl2z2yZhKHDHeGljlvkjaeTpdW41LQ6PYxpfPK7fdrwh7D+f0dU5NF6PPxV20z6M0IeUkU8zmRgP9f1XY633jUB0mGhH8AtYEQ3oa645G7dyebvZ8AWR92/aRWj1J5pjRQqnZ+0MkGJ2l1bDVkcrU1udadpzcUiQo3breuT0bR1TrPQ4HOvoSSPolzaf2WFM9c8o9M7N1shEqI661dkYJo4lNU97tWVoyP4VnhnU+AXOq63DCQc7b5xiK5OkJKb0ysq1raW2iSaFwTd+0MIjFAYwZutf3n+C32P7idhio5s4jfev8bS17cKt4EYSFutv7dOK1bh+9cJmhVQ43BhPSLHSiKKbNXy3qi8aIIH3kO5VsoC4DyBL8w4IZgHf0GpBExU+77Pg5JXJGdYcyzDzb+eQ69yDA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB8243.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZEcyeWREbUQyb2JzaGdiU3dmUmFjOHZSYmdyQ3p6WllUTWZoeStVWkNKMzZ5?=
 =?utf-8?B?cjhyS3dlZnFUSFhSMGlybTVTM1BReGhNZ2EzemxDdyt1UFoyWUpxcndmQ3dp?=
 =?utf-8?B?R3hUMDd6alZrRVp1OHNWaDFleHJ2cTJoUExBQjRWdkRYNVlrMFB2eCtzNit3?=
 =?utf-8?B?R2V3M2JDanVoNGU1OE5EMnA4MlhPeGttTHBIdWg2MkFER29xNmREUUQxY1ly?=
 =?utf-8?B?THFzS3N0Z2NvRUdPOWhsUktFRHBLSEVKM0lMOGN1cU1OSnFKZEpSZXh4OVlk?=
 =?utf-8?B?VWhLZEg2Z0MvUTNrSmJSMWIvT2pEejFNT0xRbkw1alNsa055d3RCdTMrd1NY?=
 =?utf-8?B?Z3Z6aFFaQlAxYmVCLy9oYzBGQ04yT2FEeGJWMUc5N21vQ09wczBTd1pLNUlx?=
 =?utf-8?B?WllmaWc3cmFWdk9nZDQ4d3RUN2FoT2hORkl2dDU0MXZrMWZkelR3YlZlU2ZP?=
 =?utf-8?B?SUlBSURick1YU3JJb1M3aVBUQXI2RnJnK2kwN3JiSUEyM29IVDNKUWRMZkJt?=
 =?utf-8?B?NDZyQWZOQjZ0eFkvRUlUWU5pYXJBNzhIS2FkdDhEdCt6WVRETU5ia0RvKzhP?=
 =?utf-8?B?V3RLa1NKaStGZzJFekZid1VGVm1sRXFVKzB6TUdaaXR5cWJrRWFTS2FScVUv?=
 =?utf-8?B?cysvaUNpYkR0b3VqblBKbzd4YW5mb3B3RWwrdzZkSUFPTzBTYVppYXBBTTJu?=
 =?utf-8?B?TjNwaWpKdTBURE5JZnZkYyt6K1RZTXZPQWdMYUpNa3o2a0FkQ09XcWxPSlc1?=
 =?utf-8?B?QVg4anNrM0JHNzB5MVB2OW5VaTVORmNNckVaZSt0OEI5WTRMek93QnBXQlBw?=
 =?utf-8?B?MExkbEdtYXhGbWtGSk1pZFBua3hjQnU2MC9selE5Rnc3RGVDVjhRakEwVGtR?=
 =?utf-8?B?M1Jsb3RyUkZjZjE1T0cwSTB4WDhHdHhoejEyeXZYS2QwMjdTWUtIakd5aW5i?=
 =?utf-8?B?Mm5vMDBjVUh1bWpBWXRqa2hDTkN0QzJKdjRlbjdBam9MYjNxa05lYU1OVU5h?=
 =?utf-8?B?TnhxQ1hyVEdlRXhFWCs4bjJ2SHNPRkZhTFdOOU9jRUo5WVhsWGhLVjFqWmNy?=
 =?utf-8?B?T0V2MkQyb0w0QU94TlJNaisxSjREOVBReWZ5OTF0RmFLQVcramZpcE9RT0Ri?=
 =?utf-8?B?UDc3YnEwSGtqeXhZMWx0Y3ZNRUJjWXFiYXhXRjd5YUU2a002SmhneXBWb2RB?=
 =?utf-8?B?ZGdXSDcwUE4weWJCSmd6WXhTMXEzVmZ2RTV1UStlYUthZWhqNkd4cDI0MTN3?=
 =?utf-8?B?eXhOcFR5UDZKNGZQZnRZbSs4TkFXSnhnYW5HeXZ2YkJBdXNOREdpbkZFaXhW?=
 =?utf-8?B?ZHJmSjNNdElHS0RGUW9IWk16cGpOZXl2SDQ0SUNLUHJrUjhMU1BGdDJmNW5r?=
 =?utf-8?B?cEVMbmh3K2NmVmg1RjJlNFBrN2ZEc3ZaUG9XcHg2S2RySERXQ0lQY3ZDbzhX?=
 =?utf-8?B?S3hjZk9TV2VmR1NHZGxjektCWkpmRGFnZjZqNEtmQ2s0OGtraFY1UkVsT1RD?=
 =?utf-8?B?eGR0R3pjaVMySW1IaHVkeTJqUDFkQmRYeHBBakYvb09kUlhMQzNiZkFPcGxk?=
 =?utf-8?B?NzhNYmhDbXVpaUN2cUZSV2RiY0ZUeXhiTWlCbFkrdnl5SnZGVTlpZldJejI4?=
 =?utf-8?B?cU81aFNjVmZpalFybzFGWms5WmVmVzV3Lzd6cFhiL1RPMVBGSEdWLzJTRVZS?=
 =?utf-8?B?OUpSRTRaUmpsZzkxYUdHLzZsVzFqRGRvSzJnMUN0K0V1L0oyZDRiUUMwZC81?=
 =?utf-8?B?ajltcjI3LzFMUUx3T3dXYzVLODh1dnZHaUtFWnQrNTBEZ0h6QkYxS2FIeFpV?=
 =?utf-8?B?OC9rR1Q5OXU1WjV6Y1RaZmdlU09BNTFjci9SMGNqcUJJK3dXdDFEMHVmY0VH?=
 =?utf-8?B?YytNREJnZHdLK1pMTE1jQUJVOWFIbXZYTGRIMm1jdzdKdllzSUxlZ0h3ekZU?=
 =?utf-8?B?UXBZdHpXY3pHb01jMlppMkU1dXQ4R0ZhenNaZWpHR2hyVWJQeHFweVV3ZTdx?=
 =?utf-8?B?M003NVZjdHY4bVFDbTJJWnJueGNiSTBDNVlVclFvb3I0cEljRGVvZkY5S255?=
 =?utf-8?B?NktDOHVtaUJFc1dwRzREWm5pYjN6andHbFJrMXB6SlhFN01IQ0k1bCtBVUZn?=
 =?utf-8?Q?ynKo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB8243.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2225bb-26db-437f-b12c-08dc345e8aff
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 10:59:44.3318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZpvNsQWURHNgTqC5b9lj14opfgvRTutMLm+meoqwUV6tne0uwopLqh65yz9uPovq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR07MB9082
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Feb 2024 10:59:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4862

SGkgTWljaGFlbCwNCg0KQXMgSSdtIG5vdCBhbGwgdGhhdCBmYW1pbGlhciAoeWV0KSB3aXRoIFlv
Y3RvIGFuZCBCaXRCYWtlLCBJIG5lZWQgdG8gY2FyZWZ1bGx5DQpyZXNlYXJjaCB0aGUgdmFyaWFi
bGUgU0RLUEFUSCwgZXNwZWNpYWxseSBzaW5jZSB0aGUgZG9jdW1lbnRhdGlvbiBpcyBhcHBhcmVu
dGx5IGluY29ycmVjdC4NCkFuZCBpdCdzIG5vdCBteSBoaWdoZXN0IHByaW9yaXR5LiBTbyBpZiB5
b3UgaGF2ZSB0aGUgdGltZSwgYW55IGhlbHAgaXMgd2VsY29tZS4NCg0KUmdkcywNCg0KSm9oYW4N
Cg0KLS0tLS1VcnNwcsO8bmdsaWNoZSBOYWNocmljaHQtLS0tLQ0KVm9uOiBkb2NzQGxpc3RzLnlv
Y3RvcHJvamVjdC5vcmcgPGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gSW0gQXVmdHJhZyB2
b24gTWljaGFlbCBPcGRlbmFja2VyIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQpHZXNlbmRl
dDogRnJlaXRhZywgMjMuIEZlYnJ1YXIgMjAyNCAxMToyMA0KQW46IEJlemVtLCBKb2hhbiAoZXh0
ZXJuKSA8SkJlemVtLmV4dGVybkBhcnJpLmRlPg0KQ2M6IGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZw0KQmV0cmVmZjogUmU6IFtkb2NzXSBbUEFUQ0hdIHZhcmlhYmxlcy5yc3Q6IFNES1BBVEhJ
TlNUQUxMIGNvcnJlY3QgaW5zdGFsbGF0aW9uIGRlZmF1bHQgcGF0aA0KDQpIaSBZb2hhbg0KDQpP
biAyLzE0LzI0IGF0IDEwOjMxLCBNaWNoYWVsIE9wZGVuYWNrZXIgd3JvdGU6DQo+IEhpIEpvaGFu
DQo+DQo+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQhDQo+DQo+IE9uIDIvMTMvMjQgYXQg
MTM6NTIsIEJlemVtLCBKb2hhbiAoZXh0ZXJuKSB3cm90ZToNCj4+IEZyb206ICJCZXplbSwgSm9o
YW4iIDxqYmV6ZW0uZXh0ZXJuQGFycmkuZGU+DQo+Pg0KPj4gVGhlIFNES1BBVEggdmFyaWFibGUg
c2VlbXMgbWlzdGFrZW5seSBpZGVudGlmaWVkIGFzIHRoZSBkZWZhdWx0IHBhdGggDQo+PiB3aGVy
ZSB0aGUgU0RLIHdpbGwgYmUgaW5zdGFsbGVkIGJ5IHRoZSBnZW5lcmF0ZWQgaW5zdGFsbGF0aW9u
IHNjcmlwdCwgDQo+PiB1bmxlc3Mgb3B0aW9uICctZCcgb3IgYSBtYW51YWwgaW5wdXQgb3ZlcnJp
ZGVzIHRoaXMgZGVmYXVsdC4NCj4+DQo+PiDCoEZyb20gd2hhdCBJIHVuZGVyc3Rvb2QgZnJvbSB0
aGUgdmFyaW91cyBzb3VyY2VzLCB0aGUgaW50ZW5kZWQgDQo+PiB2YXJpYWJsZSBpcyBTREtQQVRI
SU5TVEFMTC4NCj4+DQo+PiBJIGhhdmUgdHJpZWQgb3ZlcnJpZGluZyBib3RoIFNES1BBVEggYW5k
IFNES1BBVEhJTlNUQUxMIChzZXBhcmF0ZWx5KSwgDQo+PiBhbmQgb25seSBvdmVycmlkaW5nIHRo
ZSBsYXR0ZXIgaGFkIHRoZSBpbnRlbmRlZCBlZmZlY3QgYW5kIHdhcyANCj4+IHN1Y2Nlc3NmdWwu
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSm9oYW4gQmV6ZW0gPGpiZXplbS5leHRlcm5AYXJyaS5k
ZT4NCj4+IC0tLQ0KPj4gwqAgZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3Qg
fCAyICstDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxl
cy5yc3QNCj4+IGIvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QNCj4+IGlu
ZGV4IDZmN2Q2ZmYwMS4uZjI5MmI4ZGFkIDEwMDY0NA0KPj4gLS0tIGEvZG9jdW1lbnRhdGlvbi9y
ZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QNCj4+ICsrKyBiL2RvY3VtZW50YXRpb24vcmVmLW1hbnVh
bC92YXJpYWJsZXMucnN0DQo+PiBAQCAtNzYxMSw3ICs3NjExLDcgQEAgc3lzdGVtIGFuZCBnaXZl
cyBhbiBvdmVydmlldyBvZiB0aGVpciBmdW5jdGlvbiANCj4+IGFuZCBjb250ZW50cy4NCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHZhcmlhYmxlIGluIHlvdXIgZGlzdHJpYnV0aW9uIGNvbmZpZ3Vy
YXRpb24gZmlsZS4gSWYgeW91IA0KPj4gZG8sIHRoZQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29uZmlndXJhdGlvbiB3aWxsIG5vdCB0YWtlIGVmZmVjdC4NCj4+IMKgIC3CoMKgIDp0ZXJtOmBT
REtQQVRIYA0KPj4gK8KgwqAgOnRlcm06YFNES1BBVEhJTlNUQUxMYA0KPj4gwqDCoMKgwqDCoMKg
wqAgRGVmaW5lcyB0aGUgcGF0aCBvZmZlcmVkIHRvIHRoZSB1c2VyIGZvciBpbnN0YWxsYXRpb24g
b2YgdGhlIA0KPj4gU0RLIHRoYXQNCj4+IMKgwqDCoMKgwqDCoMKgIGlzIGdlbmVyYXRlZCBieSB0
aGUgT3BlbkVtYmVkZGVkIGJ1aWxkIHN5c3RlbS4gVGhlIHBhdGggDQo+PiBhcHBlYXJzIGFzDQo+
PiDCoMKgwqDCoMKgwqDCoCB0aGUgZGVmYXVsdCBsb2NhdGlvbiBmb3IgaW5zdGFsbGluZyB0aGUg
U0RLIHdoZW4geW91IHJ1biB0aGUgDQo+PiBTREsncw0KPg0KPg0KPiBJIGJlbGlldmUgd2Ugc2hv
dWxkIGFsc28ga2VlcCBTREtQQVRIIGFzIGl0J3Mgc3RpbGwgdXNlZCBpbiBzb21lIA0KPiByZWNp
cGVzIGluIFBva3kuIENvdWxkIHlvdSBkZXNjcmliZSBpdCdzIGN1cnJlbnQgdXNhZ2UgdG9vPw0K
Pg0KPiBBbm90aGVyIHRoaW5nIGlzIHRoYXQgeW91IHNob3VsZCBhbHNvIHVwZGF0ZSANCj4gZG9j
dW1lbnRhdGlvbi9vdmVydmlldy1tYW51YWwvY29uY2VwdHMucnN0IHdoaWNoIHJlZmVycyB0byBT
REtQQVRILCANCj4gYW5kIHRoZSBkZXNjcmlwdGlvbiBvZiBTREtUQVJHRVRTWVNST09UIHRvby4N
Cj4NCj4gWW91IGNvdWxkIGhhdmUgY2F1Z2h0IHRoaXMgYnkgcnVubmluZyAibWFrZSBodG1sIjoN
Cj4gLi4uL3lvY3RvLWRvY3MvZG9jdW1lbnRhdGlvbi9vdmVydmlldy1tYW51YWwvY29uY2VwdHMu
cnN0OjEzNzg6IA0KPiBXQVJOSU5HOiB0ZXJtIG5vdCBpbiBnbG9zc2FyeTogJ1NES1BBVEgnDQo+
IC4uLi95b2N0by1kb2NzL2RvY3VtZW50YXRpb24vcmVmLW1hbnVhbC92YXJpYWJsZXMucnN0Ojc2
MTc6IFdBUk5JTkc6IA0KPiB0ZXJtIG5vdCBpbiBnbG9zc2FyeTogJ1NES1BBVEgnDQo+DQo+IENv
dWxkIHlvdSBzZW5kIGFuIHVwZGF0ZT8NCg0KDQpEbyB5b3UgbmVlZCBoZWxwIGRvaW5nIHRoaXM/
IEknbGwgYmUgaGFwcHkgdG8gaGVscCBpZiB5b3UgZG9uJ3QgaGF2ZSB0aW1lIHJpZ2h0IG5vdy4N
CkNoZWVycw0KTWljaGFlbC4NCg0KLS0NCk1pY2hhZWwgT3BkZW5hY2tlciwgQm9vdGxpbg0KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KaHR0cHM6Ly9ib290bGluLmNvbQ0K
DQo=

