Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6BCC433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:08:10 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.6177.1636603689217520950
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 20:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=utjeKStL;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="230304402"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800";
   d="scan'208";a="230304402"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 20:08:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800";
   d="scan'208";a="564842243"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga004.fm.intel.com with ESMTP; 10 Nov 2021 20:08:07 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 10 Nov 2021 20:08:07 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 10 Nov 2021 20:08:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 10 Nov 2021 20:08:06 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 10 Nov 2021 20:08:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loK2oYIR9fnyrk+Eg8kudkkXmATSYlAqkN0NfQ4nmln2dOqpAXoqqdC2PZB+4W3/1fA3VXqmTi6vWo/VXAd+eP566VSvbELxhiCYrRYeCVRNYXWfCHhA2xz+lpLH+BQbMwpnh0g9Vy3mhjqTo+e604CxGOYvYqmuaFIkpSrFF9hK8E1itWG1AIBW2pGPIaqjyIdqRIJeLMnZPqmPLnUEfZX937Zu7O2Kz8oG+KLdLcG24ihy3I0LPzz8IhvsX9soOFPVhb4zL9ZCE/w6LCiqRT4YEybXQDL6wNPbhoUduYEqocABw2W5MgsOcwxtMji+AYwvw5G3g+IRJ7DgBtqzAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90TRcb26eSEeGGe6RWJz8dUBkS02NztSchcxLgUSTxg=;
 b=M1f8PS5d0cVEahnQNSMSG/o6ognty6I68q+BIFhWFGF8MJmGLDUdBq8LzzZu/3KUBv7wbX1N7oGtExXscQrhddDkSDU+olKdv8MANUNtQXFephFNNJ5MXAJSGQOHl7EBmnky9Je4/dvI5vMOkKFSaLU8iNlv9UHnx2EKfFDQWI6L4MbFhrEhL66BXE/N/xU6AXbasOJ3aaobXl+rCU7P5HtbQ4zKXxCkZcd76qXOCC8BkL5/hOS1KHqCG/JgkacwVz2ywBrsVR/9LM9ji5H1NphmgeE4/GnjsxiF8Hsbuv4hAOCxW2oet/cAUeP02nydnullq+daTl1EH1bMi628OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90TRcb26eSEeGGe6RWJz8dUBkS02NztSchcxLgUSTxg=;
 b=utjeKStLv3bSk5Le0k2Eele5IeWApDhi/+XpPEKpRp5XUN4HNaAp+zMZnFqJ5VbHIIKcOHjIDekQi+uUo41dYGOUBHoQ6/JxZBc9osPRRS1V+diP27nofaJPkOmZbrj1iz70mz6de7Go4xJ1jwN92iRx2quY5+duy1Xq9xY8FD0=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BY5PR11MB4102.namprd11.prod.outlook.com (2603:10b6:a03:181::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Thu, 11 Nov
 2021 04:08:04 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::2c3d:dccb:aa85:53c5]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::2c3d:dccb:aa85:53c5%2]) with mapi id 15.20.4690.016; Thu, 11 Nov 2021
 04:08:04 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "steve@sakoman.com" <steve@sakoman.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
Subject: Re: [docs] [yocto-docs][dunfell 3/3] documentation: prepare for
 3.1.12 release
Thread-Topic: [docs] [yocto-docs][dunfell 3/3] documentation: prepare for
 3.1.12 release
Thread-Index: AQHX1lW03ucTeg3w6UqvPEBdLu38Iav9tsaA
Date: Thu, 11 Nov 2021 04:08:04 +0000
Message-ID: <331d6852e3e5bb9afeed9c9be927f72cd0e57a5b.camel@intel.com>
References: <cover.1636564016.git.steve@sakoman.com>
	 <c3b650f759d7983db563500d52ad5b68f18728e7.1636564016.git.steve@sakoman.com>
In-Reply-To: 
 <c3b650f759d7983db563500d52ad5b68f18728e7.1636564016.git.steve@sakoman.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b9c27c3-7a0a-4aeb-7a84-08d9a4c8dc1e
x-ms-traffictypediagnostic: BY5PR11MB4102:
x-microsoft-antispam-prvs: 
 <BY5PR11MB4102A209FF2B328600177806F8949@BY5PR11MB4102.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 POqflSL1OIKMSefqFk+iKIJxFFKmo9xGMAqQuA8Nkf2eyGw4RqIh0c1yAZpS4iH0mH96CJO2nTcLmJEtch7+f0DqMpaHFREtFoTCL/Ha0/gCJefQzDSK3wmEobCLxjW2SJKjjNNFVzhAZ/bVwu9y8orb3hJPtyx1BbrvHu1a9JW01ur8Bk2X8H6Tql9twtAmB7wulqSrISWGH28gFOB0A8r4qyqn18W+vcmA3PwHZa0Sjdik1dTL+gDKq6JFxyIVESf3vlBcOOBfcOiS31DkqZA81A1zm1obNrK6MjsiABNinR0O6mQD9bQsfbOsln0up9HmOjfKkB4+g4RTFAYWjgvc4gG3akLiwXwGwUz8sGv7h+XGevdnCL5gdWUQY0zPhqamAZWlil9JQB0lewx5t50E8pU+bLKcGoZsgvahMzpout/+IL0P+UVrr3Q+pxGTDZhWDZUXFUaM6hJynIm4YM0V4faoSvPgcC1Wng6YPOxk/ZzGkBxlYFaSE3vOMgKBEWhAaJfBu2oYyPiWwz//HMpgVFytrUCNwqex7bn6W+oLaG0cu8mYvJeuICE7NlE3NN1NjajsCpQHI1Z81XsUmQsMAQxajbpWx74FXwNmTEBkYq38hbXFJD8fRYqavRMiwOts66ofpsqFSVmvXlSHdNXseHt4FIy/NGdVFFkNmNXFsV2ZbxAHzE92hDQsXNEX8PXTxEXzBami7NoyI+lDc3UIqJLk1cv474H4oiDhm79xEEoHDPVIq2xXkFZzDYJ6wUanzzOwA7p3b8eS7AUKGVUZN1N0FvlukMJ/+Yi7/e33HW8G0VxBZtdDM7+k8EScWJBjml7wg2URSyrZ2JTSVA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(76116006)(66946007)(5660300002)(110136005)(316002)(66446008)(508600001)(36756003)(91956017)(6486002)(64756008)(6506007)(71200400001)(83380400001)(6512007)(66476007)(66556008)(2906002)(8676002)(38070700005)(26005)(4001150100001)(2616005)(38100700002)(86362001)(82960400001)(186003)(122000001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SlZjbjhRcjJ5UUlPZ2p6MFp1bkFPOXhKNWZURlk3L0Zlc3FUaFFmek9ucHZH?=
 =?utf-8?B?c2F2bW12WTlYbDVKdmRENExjRjB0dG9JOUo1T2Vwb0VVQXViZEZOeHBONE5n?=
 =?utf-8?B?L0k1UktXdHAzUFA1d2M3YlBsRXU0MnNFcUszUktGOU5UT1AwR3g2N3B0ekZq?=
 =?utf-8?B?b0dHeThOVGtPRlhVcGhRVjdzOXdIK0JIY3hRS01nNU1aNnRTVU5LRWtBNlZy?=
 =?utf-8?B?Qk9uQWFjdDV3YTdUV3lKQ1V4TDd4UjF6VExIMU5URVFSdDh2cTBtcnNLVUxn?=
 =?utf-8?B?djJvOHJyZVVIYWtrYjNYTEx0SHhMNlRzVkIvMXF6N20wMXAxVFJiU2U3aWRQ?=
 =?utf-8?B?cFZBajM5YmJaOU9hV2J6RGt6dk1lTjlDa1YvaHd0d0hVWDhOb3VKcDlYT21E?=
 =?utf-8?B?VnU3SnF1OUtoR3YvSFI1dWt6V1lvZ1JyZlVxdFlmNEdlM25seDlCdkxkKzJh?=
 =?utf-8?B?TnhNb0diV3piRkw0SFQwMWljOGRxOVB1bElJUnZjcTl1Ti9UbloxRG1FVGFu?=
 =?utf-8?B?Y2g3RkhwNGNnV0RHNmRFVllubWQwVG5aMzllRkNvRFZDNXdxV2NUakNkMEFT?=
 =?utf-8?B?U2pkbUlQcTZSdVNuMThHcU53V3RYMXMzY2NGZ0ZNS1lQY0ZaMU51TzA0ajgv?=
 =?utf-8?B?Nk4wUk1TNU05ODNzcEl4R3o3azRONFhaRlNCNno5ZnFhTXpVVWxDWmNVcmU2?=
 =?utf-8?B?dCtoQzZpd0dLeUZDMEk2ZkZtc3JDN21ONWt5YXRId2pTZTVJa3Qxa1FPZFRR?=
 =?utf-8?B?RU1KMGN5YnhZNm5LSExlaTM2Tmp5ZWlxazZaZWYvWFErczBhS0xTNzI2L3JZ?=
 =?utf-8?B?WHgrWmg2Zno3TnVGNFhUb3NLS0tLYzBHZ1BSd1VSbmorZHA4UFM2Y1p4RXdU?=
 =?utf-8?B?NEp6dThZM3p4OUE1MDQvdmFjeUZCT0t5QkdyMko5c0JrejlZZEZOTU4wejQ0?=
 =?utf-8?B?b0tqRno5Rmt6bFVJZ3RuSEJNYmVIcm82Z0JMWnVPd3RoK21EOFU3UU9BNG9M?=
 =?utf-8?B?a28wdTc5czJxR0FIMXNtTU9KRW4zdlFzL2N0S2ZDTlR2WGhBa2diYW9tMmsz?=
 =?utf-8?B?ayt5M29CMTc2RVY2ZTJ3SmMyZUN5K3oyd1pBVTVtL0dKNUpHcHVlN2czNWND?=
 =?utf-8?B?MzBab0dzV1BuQm1tL0dvdENrRWhlVlQrZXJxMzRnM1lKdzB2QXJkZExESU1l?=
 =?utf-8?B?b1I0VlVjNXhGK3pmTHp6RzdMVVpuNnBMYjlXQXNXV0JlMUZNamNOcDFUdW9X?=
 =?utf-8?B?QmtVdUI1eVBTSnVrR3dyWGtoOXVCUHFVR1lXMGFJbGlsdWRDdFltUDFGL2cr?=
 =?utf-8?B?NWhiVXFGaFE0V0FhOFV5R1o4a3dtQnhvZ1hyY1JidDBlbDRNbDJCTE9NVUgw?=
 =?utf-8?B?VVB1MEtlQm9ZakwyekFzR0hkRGJNZkhNZHJycDdFWWU0WVlYb1lLWitGd0pj?=
 =?utf-8?B?dFZ4dTluV05qWDVGMU5MQ2ExZy94VGdMTnEzd090RlZvaHJoSlRERUx1VkYv?=
 =?utf-8?B?MzZrSmtqcUFCWkRPZmtrR3J3UUF6Qkt2VTk4N25rU1FuNWhPbkxkQTl4NGpr?=
 =?utf-8?B?Vmx0YmJweXZScWdocHozOUtKaklxdnpkSmhNWDZhdkt5dHErdEVkanZLSWJF?=
 =?utf-8?B?eFlhSW5RYlB4MU9XTjF3eU5yVU5XbkltQjB6Zm1iSXN4MHUxNi9nTitZN2FE?=
 =?utf-8?B?ZFBseE9JRlNZQUpsMUwxV0tSdWoxRDhnZFY4MHQ2ckwxL3RLaE5XQkRuWEhH?=
 =?utf-8?B?L3YzcFZZN2dLeUNsT2x5WWNsZ1IwMThiOTJkRUpQeFdmWVFLdmMrc3JIUDk5?=
 =?utf-8?B?NHhEUmVsVXFSV0RqUUhDNlJJa0ZCbHB1YmttUVpRVWMxekVIMTZCb1JKd2lj?=
 =?utf-8?B?UCtGY2h1YTNtZGpodno0UE9MdlhFcS9KNERqTDR6UkFOd1AwS3ZGYm52YVRQ?=
 =?utf-8?B?ZW5VcG9OdmJGZGNUa3BiK1pvTGNwQmFTTTFYV2tGVjFNWHBXRlVwdHcwdkFS?=
 =?utf-8?B?cDE2bzlWdkhERFJwa1l3dVNKcTRRRVFrQmxybU14T29pbHBqOHdOQmU2blFV?=
 =?utf-8?B?N3dCNEhKUkMycDJRYk15TW92alp2RjkybE9qM1FXUFZUaC9ZczY0aGJIYVJh?=
 =?utf-8?B?MmhoVUdjT2xOR1VqR0NuNW9ETUUyNUREemxJaHNtdVBVRThCcHFsYnQyS242?=
 =?utf-8?Q?onu3iRWpkFrkjw2vg5m94KXJ1fBXAtsXrZ0nqK8KgDij?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A95B764B295EC48958895B1684FB139@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b9c27c3-7a0a-4aeb-7a84-08d9a4c8dc1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2021 04:08:04.2278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 SL5z1OhwfWlDFXFx1/PCvLwSu+oHpo2K7lO8E+MtJI7WjQXIo8TA0V21+bUFZue8j7MwYQWK9oYXPVJRdSvp0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4102
X-OriginatorOrg: intel.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Nov 2021 04:08:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2125

T24gV2VkLCAyMDIxLTExLTEwIGF0IDA3OjA4IC0xMDAwLCBTdGV2ZSBTYWtvbWFuIHdyb3RlOg0K
PiBTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBTYWtvbWFuIDxzdGV2ZUBzYWtvbWFuLmNvbT4NCj4gLS0t
DQo+IMKgZG9jdW1lbnRhdGlvbi9jb25mLnB5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCAyICstDQo+IMKgZG9jdW1lbnRhdGlvbi9wb2t5LnlhbWzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgOCArKysrLS0tLQ0KPiDCoGRvY3VtZW50YXRpb24vcmVs
ZWFzZXMucnN0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgKw0KPiDCoGRvY3VtZW50
YXRpb24vc3BoaW54LXN0YXRpYy9zd2l0Y2hlcnMuanMgfCAyICstDQo+IMKgNCBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZG9jdW1lbnRhdGlvbi9jb25mLnB5IGIvZG9jdW1lbnRhdGlvbi9jb25mLnB5DQo+IGluZGV4IDZm
MTBmYzE1MS4uNmViMjg0ZTY1IDEwMDY0NA0KPiAtLS0gYS9kb2N1bWVudGF0aW9uL2NvbmYucHkN
Cj4gKysrIGIvZG9jdW1lbnRhdGlvbi9jb25mLnB5DQo+IEBAIC0xNiw3ICsxNiw3IEBAIGltcG9y
dCBvcw0KPiDCoGltcG9ydCBzeXMNCj4gwqBpbXBvcnQgZGF0ZXRpbWUNCj4gwqANCj4gLWN1cnJl
bnRfdmVyc2lvbiA9ICIzLjEuMTEiDQo+ICtjdXJyZW50X3ZlcnNpb24gPSAiMy4xLjEyIg0KPiDC
oA0KPiDCoCMgU3RyaW5nIHVzZWQgaW4gc2lkZWJhcg0KPiDCoHZlcnNpb24gPSAnVmVyc2lvbjog
JyArIGN1cnJlbnRfdmVyc2lvbg0KPiBkaWZmIC0tZ2l0IGEvZG9jdW1lbnRhdGlvbi9wb2t5Lnlh
bWwgYi9kb2N1bWVudGF0aW9uL3Bva3kueWFtbA0KPiBpbmRleCBiZGE4ZmYxMjMuLmFmMDQxZTM3
MyAxMDA2NDQNCj4gLS0tIGEvZG9jdW1lbnRhdGlvbi9wb2t5LnlhbWwNCj4gKysrIGIvZG9jdW1l
bnRhdGlvbi9wb2t5LnlhbWwNCj4gQEAgLTEsMTEgKzEsMTEgQEANCj4gLURJU1RSTyA6ICIzLjEu
MTEiDQo+ICtESVNUUk8gOiAiMy4xLjEyIg0KPiDCoERJU1RST19OQU1FX05PX0NBUCA6ICJkdW5m
ZWxsIg0KPiDCoERJU1RST19OQU1FIDogIkR1bmZlbGwiDQo+IMKgRElTVFJPX05BTUVfTk9fQ0FQ
X01JTlVTX09ORSA6ICJ6ZXVzIg0KPiAtWU9DVE9fRE9DX1ZFUlNJT04gOiAiMy4xLjExIg0KPiAr
WU9DVE9fRE9DX1ZFUlNJT04gOiAiMy4xLjEyIg0KPiDCoFlPQ1RPX0RPQ19WRVJTSU9OX01JTlVT
X09ORSA6ICIzLjAuMiINCj4gLURJU1RST19SRUxfVEFHIDogInlvY3RvLTMuMS4xMSINCj4gLVBP
S1lWRVJTSU9OIDogIjIzLjAuMTEiDQo+ICtESVNUUk9fUkVMX1RBRyA6ICJ5b2N0by0zLjEuMTIi
DQo+ICtQT0tZVkVSU0lPTiA6ICIyMy4wLjEyIg0KPiDCoFlPQ1RPX1BPS1kgOiAicG9reS0mRElT
VFJPX05BTUVfTk9fQ0FQOy0mUE9LWVZFUlNJT047Ig0KPiDCoFlPQ1RPX0RMX1VSTCA6ICJodHRw
czovL2Rvd25sb2Fkcy55b2N0b3Byb2plY3Qub3JnIg0KPiDCoFlPQ1RPX0FCX1VSTCA6ICJodHRw
czovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmciDQo+IGRpZmYgLS1naXQgYS9kb2N1bWVu
dGF0aW9uL3JlbGVhc2VzLnJzdCBiL2RvY3VtZW50YXRpb24vcmVsZWFzZXMucnN0DQo+IGluZGV4
IDcwMzkzMDg0Yy4uNjA4NzJjY2EyIDEwMDY0NA0KPiAtLS0gYS9kb2N1bWVudGF0aW9uL3JlbGVh
c2VzLnJzdA0KPiArKysgYi9kb2N1bWVudGF0aW9uL3JlbGVhc2VzLnJzdA0KPiBAQCAtMjAsNiAr
MjAsNyBAQA0KPiDCoC0gOnlvY3RvX2RvY3M6YDMuMS45IERvY3VtZW50YXRpb24gPC8zLjEuOT5g
DQo+IMKgLSA6eW9jdG9fZG9jczpgMy4xLjEwIERvY3VtZW50YXRpb24gPC8zLjEuMTA+YA0KPiDC
oC0gOnlvY3RvX2RvY3M6YDMuMS4xMSBEb2N1bWVudGF0aW9uIDwvMy4xLjExPmANCj4gKy0gOnlv
Y3RvX2RvY3M6YDMuMS4xMSBEb2N1bWVudGF0aW9uIDwvMy4xLjEyPmANCg0KU2hvdWxkIGJlIDMu
MS4xMiBoZXJlPw0KDQpUaGFua3MsDQoNCkFudWoNCg==

