Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77549C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 07:51:38 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.5476.1667893897013632734
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 23:51:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=MYw92DWb;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667893897; x=1699429897;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ieGv5xu/BdoaUThz8tDxBbFNoGMMTAdpver/BGt25GA=;
  b=MYw92DWbGWjFJvz70HjqwBK7K3Grq5/HK1sWBQKmn8eRlAifWrx3RzcQ
   av2GVMVkrfUm4rEZPl6/RilcqvA+5hCMzMxbxDDTzq6B6tL2dtJC61uoY
   FoIq8rN+Ft9kDE6GZzw5Hect0SQauOvGM4g4mk86iwqYa0rMUFRUcUJmQ
   1TZY4Rlih2885ia9Yr1Y+CWhllE3ZRyYVqq1Ll0yjYdlRdmPRIvWowZrP
   ffO/pntaixf4mWK+oWPSYfK8S2WVMThNXgu0s2BuHiHigAFwXCYp7ZVmh
   ujiqOff3+luEE/U0l1ygg6Rh3b+XLTwiqlQpgQ26yUVn2W6zFz013tzHW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="312422847"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="312422847"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 23:51:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="638699710"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="638699710"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga007.fm.intel.com with ESMTP; 07 Nov 2022 23:51:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 23:51:34 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 7 Nov 2022 23:51:34 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 7 Nov 2022 23:51:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWdhRpul4hmje4BFUzwe1BvpqKMg3dn965IfR3bunG52Q8R3AtZXysstzJ0J4TEuIt6A151kyMHumdAV5Vgh862HuzJW+s/8Ug9SeTWiKeyGTmv2W5PouSbhJg3XlxhVZ2MGm3Bs66PWSMm5MLfHq5x6QPyOz1ZLi/C7z/Eppn8as1G8vOBby51qSqsL9TWZ7q858cD9XogTMmB7kfnoP3P5f3pp1Lm+xdWrZbIrLfjh37Sl3/88UjXYYs20uasGFtHEN518FGyJPsIb5Ymyt6ND24oE5tUgekoyRJDwY8c9UXPQUnwJi9xVOBCAfdaCs/D2AzgmNRuCgwIvKyrIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieGv5xu/BdoaUThz8tDxBbFNoGMMTAdpver/BGt25GA=;
 b=Jp6LVdxD6uH7qFaABXeHSRjIInhBt3htL+XNzfEEReAbM9eK6vWZWtJixmkLWrzKayDR82Mvc4gnlGkgzjsKTax4SG37iPIzk6T61FUlBNNYzw7tHAykjLSllYIR6MMQzPyXcsvJ8xWCQfVMyxjPiqTa31xABXS8+2VYXp7OgPXMuGrZud8yd1qkaGF75sB2A3PCqd9sZvOMFOJrvQ0YBls30w3QjsomASP1IkAfII55yOSmfzuHLSMGs8IhJzOChNhT9oPhM2LBbitQaL9Bj624Tw/LgYdvLtEGx982L6TxGiq0W4ZC/5/pNhpFHt2+h/DtfxBCLYMCy6UESd582A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com (2603:10b6:3:a6::21)
 by DS0PR11MB6447.namprd11.prod.outlook.com (2603:10b6:8:c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 07:51:26 +0000
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::343b:6071:ac6f:a80d]) by DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::343b:6071:ac6f:a80d%7]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 07:51:26 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: "michael.opdenacker@bootlin.com" <michael.opdenacker@bootlin.com>
CC: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: RE: [docs] [yocto-announce] [ANNOUNCEMENT] Yocto Project 4.0.5 is
 Released
Thread-Topic: [docs] [yocto-announce] [ANNOUNCEMENT] Yocto Project 4.0.5 is
 Released
Thread-Index: AdjzFBsojWme/dkRRd2IH0psu+T8PQAMAWUAAACbrXA=
Date: Tue, 8 Nov 2022 07:51:26 +0000
Message-ID: <DM5PR1101MB23618C31710F7348F1297E59B93F9@DM5PR1101MB2361.namprd11.prod.outlook.com>
References: <DM5PR1101MB23614EEED79BF6514F03E1B2B93F9@DM5PR1101MB2361.namprd11.prod.outlook.com>
 <8a14e2ce-2719-52ae-0259-f280da69f6c8@bootlin.com>
In-Reply-To: <8a14e2ce-2719-52ae-0259-f280da69f6c8@bootlin.com>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR1101MB2361:EE_|DS0PR11MB6447:EE_
x-ms-office365-filtering-correlation-id: a9ec2603-eb00-402c-504a-08dac15e09d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cW9TKrLJsO65jM/1yD5dKlznGSwd3tZaCJhlCNUvUs725675dcfWTSxq9SnMfYP8nvrRHRlarx8xd96QJr/T+017u+M1ZfJZdALePeX1etrK6Pw27V++BnAzXkIhfV17z91brDDlht63AL1G29R5BcnlZ6l0eUf4sW2UAIikYfT4sRdvhQ/9RLyfifFUEtUFNVoglLJwmQiOB7K8WB2Z2GXAHTd425HcOVelzXKF/ZIUnNRb4zZOamP5gkXg+cnqHUzIJ4cUfcCjtLWlEp5STqrhV2wW+1/ELtmx5i4Q6q+s6CchzE71bdQEjlC9Y5TCoJsBRcgUhQFP9zO5/NAiaqTEAi7MQWv1C+wB5iJCduCcm0hoc7XY58xT9cj2F+z0gyCRUal/gbbirpIkGcWRwhLaDtgFlxja2JwiKnn9b1wAIwwcmch575cQid9JcI3nDyOQTkLRTpVK7CBQn+WAdbXhWeGOaqSI2g2ss7p1PsssyhnnncQmjB+gjUPv3e9tqh5+Y1di5Zjt2pWIxEQadC8/moZJlhsPgnFTCIGqImvDfllG3JYE/38cxymEXN+A4VLCchUpqs0JX/WmN7sX8g2KeGdpu6znQeiJQhihRuPagN/odfUFF3JyuRvvpId2X88eB2LjeLUhao28iV/N+v2fiMPGJWfZSuqzgzteyNkjEwLcfaZtTWBuM7d+KdRXT+E1tpzcYrPRwh0SOd1CnyCmwq1Vw8a7WJ+CGZJEkD8SMNFRDVHOlnKL7a3HGCXgiVRGBk4Z74qsUg1KkWdkhTvTwOePWFhP8/poYoxWp1jHqR5u+gBFlno9/Swk5hy8waiyv4G3/2DDkdIbu0W3Jw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2361.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199015)(52536014)(38070700005)(7696005)(6506007)(86362001)(53546011)(33656002)(66946007)(316002)(6916009)(55016003)(41300700001)(9686003)(66446008)(64756008)(66476007)(76116006)(8676002)(4326008)(66556008)(71200400001)(966005)(478600001)(83380400001)(2906002)(5660300002)(38100700002)(122000001)(186003)(8936002)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tm15NEpJSWVwdVNmc1pFVVl1MkFLajlXaXFFbSttcGFwTm9uQ2sxYlBGcGJt?=
 =?utf-8?B?WFozUGcxK1VwSXJHblYydHAvSFduQkxvTXhtVWgya2kxVk9FclBLbHcwdGlU?=
 =?utf-8?B?MjE4MkVPMElIL2RPS09RWEtNK1FLU2hqTUlHdlpGVlFIK2JTWk1LdmU0R08x?=
 =?utf-8?B?OXE3bWhERzZWVm9PelAzMGtHWE51NjV5SEljc1hJWGlXd1NtT1RJb3NLaFFZ?=
 =?utf-8?B?cnBib0daalo0WlkydC80U2hwQ1VMQzlaL0pKWkUyb0tDOVZ4T1IrV0w5bHli?=
 =?utf-8?B?eklHcnR0bjArbGFHY2Q5SUl2aGVqOWJ6UUcxQ0xhbGZHTkN4MFYrV2dYOTFi?=
 =?utf-8?B?dEpoMVo2TkVWcytwQWF2NFhSNXh2N25OZEEybmhFbWhKK1h4eHNYcDBlZUls?=
 =?utf-8?B?aG9pZDhZYzFER3V2K0cvOElIOXk4T0Z4S1RHZUUrMUhaZE5QSS8xNWpna0xl?=
 =?utf-8?B?cWdyYnl2QkJLQlgxTDRsRzNmc1ZWbUI1QzZOMFlPSnFqcTdjUHFocjZFODJs?=
 =?utf-8?B?RGdsMENFdFgyOE81N3FBcWZUQXlRTlNEekpMdVlHa1FNZGFqQnhhSDg3QXJu?=
 =?utf-8?B?QktTZEp1cXlEZVljRGdGYW1rcVhOREtxNEkzS3NOUjhXTVltM2lFakIxL1E5?=
 =?utf-8?B?NmtWOWtHU2hMZGRGY0NuVUpoUWlkZjZSVitTZHRweUI5dDI4SjVzMHA1bTdj?=
 =?utf-8?B?NGlTZkc3aDFDb0dxakl5ZmwwSW55OStENEtrQ0ZJMjZndVdONVM5czUvNmM5?=
 =?utf-8?B?RVdWK09sOFFFTVltR0ZGMFlCaFJPUit4UG9HSlZvRnFzRkpMV2pveWJkNVUw?=
 =?utf-8?B?b1l0Wk0xaFpUblNqVmd4NFRVU29NVVluaGIrNDZQMklPeW9RajBGUS9DdGhH?=
 =?utf-8?B?QWNIMEhCZy82TGN2YnluNkE3TlNYcnFZS2wvV0xPQ0RwZ1I4UUhhc0t0dklP?=
 =?utf-8?B?eko5dU9aTnRvMXpLUnNhQXVmenNTMlJNUHlnUXRjcDdtWXo3YktwYU9BTm1i?=
 =?utf-8?B?Q2w4RHNkcVp2b3F2ZHFWMHpVcnowZWJXdDM1S1kwdXJpTWZYUHpUdnh1SkZT?=
 =?utf-8?B?SUQwWWd3OTB3NFRIUTdVUkhod1N5VUNaUlhNdmtocWU3dlViS0JsRjNoV0ZT?=
 =?utf-8?B?b3UxdU9VRWlnT1ZsNEErN095YzlQeUN2L0JlMVBEbXlDMW9mQmVaV25VTEtS?=
 =?utf-8?B?OVpqWWlYVHIxZGhKaEp1ZDBROUlSaWJ2bGtMQ0xUanRvdDM5bm56aU1YNDdK?=
 =?utf-8?B?eGk3SzFFdHI3cHBiQlFIcjhoZ0plMWgwYnRUT2N4SlQrQm9JK2g3dEJLbDNi?=
 =?utf-8?B?VXFKbVEzZ2YrWFpOQTUxWEVKZ0xmaE9sUzhCSnJFc29WNmRHYXZWUTAvRnF4?=
 =?utf-8?B?SW4xd1cyS2ZXRGNFOWd5K09wNURRdHdoRU1kZTVCejVKSyttd0UyV09YSTNm?=
 =?utf-8?B?akFvMTh6K2dvelh0MGlnTCsrclJURnd0SThVTWJoS3JWTWoxUGZGZDdNdnJF?=
 =?utf-8?B?QjZnTDNrM1dtblcreWphRUZsbWdZRytyaVlTSGZTaEpQbURaK0F4OVN6V3hJ?=
 =?utf-8?B?R3RVUE43NlVMb05tVWRHbzJyTFBad2Q1SFRvMjlDMER3Ky9PNS9hSktHNHF3?=
 =?utf-8?B?dHJxempaQnFNQXlYdlBrS1pOVW1ZUzZqTXhDRHNpc2RFTTQrYkdRblNaQzBQ?=
 =?utf-8?B?ZHcvODNwZ080aWhLS29zYjJDbWhHK3YyaTJFZ1BXZXVSVGsxN3IxbElRZ0ky?=
 =?utf-8?B?eUs2RlorUXFreVZ2R3VkaVlpVmI1eVErTzNJOGJNTFRtRmFsWWlJb29RTEsr?=
 =?utf-8?B?V1h1TWxZWGdMVmdQR0hTam1tb2FhekVmeHpYOVBEVnY4OHI4N1cxdlhvSGhD?=
 =?utf-8?B?TlpYaEtTcThqY01IeEMwR3hNVDlzMzN5d2tTcDYwODlMN05oWm0yenJCUXdm?=
 =?utf-8?B?NDFtaWxnSjBIYWlLMnA1eXJJemdhVGhmQXdtTlo2OWxtbWlnb0JsSWtiV04v?=
 =?utf-8?B?YlZzMTJhRkFFdFdtbWhPbWY0clZpR2pGamlrM0JaTW5CdkIrWVNRenRLOG16?=
 =?utf-8?B?MzArMEI1WnBsWURrYms5S203dkhWVU0vOVFTMmJnOGVMOURZVy9JTTJPZ1Q3?=
 =?utf-8?B?UlFWaituUW02N0gwOGRBTTBpVFc3TGVvSjJadU5FblpIZG9lVFlDdURnUjN2?=
 =?utf-8?Q?HGdYcR3z7oAs+g5ZO3EC1qPIi9b9CNq2nzIDfphxtkhe?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1101MB2361.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ec2603-eb00-402c-504a-08dac15e09d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 07:51:26.1833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 37s/oZjVF/SEoGkROSO/71GPKaMiQmc8dCPogfemfMgw4stDHXyZdek8PLnw4wilFRFJLmCg8IjqFyeaeOABJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6447
X-OriginatorOrg: intel.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Nov 2022 07:51:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3466

VGhhbmtzIGZvciB0aGUgcmVtaW5kZXIsIHdpbGwgc2VuZCB0aGUgcGF0Y2ggc2hvcnRseS4NCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkb2NzQGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcgPGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmDQo+IE9mIE1p
Y2hhZWwgT3BkZW5hY2tlciB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTZW50OiBUdWVz
ZGF5LCBOb3ZlbWJlciA4LCAyMDIyIDM6MzIgUE0NCj4gVG86IExlZSwgQ2hlZSBZYW5nIDxjaGVl
LnlhbmcubGVlQGludGVsLmNvbT4NCj4gQ2M6IFlQIGRvY3MgbWFpbGluZyBsaXN0IDxkb2NzQGxp
c3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbZG9jc10gW3lvY3RvLWFubm91
bmNlXSBbQU5OT1VOQ0VNRU5UXSBZb2N0byBQcm9qZWN0IDQuMC41DQo+IGlzIFJlbGVhc2VkDQo+
IA0KPiBIaSBDaGVlIFlhbmcNCj4gDQo+IE9uIDExLzgvMjIgMDI6NDcsIExlZSBDaGVlIFlhbmcg
d3JvdGU6DQo+ID4NCj4gPiBIaQ0KPiA+DQo+ID4gV2UgYXJlIHBsZWFzZWQgdG8gYW5ub3VuY2Ug
dGhlIFlvY3RvIFByb2plY3QgNC4wLjUgUmVsZWFzZSBpcyBub3cNCj4gPiBhdmFpbGFibGUgZm9y
IGRvd25sb2FkLg0KPiA+DQo+ID4gaHR0cDovL2Rvd25sb2Fkcy55b2N0b3Byb2plY3Qub3JnL3Jl
bGVhc2VzL3lvY3RvL3lvY3RvLTQuMC41L3Bva3ktMmU3OQ0KPiA+IGIxOTkxMTRiMjVkODFiZmFh
MDI5Y2NmYjE3Njc2OTQ2ZDIwZC50YXIuYnoyDQo+ID4NCj4gPiBodHRwOi8vbWlycm9ycy5rZXJu
ZWwub3JnL3lvY3RvL3lvY3RvL3lvY3RvLTQuMC41L3Bva3ktMmU3OWIxOTkxMTRiMjVkDQo+ID4g
ODFiZmFhMDI5Y2NmYjE3Njc2OTQ2ZDIwZC50YXIuYnoyDQo+ID4NCj4gPiBBIGdwZyBzaWduZWQg
dmVyc2lvbiBvZiB0aGVzZSByZWxlYXNlIG5vdGVzIGlzIGF2YWlsYWJsZSBhdDoNCj4gPg0KPiA+
IGh0dHA6Ly9kb3dubG9hZHMueW9jdG9wcm9qZWN0Lm9yZy9yZWxlYXNlcy95b2N0by95b2N0by0N
Cj4gNC4wLjUvUkVMRUFTRU5PDQo+ID4gVEVTDQo+ID4NCj4gPiBGdWxsIFRlc3QgUmVwb3J0Og0K
PiA+DQo+ID4gaHR0cDovL2Rvd25sb2Fkcy55b2N0b3Byb2plY3Qub3JnL3JlbGVhc2VzL3lvY3Rv
L3lvY3RvLTQuMC41L3Rlc3RyZXBvcg0KPiA+IHQudHh0DQo+ID4NCj4gPiBUaGFuayB5b3UgZm9y
IGV2ZXJ5b25lJ3MgY29udHJpYnV0aW9ucyB0byB0aGlzIHJlbGVhc2UuDQo+ID4NCj4gPiBDaGVl
IFlhbmcNCj4gPg0KPiA+IGNoZWUueWFuZy5sZWVAaW50ZWwuY29tDQo+ID4NCj4gPiBZb2N0byBQ
cm9qZWN0IEJ1aWxkIGFuZCBSZWxlYXNlDQo+ID4NCj4gDQo+IE1hbnkgdGhhbmtzIGZvciB0aGUg
cmVsZWFzZSB1cGRhdGUhDQo+IFdvdWxkIHlvdSBoYXZlIHRoZSByZWxlYXNlIG5vdGVzIGluIHJz
dCBmb3JtYXQgYXMgd2VsbD8NCj4gDQo+IENoZWVycw0KPiBNaWNoYWVsLg0KPiANCj4gLS0NCj4g
TWljaGFlbCBPcGRlbmFja2VyLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KDQo=

