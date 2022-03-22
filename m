Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3CCC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 02:31:37 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.5124.1647916296246244815
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 19:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=SIV9olPU;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647916296; x=1679452296;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=OOQbBtPk9IdxRy2/efyjKRY0kVGWJz9zOgV15iHnIoY=;
  b=SIV9olPUKUwYH+9zn5a+2acfkTuamLdGsvNqu5oND/1bkfPE+s3vOoVV
   MflicUZl4Pz6W4FIjU2Gvrux/X/TQ03k0Fy+0Uw9h8gS8ymHKO1SSA5Wj
   ycUYzZw4PLjKw3rm9ut4MKY3LAYj9YCHBphCbv46URyKFCj1Js2kaM0Wl
   BfZuqeOgFRuoCugeCmPRMDoEK296G//f7l/MYO8INsEtZ0gqu8YvkK8JB
   n6wOM8OBTLlytQoMARKQi0PND5WlCvqh0n12Yuj/w6uYKLfvfOiLmFi4V
   Wy/jBbi2MedHfdYhT3lpBEaKogLuxvcRvyXOJTvcikqz7CM8PkrLAbNkC
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257895383"
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400";
   d="scan'208";a="257895383"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 19:31:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400";
   d="scan'208";a="551938238"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga007.fm.intel.com with ESMTP; 21 Mar 2022 19:31:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 21 Mar 2022 19:31:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 21 Mar 2022 19:31:34 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 19:31:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hec9yevLKLbrzyYMU5LY/XgFMf/+0qwJiqbxhNeMYRE+slQouL+7kNR6cr12ubV2NLcE8VUJDvJtjXH5e2ZpgFMOD6Cb6F+uUIJaXIqyCd27BVK30p8XauiYPBWu+NJT6r1i/AJVHaVtLpGMeqiJD4o3CZQpibbCpf9GGf6AGi80t4Wi0Ua5ZYYZWyFeNhCdEhGB0Dy5yJrJ9j+hNikjTFesIezCqBQ6xeMXDyiUFvNNWWtH3y3NM1swtqHntS8SPqYIWTeJNmWtRONBi01+sLHCFl6d/rUzXJEHWOcJWaiVMSJWAXtXQnV0QvI1pM2PEETROFOtt0WTr5cbOuVJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOQbBtPk9IdxRy2/efyjKRY0kVGWJz9zOgV15iHnIoY=;
 b=PPZAOq1aGdsIft56fOkLSkFJye8/Cuw1z/AoQFZA+GCmk3qb1sWyP8dw0wIJYIfH9t/VQ7khPtVnrqwJsLZsb6ZgtBviJQdreG0MckqvpD4fa/maudeIuNOGrtyEHG6/8TrMHh/6Jpo/C+OOCEFmhMHb8GVeiRZiJX8hQ0uivGoyYGwLMeJNW/VedzVE3UliejJfDuY/INg9I5F6/ecjI9UbH5omR7mXW1ZNjNjLfx6u/9IJ0mLzL1LpeQ4xZwRvdntaK4QpBlpfRro6qvj8iBMfxZR4+gl4T9iLAnDwgiewOwN4c6lJpNCQ3hWtZaLcPgCjFiUiWk0pF1lTeY+e1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com (2603:10b6:3:a6::21)
 by MWHPR11MB1742.namprd11.prod.outlook.com (2603:10b6:300:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Tue, 22 Mar
 2022 02:31:33 +0000
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::c6a:2829:375f:9d35]) by DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::c6a:2829:375f:9d35%7]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 02:31:33 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: "michael.opdenacker@bootlin.com" <michael.opdenacker@bootlin.com>, "Steve
 Sakoman" <steve@sakoman.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
Subject: RE: [docs] [yocto-docs][dunfell 2/2] documentation: update for 3.1.15
 release
Thread-Topic: [docs] [yocto-docs][dunfell 2/2] documentation: update for
 3.1.15 release
Thread-Index: AQHYMvmaAdGwTmRajEq7r9OWdu81Tay1wpkAgBTyfYA=
Date: Tue, 22 Mar 2022 02:31:33 +0000
Message-ID: 
 <DM5PR1101MB23616C6D0C4BABA0F3F37146B9179@DM5PR1101MB2361.namprd11.prod.outlook.com>
References: <cover.1646749913.git.steve@sakoman.com>
 <df94586b9d514e35f05d3a33f6b31ee9b249ea93.1646749913.git.steve@sakoman.com>
 <c1899c24-a6cd-1714-1400-d4c22ce64ef6@bootlin.com>
In-Reply-To: <c1899c24-a6cd-1714-1400-d4c22ce64ef6@bootlin.com>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8db1ee39-9be2-48dc-515d-08da0bac14bb
x-ms-traffictypediagnostic: MWHPR11MB1742:EE_
x-microsoft-antispam-prvs: 
 <MWHPR11MB1742DAC24D850C7B5DFAF465B9179@MWHPR11MB1742.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Vit2vze4XMUcSPTjxJOcEA70gI26OV2idVFwE00n8pawKqEFUJ/78zFiZxMhg3UaChTzvQZSY34YmYT52hujZ9Iqd9Nol7OeYx8L4yIo/pQxn/hRWGF/19d9PqcUr5V+CWPO8rWYsH43FCqHezq0vekQcZH8oEUfhXJRjVB7sdN85TGni/nOW+PzQfxfetrIPybAa5A+3FcGqU5wWXK00B9lWncwKK9pbW8yZzoZ2CzaqU1uk1GH/NfUvc5AJukxuKg+xZhJl/UDwIv4HfnxeyVScD/V44YdGQ3HHiL4aUU+JLl30ThPtL6FW3W5ahjzbMZzjPqc9tKhFJSIA1vMeNy7Hw0LnZlx/dh0FncMSEgwtckROlQQqWG4rLpExefgksBQY9E3BT7s2sTCWdeiPfOJKFjjkk/WsQdA5xGk+3mC4yMu+Gq1P1FAgboe92RLm8FZUtLcy5UQZCCDzjEdxeNYGoe1HDPbTdZTft4/EfU7vlULCYOQp09OpW5QbgVxa3uH32/8851Zftb+hYyJ7c9dOjndtBpJicd6PHQfbHuYavws7HS7vyj6hrUT9/penv5W+1G5QeOFOSUnkSAwx/1NavYSPngMz/i3gz+wz4ENyKFodyC8jbRVeJYdVWinSlJAGJcE8jBiJwzbx2ukABHEKY8tLmRO7y2gKz19FnhNn8kQREsRH4sHirIx0bM2iaL1IBpFvg2J+bmK5R2O0uoU+6UHw1+14hexPY7fSZjrp1cqtoGYTe5Y5lHa0yoeKejtLDtaWxyPgwWkol4Ub4RaFy+2KviPiviltpkDogfQyFtYgcuYcTl6NiCMc4Ui0ocESIcR8ciD1jIJZaGS/Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2361.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(55016003)(82960400001)(38100700002)(316002)(186003)(86362001)(110136005)(9686003)(53546011)(71200400001)(66946007)(64756008)(122000001)(66446008)(8676002)(66476007)(66556008)(7696005)(15650500001)(83380400001)(6506007)(2906002)(76116006)(5660300002)(52536014)(8936002)(33656002)(38070700005)(966005)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bU9SeGhiUjFHeTFLUGlaL2NiN1FxQndrekFqNlkreEx2WmkwVkIyZ3EyK3hy?=
 =?utf-8?B?c2dQS1JXeVZYVDhVd3RCNlU3REphbDJWeW90dFhNYlVQVGoxM1hNR3ZkRWpU?=
 =?utf-8?B?M2E0NUIyZXozamo5UWliQkxxbXZvUlZUQm13NFdWbyszb2RFWkVBZmVKUVBR?=
 =?utf-8?B?REttWk9iVUNxdFJVTllHZGR5dWhBWGVRM2Vwd1Nuc1hic0VpQktQdnQxcVYr?=
 =?utf-8?B?bGQxOTBwVDhkbys2cmVOOGg2cjJvTGh4Y3FVRDJCTEFCTEFjZVMvbHorM3Rm?=
 =?utf-8?B?YlFBV3NqNVNwa2k4eDIvVmpNTThzOXNQMGhxeWNSL1FkcEliTE9CVEZkMStW?=
 =?utf-8?B?bExSWk1iNmdEVFRrbzM5bm9uZCtpOVRpYjhEZU1SN3pDb1FRbXRRR084MUdO?=
 =?utf-8?B?c1Noa1d6WEpMbkJLWnZITVdoemFhZExOTmFubVdSNTZhTmdEZmNZMnM0Uko3?=
 =?utf-8?B?djQ0dzNuNDhlUFcvb2NWME9XN25qdytKUnJNcmlpK0tieEJSbU00TjhFV29K?=
 =?utf-8?B?bjBGRzRCM2dYcitxUFIrc3AwaUFuQTVqZlVpdG4wSU9FQUx6bEx2NnhmeDh2?=
 =?utf-8?B?RlFYbU1xeXZERWVuWTZmMkUxdGtUNlU4aWp1Um0yZ0R0MUJmbnNhbC9UUWxG?=
 =?utf-8?B?N0lmQU94TGRRQzNjNXNVTWdBeVZsek5vSWlMQ0FWcmZERmloSlJoN1RkZDMw?=
 =?utf-8?B?bldQZ2tlZ3F2UmMydy8rb2wzclNuN0YxSTNpc2VyRHVVcWdCTDUxbmZ4YThh?=
 =?utf-8?B?REdjYjZtUEFiVVNYb2g0VlVuZVI4NU0veWhPTk9YYXI1Qk9OYlZ3TEdjYUQ4?=
 =?utf-8?B?bmYzT2tVd2JWM2UzQnRRTEYrZDNzZ09VYXhWVzJsaDFQTis0RG1KVTdueTdN?=
 =?utf-8?B?b1RXdE5BTVo4UVNRbTZJQXNvdTFEMWxQd3htWnlaMmdTY0dzWWkrVkdCT2lB?=
 =?utf-8?B?c0lubmpLaUFOWW1IanNPSFZBM2hxVHNkM1hMSmY3TWtKSEYzb3ZZTHJjSzZt?=
 =?utf-8?B?elVPOGE2enlZSVNBcW42SytJQll5RVkrcEhJeGxmVEFKMGtVRUd1c3g1NGN6?=
 =?utf-8?B?eVRWdDN5RTcvbTI0SnllSUY3amV4TWxxQ0FMbms1YjQvM0ROekp1WXRQVnNV?=
 =?utf-8?B?eE9WeTQvVGx2a2FSUWRNZ3JLenJKMThQSnoxbS9uSm45Q1F4YmlNLyt3N2lk?=
 =?utf-8?B?My9raXVWNkkrS2ticUR4Ynhsb2pFRW9XOHdVWENMcWJrR2VlUG9jL2QxYzBj?=
 =?utf-8?B?dzJHQ2pmOVlRdVplR1hSRXlPWXRUcXRGRGZ5L1dxNXhrQTdaWnlYWkErbDJ1?=
 =?utf-8?B?YitERUdIMUZGd29zU2h3RFhhSWdGV3d5UzZUaHd0aEo2STdvakprN00wRkp1?=
 =?utf-8?B?aUw1b2VOWGZsc3U0cUgvSWZkcTN0QkxXSVlQOFpTRkhqcGdGcVk4cXI1QUhx?=
 =?utf-8?B?ZXBhM093U1F1dnF3d2xmajQvWm9NczNTMnlIaVFMVHl2VS85b1ViWlFyMWwz?=
 =?utf-8?B?bGZGcnBCclozK2huVXBOUFF5RFdueDl1YWdSUko3b2VwOUU2Zzk5YWRqRkRG?=
 =?utf-8?B?TklWMnhaa2JnKzJldmhLOEJzOERhVW92WURNSlZQeWVxQk82K013UHRuRkd5?=
 =?utf-8?B?MDJiUHBocWRRdmoybk5Jc2lZMDRTU0dOejZWNGU2WE9NVlV1OHZFcFlWMUdO?=
 =?utf-8?B?MVdXMXd6S0hhaFFlQ2czUHMwME5HQVRLbGtUZStGZ0tIUEFacVhCWlhLTVFQ?=
 =?utf-8?B?N3Y1NjY0K095U0FhTUhPWnVVdVlnRHpxdjlmUGJ2eHpnQ2dyenNUWHEzelFC?=
 =?utf-8?B?QkpCQUFvdng4TEdydVl0OGxBbDduQURYMmtibUk0bE9WUlBNZWxLQnkvNWFy?=
 =?utf-8?B?S1U0Tyt5c3JNbU9SUHNsem5oQjBzUGNGbWhoZTdXdHJ1RGlaSzd2V0hQempT?=
 =?utf-8?B?MWsxU3R1OUhPOGpJdTg0VlJWKzNNUlZWL1p6ZVJrVUhheGRyQ0RSdlZOV1Jq?=
 =?utf-8?B?YUVXYXRUN1V4K0t5eW5hVTlVbzNITnM5eTErYTFoOUhMYUI3aEJLSW4wNy9X?=
 =?utf-8?Q?YU5fcE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2361.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8db1ee39-9be2-48dc-515d-08da0bac14bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2022 02:31:33.5666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 o2uqciMVhJccshKQde/yzXnTiaN18HkvORYkg05Gpj4k/Gg3iWUAM2IBIv3/OExQtW1P+K6AODn4n9UeDnKs0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1742
X-OriginatorOrg: intel.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Mar 2022 02:31:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2673

SGkgTWljaGFlbCwgDQoNCkknbSB3b3JraW5nIG9uIHRoZSByZWxlYXNlLCBjYW4gd2UgaGF2ZSB0
aGlzIHZlcnNpb24gYnVtcCBtZXJnZSBwcmlvciB0byByZWxlYXNlIGFubm91bmNlbWVudCA/IA0K
aSBzaG91bGQgaGF2ZSBpbmNsdWRlIHZlcnNpb24gYnVtcCBjb21taXQgaW4gdGhlIHJlbGVhc2Ug
bm90ZXMgYW5kIHRhZyB0aGUgdmVyc2lvbiBidW1wIGNvbW1pdCBmb3IgcmVsZWFzZSwgSSBkaWRu
4oCZdCBjYXB0dXJlIHRoaXMgd2VsbCBmb3Igc29tZSByZWNlbnQgcmVsZWFzZS4NCg0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZyA8ZG9jc0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYNCj4gT2YgTWljaGFl
bCBPcGRlbmFja2VyIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgTWFyY2ggOSwgMjAyMiAxOjQ1IEFNDQo+IFRvOiBTdGV2ZSBTYWtvbWFuIDxzdGV2ZUBzYWtv
bWFuLmNvbT47IGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW2Rv
Y3NdIFt5b2N0by1kb2NzXVtkdW5mZWxsIDIvMl0gZG9jdW1lbnRhdGlvbjogdXBkYXRlIGZvcg0K
PiAzLjEuMTUgcmVsZWFzZQ0KPiANCj4gSGkgYWdhaW4gU3RldmUsDQo+IA0KPiBPbiAzLzgvMjIg
MTU6MzMsIFN0ZXZlIFNha29tYW4gd3JvdGU6DQo+ID4gU2lnbmVkLW9mZi1ieTogU3RldmUgU2Fr
b21hbiA8c3RldmVAc2Frb21hbi5jb20+DQo+ID4gLS0tDQo+ID4gIGRvY3VtZW50YXRpb24vY29u
Zi5weSAgIHwgMiArLQ0KPiA+ICBkb2N1bWVudGF0aW9uL3Bva3kueWFtbCB8IDggKysrKy0tLS0N
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZG9jdW1lbnRhdGlvbi9jb25mLnB5IGIvZG9jdW1lbnRhdGlv
bi9jb25mLnB5IGluZGV4DQo+ID4gMDFkNWUwMGMxLi40ZGY4ZjU1ZDEgMTAwNjQ0DQo+ID4gLS0t
IGEvZG9jdW1lbnRhdGlvbi9jb25mLnB5DQo+ID4gKysrIGIvZG9jdW1lbnRhdGlvbi9jb25mLnB5
DQo+ID4gQEAgLTE2LDcgKzE2LDcgQEAgaW1wb3J0IG9zDQo+ID4gIGltcG9ydCBzeXMNCj4gPiAg
aW1wb3J0IGRhdGV0aW1lDQo+ID4NCj4gPiAtY3VycmVudF92ZXJzaW9uID0gIjMuMS4xNCINCj4g
PiArY3VycmVudF92ZXJzaW9uID0gIjMuMS4xNSINCj4gPiAgYml0YmFrZV92ZXJzaW9uID0gIjEu
NDYiDQo+ID4NCj4gPiAgIyBTdHJpbmcgdXNlZCBpbiBzaWRlYmFyDQo+ID4gZGlmZiAtLWdpdCBh
L2RvY3VtZW50YXRpb24vcG9reS55YW1sIGIvZG9jdW1lbnRhdGlvbi9wb2t5LnlhbWwgaW5kZXgN
Cj4gPiBlMzdlYTQyMGEuLmUwZjgxNjZmNyAxMDA2NDQNCj4gPiAtLS0gYS9kb2N1bWVudGF0aW9u
L3Bva3kueWFtbA0KPiA+ICsrKyBiL2RvY3VtZW50YXRpb24vcG9reS55YW1sDQo+ID4gQEAgLTEs
MTEgKzEsMTEgQEANCj4gPiAtRElTVFJPIDogIjMuMS4xNCINCj4gPiArRElTVFJPIDogIjMuMS4x
NSINCj4gPiAgRElTVFJPX05BTUVfTk9fQ0FQIDogImR1bmZlbGwiDQo+ID4gIERJU1RST19OQU1F
IDogIkR1bmZlbGwiDQo+ID4gIERJU1RST19OQU1FX05PX0NBUF9NSU5VU19PTkUgOiAiemV1cyIN
Cj4gPiAtWU9DVE9fRE9DX1ZFUlNJT04gOiAiMy4xLjE0Ig0KPiA+ICtZT0NUT19ET0NfVkVSU0lP
TiA6ICIzLjEuMTUiDQo+ID4gIFlPQ1RPX0RPQ19WRVJTSU9OX01JTlVTX09ORSA6ICIzLjAuNCIN
Cj4gPiAtRElTVFJPX1JFTF9UQUcgOiAieW9jdG8tMy4xLjE0Ig0KPiA+IC1QT0tZVkVSU0lPTiA6
ICIyMy4wLjE0Ig0KPiA+ICtESVNUUk9fUkVMX1RBRyA6ICJ5b2N0by0zLjEuMTUiDQo+ID4gK1BP
S1lWRVJTSU9OIDogIjIzLjAuMTUiDQo+ID4gIFlPQ1RPX1BPS1kgOiAicG9reS0mRElTVFJPX05B
TUVfTk9fQ0FQOy0mUE9LWVZFUlNJT047Ig0KPiA+ICBZT0NUT19ETF9VUkwgOiAiaHR0cHM6Ly9k
b3dubG9hZHMueW9jdG9wcm9qZWN0Lm9yZyINCj4gPiAgWU9DVE9fQUJfVVJMIDogImh0dHBzOi8v
YXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZyINCj4gDQo+IFRoYW5rcyBmb3IgdGhpcyBwYXRj
aCENCj4gUmV2aWV3ZWQtYnk6IE1pY2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2Vy
QGJvb3RsaW4uY29tPg0KPiANCj4gSG93ZXZlciwgSSdsbCBtZXJnZSBpdCB3aGVuIDMuMS4xNSBp
cyBvdXQsIGF0IGxlYXN0IGZvciB0aGUgYml0cyB0aGF0IE1pY2hhZWwNCj4gSGFsc3RlYWQgd29u
J3QgaGF2ZSBtb2RpZmllZCB5ZXQuDQo+IENoZWVycw0KPiBNaWNoYWVsLg0KPiANCj4gLS0NCj4g
TWljaGFlbCBPcGRlbmFja2VyLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KDQo=

