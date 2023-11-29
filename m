Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2594C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 01:22:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.web10.17029.1701220928670981577
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Nov 2023 17:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=bdX3Cvq4;
 spf=pass (domain: intel.com, ip: 192.198.163.8, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701220928; x=1732756928;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3CxIeRe475Ojf30gczKcAyllyN1Bx7Cn0bbdJeoiVb0=;
  b=bdX3Cvq4cugIiHCrTSyH08F+52eO6dxlK95Nmk+scWHiYLscfn2OR8sh
   20P9JDJDlqYdtdZe20i6iXEptaH9F99h20ABDf/cuS30r42JAk1JhfEpW
   3WVu7Wv1a+qAR785lyt2zkV2lLSBR11tGeuQV1nxLsm0/7OBdyDQ5vtrf
   9W6a0GWg8ZyEJWeG9kWS1iqNTnNrdZOVNmY5mecjm6am8TV9q3OiJkpg0
   sBZz9bOMIEEUgiMIrWfOAVsgOr5Q+KncMdVaiUnuSsOETCx6UNyUJkcYi
   oNJXFoNWJmkdp/qGYa3bD3qffgcjEZY6qrs6SzBY//aR9IrgagTbuN+ru
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6281258"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6281258"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762114991"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="762114991"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Nov 2023 17:22:06 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:22:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:22:05 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:22:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZnaUwFF8FgAPtbdnQ8l9TQoDz3iYcwWk9AG9xijJqVV8qMIENojgQPiV+PFyfYTaqVsPxiZN5NU6awf5nOnDJ6JBz1ICk7PYsM1xR5E6J+MXcD5NPUq8JUyXKZ+NRra4Khk5/SYlbX1iKtK2cYQDFLjdX0rp1BpEIHCGdafanbDuj7qinuX0Qcg5kKgI4T1FGyZhsVU8yUiEImClzcJyhuIfRfiFtu54Go75RwRm8IGXn4ROz+gS9SENplJPs0L2kPqDrqtzcE5IFBBAZV84i18ZZvTTNTGVR8JkPmxStPOdLfXndzg/swHbwaU97uRFf7tTqZmg8rPrd4k3pMABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CxIeRe475Ojf30gczKcAyllyN1Bx7Cn0bbdJeoiVb0=;
 b=EXyD3+q1KH8zDgKHi/zHYB/zYejwgEIv67XGwQYq96ix7zxZKLNJgRdguWiwbRAznbzyMpLjE+uqG+EnNWkzCgqm6j+bJFiuWpU2y4WM7z/IdaU02qvZKM4aSXaUygDZ8mSBBzpBjTvLYiBtidJx1fpuwDP+kN4eIfj1e0W8iIqfxztDoJKluCa0Mg7Ptk83sa7yyxB3ybtY+sxz3zPHUbnhLGD7vJ/9kI4eWmIjwAyy2sx+195M4LivQoSU/2s6dIQOWEk6SkM4p4C6gHpnoMF3catGCL8icGaVKN4wCKt1OLbYPsTglfKcnLGC7+Mv32U7uoN0lY5IZ2EsJci1Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8093.namprd11.prod.outlook.com (2603:10b6:610:139::10)
 by SA0PR11MB4749.namprd11.prod.outlook.com (2603:10b6:806:9a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:22:03 +0000
Received: from CH3PR11MB8093.namprd11.prod.outlook.com
 ([fe80::1fb7:4c3f:3dd2:a698]) by CH3PR11MB8093.namprd11.prod.outlook.com
 ([fe80::1fb7:4c3f:3dd2:a698%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 01:22:03 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] migration-guides: add release notes for 4.3.1
Thread-Topic: [docs] [PATCH] migration-guides: add release notes for 4.3.1
Thread-Index: AQHaIepMXOXKjs6Yak2gTMkepPOGU7CQfX7g
Date: Wed, 29 Nov 2023 01:22:03 +0000
Message-ID: <CH3PR11MB80938187B6CD704EE260C44FB983A@CH3PR11MB8093.namprd11.prod.outlook.com>
References: <20231128065058.1858790-1-chee.yang.lee@intel.com>
 <62fb1e4d-2983-49f4-8135-3e8d5a98de1f@bootlin.com>
In-Reply-To: <62fb1e4d-2983-49f4-8135-3e8d5a98de1f@bootlin.com>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8093:EE_|SA0PR11MB4749:EE_
x-ms-office365-filtering-correlation-id: d555b9ed-dfa2-4378-0f8e-08dbf0799829
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g1Di+SQyv5iabGd91//FaFUOAO6mSLBUUuqbjT3PpKUqzLM9/HWO2/9rISXZrtcEDCEneMsnc8Tl/Jei8wZUnexEDYvs7of5cFdfr2lh97YDaKapX/PBXZ0GGgq6tj3rvTwL80kpZusXbyEnoyEAKslVTgx3f5P5XL7J0zv2Oxm/njYY79ZiEWMcPSTssUXte9Tl+0VQ0SC3gFiA/AvKtEfI4/ph9Wvndo2zyr9Nl1XDJGFuRGeXBc5ahGX/3SfHrWQ3FEak3n98et7NI+pGC1uanrspgTAF75b6DjnkreWWTK1Zr2VXESdEgiExEIh3UZh/jzOpSrow2Ekm/WNCAjNoTZkicK8BNpoF+16EW0pDjkpDscNNsLJDiCfb6zvgC+yCw8AJSiKyoM8yf1rsj6hnOp81ODqwSWQtA/ZHME1XeXyM9Z+TTfTaV0+JGdyS3MyjVP/YM9XytwzV7D1ZxnqBU8xkYhLfEj9olerRQm9T6WzS+SyFW07githOd9BRRx85Xc9WQ9Lo6yIt3HvKHkip5AO2Ww/l3kHO1mFndnolbPmmRZzn+BfltP+Lfe0y0tIsFXWwwhwZ1kdy6sonUHeJcGu1El97HlJs6CUUBuMG0WAxjETNtSIZLz19f+eR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8093.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(33656002)(38070700009)(82960400001)(122000001)(86362001)(41300700001)(66556008)(66446008)(6916009)(8936002)(478600001)(66946007)(66476007)(316002)(8676002)(64756008)(76116006)(9686003)(55016003)(53546011)(7696005)(6506007)(71200400001)(5660300002)(4326008)(2906002)(52536014)(26005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZW9UbVZhNEdRN3NWVkZwaUdPeWNTWCtxOUNIVXZZU0ZML09SK0ZsOVZuQWJk?=
 =?utf-8?B?VGdjN3QycDN3T3RMK1VrNUVXOGdOYnlYeGhpZDBBdm1jOXVCTkRSSktXU2xG?=
 =?utf-8?B?dklzL2tLbG5mUkVUN3lmSXljL0RsdzA1RVlTUDk2SzJrSXNqR1p5bWZoREJi?=
 =?utf-8?B?ckVGbHY4QjQ3K1ZsTktVUSs3RUVmMG9MSHBvK01WaGpMOWVEekJJTWpxazVO?=
 =?utf-8?B?Y1R2WTNjSGQyUStYMGo3TS9LQ0lHRTZPSGdaUjJMNEg1NnJQa0FGWUtTL2da?=
 =?utf-8?B?UjN0N2lsMWdmWVNXTlhZRjVaT3NJZDRRL2JJK3pyMFZjQ1d1YmZYaWQ2U1Q3?=
 =?utf-8?B?eEVpV3diblBZY2JCZVgra2o4Z09IYi9ORjdPWjJkSHErSWMrL1ViUlAxWU5t?=
 =?utf-8?B?bmI4cUVsLzR1c2hQclhoODMrTENqNlE2c0h4SGRkakkvVlhmN1IxMHVLQm5R?=
 =?utf-8?B?MU5xWWJ5bFBaMzNqa0FibnRpVmZTOXJwL2NIU20rTzNMcTliOTRBbnlpbEY0?=
 =?utf-8?B?RmdGNVZ4eGZPMGYwWlRqNFJWanc5NFIwekdMaVZlakFWZlhLSTk3a0JFUnB6?=
 =?utf-8?B?aEhoMkoxdWI4SFJOd0tjN0VyVStZc1RUSkJiUmVtZjdmbjlWWStjQnZuT1ZS?=
 =?utf-8?B?enhSNFJnNGJBd3JFSWZDOENnK3MrSDJPL1N6elhaQTlZVVNuKzZ3N2Y0K3pt?=
 =?utf-8?B?L2pPOGU3aWhPNkd2MXo2QVRNeFJLSUZiRmhRUXZnM3hidVVNYmJmV3VVMG1O?=
 =?utf-8?B?SkN1U1F0QWdjS2k4OUxHdVpPd2g0NWU1NmF5Y2o0bGZYeDFZYlpYdXU5djFY?=
 =?utf-8?B?QUNORjc5UXlhWi9CbnN1aWlVZUVNcUZZZEZHL0JscnVieWVOVysxTUZiai92?=
 =?utf-8?B?dEd3Q0RDY1l3R1RoanU0QWZzL1QyUHpPbjQzSkQ0TVBwbmk3Ymt6ZjJzS1Fm?=
 =?utf-8?B?dy8yUlMrRVRQV2xSMGczMy8wMGtxckxPOE5QNEFUTi9weUcwOEZBVkxEY0VM?=
 =?utf-8?B?MzcyQWRPeHd6YnBja3ErQnY5NTNMMG44VHRHODc5WThSVFVIaGxIRlRtRldz?=
 =?utf-8?B?bGZ1RXdPSG5jZzB4ckVjSEszOXBaWmdhVUt6M0QxWGxsaWtGZXJrTlJBcGlw?=
 =?utf-8?B?eGlhcWM0L1VZYVdhb2hwSWVTN3c1amFOamE3elVGWXZxOEVaNjJUbTRHbUxk?=
 =?utf-8?B?TWF6aFJ6S1JWUTBqYmluaDdmeFNEV2FiWGlYRWNsVVIwNk9hUFFlUzVob3ZM?=
 =?utf-8?B?RG0vWXI5NFRPRUdNVWQ0cUIyZUYwd2tmSWxYcEJheUtMYW94UlRFdGpVU1cy?=
 =?utf-8?B?T0FXdU1WZ251SlZHbWQwN0tLZ1N3NC9kUXY3U3h6L2J1VElWQWZSdHo1SWhw?=
 =?utf-8?B?R0dxS3lQQ3Q3d0NaMU9ReGdxVUIvamNPdU55a3p6ZTY3dUtnZ1VUQ1U0d2Z2?=
 =?utf-8?B?QmVVWHRDMEJGdVErMGVDMjJhR2dkSkNaMTVhVXg1SDF1SzJMa0JpTUhsYnJm?=
 =?utf-8?B?dWZkVEN2SU9IM1RCWWtjcUxEcHpEQ1MyVE1XS2pYR3dUYnBsdDlkQ1dFdy9S?=
 =?utf-8?B?cGVVQlhpS1dBalYzcjhDZi8vMzZIZ1ZVblF0U0hiY000bFFJT1lSaVRYUU9t?=
 =?utf-8?B?Vm9ZcWtEcXhtVUNwWmVIOGJXcEdOWmNaQ09mV1VYdXBseVU5bWZicjFQOUpW?=
 =?utf-8?B?SlQ2a3JtMWVOaWt0UUhoL2dKbFgrU1dxbFZCVFVmQ1Flc0pOdkhJT2l0cXJs?=
 =?utf-8?B?L3psQU94alQyN1VkTktDWkZFakh4cVpFNVBZZWNDOXhqck95Y2hUMi9sSHlz?=
 =?utf-8?B?V2FIZXdJRnErdWxTS2p3RVFQU1hxaEZWclE2NWpnVE1lbTBQbGg0L1NkMDg3?=
 =?utf-8?B?K3BKWDdLWXZsbHNhWXZxSWhwZ1dWckVDdEdmNWhjR3lJeW12ZE5kTVZIY01w?=
 =?utf-8?B?VHNjNjFsU0tySkcrRDVsL0JrcU9Qa05YdXlsOE1qQVpScUJjQXdDZHBJdFg1?=
 =?utf-8?B?VmF4Z3p6Q1g0OVQrL0NxckRvSm1JWk93dGRzTzBWY1U5NVNkZjU3anhKT1Y2?=
 =?utf-8?B?US9mRWZyZzA3YmtuWUxrTnhwaTJWRXNHWFE2RFo1LzZrWW8rTVR6VXNDZUNa?=
 =?utf-8?Q?T8u5aZRAjaFe8qGnAl3gapzm+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d555b9ed-dfa2-4378-0f8e-08dbf0799829
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 01:22:03.7569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oq1kJX+ZA3sCUQVPS/Z9kYpPP6G4QfC/q7vuNdBxEqnmnsHpBzlNP9os/MJWqr+HJ7A7VrazUg+7bZUXNFSoPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4749
X-OriginatorOrg: intel.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Nov 2023 01:22:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4650

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWljaGFlbCBPcGRlbmFj
a2VyIDxtaWNoYWVsLm9wZGVuYWNrZXJAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5v
dmVtYmVyIDI4LCAyMDIzIDc6MDIgUE0NCj4gVG86IExlZSwgQ2hlZSBZYW5nIDxjaGVlLnlhbmcu
bGVlQGludGVsLmNvbT4NCj4gQ2M6IGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJq
ZWN0OiBSZTogW2RvY3NdIFtQQVRDSF0gbWlncmF0aW9uLWd1aWRlczogYWRkIHJlbGVhc2Ugbm90
ZXMgZm9yIDQuMy4xDQo+IA0KPiBIaSBMZWUNCj4gDQo+IE1hbnkgdGhhbmtzIGZvciB0aGUgcmVs
ZWFzZSBub3RlcyENCj4gU2VlIG15IGNvbW1lbnRzIGJlbG93Li4uDQo+IA0KPiBPbiAyOC4xMS4y
MyBhdCAwNzo1MCwgTGVlIENoZWUgWWFuZyB3cm90ZToNCj4gPiBGcm9tOiBMZWUgQ2hlZSBZYW5n
IDxjaGVlLnlhbmcubGVlQGludGVsLmNvbT4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IExlZSBD
aGVlIFlhbmcgPGNoZWUueWFuZy5sZWVAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgLi4uL21p
Z3JhdGlvbi1ndWlkZXMvcmVsZWFzZS00LjMucnN0ICAgICAgICAgIHwgICAxICsNCj4gPiAgIC4u
Li9taWdyYXRpb24tZ3VpZGVzL3JlbGVhc2Utbm90ZXMtNC4zLjEucnN0ICB8IDIzNiArKysrKysr
KysrKysrKysrKysNCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjM3IGluc2VydGlvbnMoKykNCj4g
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGRvY3VtZW50YXRpb24vbWlncmF0aW9uLWd1aWRl
cy9yZWxlYXNlLW5vdGVzLTQuMy4xLnJzdA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RvY3VtZW50
YXRpb24vbWlncmF0aW9uLWd1aWRlcy9yZWxlYXNlLTQuMy5yc3QNCj4gPiBiL2RvY3VtZW50YXRp
b24vbWlncmF0aW9uLWd1aWRlcy9yZWxlYXNlLTQuMy5yc3QNCj4gPiBpbmRleCA5MjUxNmFlOGYu
LjViNjUxYTJlZiAxMDA2NDQNCj4gPiAtLS0gYS9kb2N1bWVudGF0aW9uL21pZ3JhdGlvbi1ndWlk
ZXMvcmVsZWFzZS00LjMucnN0DQo+ID4gKysrIGIvZG9jdW1lbnRhdGlvbi9taWdyYXRpb24tZ3Vp
ZGVzL3JlbGVhc2UtNC4zLnJzdA0KPiA+IEBAIC03LDMgKzcsNCBAQCBSZWxlYXNlIDQuMyAobmFu
YmllbGQpDQo+ID4NCj4gPiAgICAgIG1pZ3JhdGlvbi00LjMNCj4gPiAgICAgIHJlbGVhc2Utbm90
ZXMtNC4zDQo+ID4gKyAgIHJlbGVhc2Utbm90ZXMtNC4zLjENCj4gPiBkaWZmIC0tZ2l0IGEvZG9j
dW1lbnRhdGlvbi9taWdyYXRpb24tZ3VpZGVzL3JlbGVhc2Utbm90ZXMtNC4zLjEucnN0DQo+ID4g
Yi9kb2N1bWVudGF0aW9uL21pZ3JhdGlvbi1ndWlkZXMvcmVsZWFzZS1ub3Rlcy00LjMuMS5yc3QN
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMC4uYTllYmNlZTlk
DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RvY3VtZW50YXRpb24vbWlncmF0aW9uLWd1
aWRlcy9yZWxlYXNlLW5vdGVzLTQuMy4xLnJzdA0KPiA+IEBAIC0wLDAgKzEsMjM2IEBADQo+ID4g
Ky4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBDQy1CWS1TQS0yLjAtVUsNCj4gPiArDQo+ID4g
K1JlbGVhc2Ugbm90ZXMgZm9yIFlvY3RvLTQuMy4xIChOYW5iaWVsZCkNCj4gPiArLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICsNCj4gPiArU2VjdXJpdHkgRml4
ZXMgaW4gWW9jdG8tNC4zLjENCj4gPiArfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4g
PiArDQo+ID4gKy0gIGxpYnNuZGZpbGUxOiBGaXggOmN2ZTpgMjAyMi0zMzA2NWANCj4gPiArLSAg
bGlieG1sMjogSWdub3JlIDpjdmU6YDIwMjMtNDUzMjJgDQo+ID4gKy0gIGxpbnV4LXlvY3RvOiBJ
Z25vcmUgOmN2ZTpgMjAyMC0yNzQxOGAsIDpjdmU6YDIwMjAtMjc0MThgLA0KPiANCj4gDQo+IE9v
cHMsIHlvdSBtZW50aW9uZWQgMjAyMC0yNzQxOCB0d2ljZS4gRml4ZWQsIGJ1dCBpZiB5b3UgbWVh
bnQgYW5vdGhlciBvbmUNCj4gaW5zdGVhZCwgbGV0IG1lIGtub3cuDQoNClRoYW5rcyBmb3IgY2F0
Y2hpbmcgdGhpcy4NCkkgbWVhbnQgdG8gbWVudGlvbiBieSBsaW51eC15b2N0by82LjEgYW5kIGxp
bnV4LXlvY3RvLzYuNSBidXQgc29tZWhvdyBtaXhlZCBpbnRvIHNpbmdsZSBsaW5lLiBXaWxsIHNl
bmQgYSBWMiB0byBzcGxpdCB0aGVtLg0KICANCg0KDQoNCg0KDQo=

