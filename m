Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E9DC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 05:01:46 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.6237.1647579705343226911
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Mar 2022 22:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=NhqtDWwp;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647579705; x=1679115705;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=l73QzgiIxVX1i0Q5s7JSKaGNuRBabJ7fwm8wNyEClZ8=;
  b=NhqtDWwph6t7rH98HV+ibhwRd6gHC9XPJNNM4i90MocodDQfM2zWGibk
   8bbNe28N9NEmKRFqXHqI7dGKYKgl7IvVnj8HThWdlh9jnfwoqWJecSLjT
   WIIDA+Lv0agFd69yeWLfKqAp8sVjvfKdwKYBFUL3Uxk46DxDXN26qwAJL
   IljpebSdZxb3HIIFWPWvbU53tgCeQkiBff7TsTKkFaRjryaANBOgl7fdx
   TicVznTWDTm+VnymVswKvX+sSfo1sGeb4VdnJmLeCg0vYn9HzoZq2XJDr
   mkePVmvsgmxYZ3ArmTEskwHkrkOrZWHcbZq4DebyuN4fKIxo2J+aC6Nnc
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="257235902"
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400";
   d="scan'208";a="257235902"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 22:01:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400";
   d="scan'208";a="517041055"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by orsmga006.jf.intel.com with ESMTP; 17 Mar 2022 22:01:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 22:01:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 17 Mar 2022 22:01:43 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 17 Mar 2022 22:01:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDa2wMxDxixMj6tXWTmT+IgIn2ZhsKaByjIR9/dEEim3wL+adWmNKqOZIMqdA6babPsZtyI0ry5HlHPlnC3U4/sRfOhL7+05hQm/cmzdm8R0Dm5aSaz1SlkDu+vQs//LZXd59QyZWaMOHS7g+XcEDddhY57dDJvGLknlhDI80t0ySAdqPNjm6tmjtivOXGeGrUUiHDsEdYW8PK7itT5Jo49jOsY0Ksk9RJvdV7MMGKvFjKz8BFT+Lj5YrgizXAmSHNCwpNKBUsetIMQuk62adSnFHj7erK0AzgsAqELPteywevMCij9DbXxbvBKPwvXNgGu6T1cvI6ZEqQA21CY55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l73QzgiIxVX1i0Q5s7JSKaGNuRBabJ7fwm8wNyEClZ8=;
 b=nEu1YQqzLpPNq/hcr3N4clzeZ26iHoVT8IA+ucWY8o0dToO0ERNU4VxPiaQZ9Xf9sDryh4LkpZcGrLI5A4CeSzZN49lCtIDT0K8OBqAWfhgnBFqsORVsDz3YTvx89S5W5OXcI0ZAY3wS7Owq6UlwvgdCdhJo4rJhp4x3odcxDhiNlC9Tb269ehVttuuadJH+LUKKiPWJChERhUNKgIgD3d58m43KJJI4zfCyUgJhikbNci8WL9sZ3cMyMKbTzpaRuy7DZeU09Kubytj4vfb+VgE57hNh6gST7+dH26DBsx1h/kBigZfNlTkBDbSrXs37hmwVnvXnZSUbuExXQPHEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com (2603:10b6:3:a6::21)
 by BL1PR11MB5286.namprd11.prod.outlook.com (2603:10b6:208:312::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 18 Mar
 2022 05:01:36 +0000
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::c6a:2829:375f:9d35]) by DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::c6a:2829:375f:9d35%7]) with mapi id 15.20.5081.017; Fri, 18 Mar 2022
 05:01:36 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: Steve Sakoman <steve@sakoman.com>, Michael Halstead
	<mhalstead@linuxfoundation.org>, YP docs mailing list
	<docs@lists.yoctoproject.org>
Subject: RE: [docs] Version bump before release
Thread-Topic: [docs] Version bump before release
Thread-Index: AQHYOlvPlfFppZAIA0GiwfMThZ3Qz6zESpaAgAA0EFA=
Date: Fri, 18 Mar 2022 05:01:36 +0000
Message-ID: 
 <DM5PR1101MB23611C6CF3B5EC4D06FA865BB9139@DM5PR1101MB2361.namprd11.prod.outlook.com>
References: 
 <CADfgfobCTXyBYSSjekdKJp4ekrmHWH+imjpARMrCMLp2gwTr5w@mail.gmail.com>
 <CAOSpxda4QwAwJhie=FWiN_gYsGn-j4gMK2V+dP-d_W_1f9SbGQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxda4QwAwJhie=FWiN_gYsGn-j4gMK2V+dP-d_W_1f9SbGQ@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 74c91f5c-71a3-49fa-0a0f-08da089c613b
x-ms-traffictypediagnostic: BL1PR11MB5286:EE_
x-microsoft-antispam-prvs: 
 <BL1PR11MB52860446CCA4BC2BCA968211B9139@BL1PR11MB5286.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hFbMZ6+ddt8S6jMPNY2QC11HxnR8Pqs+gNvFmiIUIgeQ+giv6fJagHJ5rKnAeHqAWvYZgtTnc3g6XK5EPmbXrcwNkoQVtLqQMqssCK1563p2CH5RJ9Mxqh0K+j6gzDKvZpIdP9Iy6Y0bpIjUe+10RWnSO+skIwNBVItzoFfUzWBfld/e9v65d0G8niLYduIyl/cRbdvPv0lMXRo2SdhvdaKc305KfoRtMDzLOvliGKXYr7YhVe/IVdvmj+ZDMXzKGbN/uKbLLLPPuOelen0TRmzVE51aLyYOwlVBNr8IByND1r0UjSMn6fYXqebAtrVGm8LtJp14soJcFj0sdk+7tU45W6Dlqxw2r7MjJQyta2jHNiUg0EOF7QH3gKJhBMnR+JSKha3fu8UcY1ZFf0bkrPlorTow6yn5JV4fFTml4U4FGDkXXyYFo237AsHWE3wvWy9KtxK2HRkWyRuwaBNy3oOe+7fDNNm8npBUw+ZKp0npYF+DUd2GXEn528WmSWO9M+TrNCMTtvlDhOUrCij3GQ9Z8+QCUHdrTVavYSvXBx+BDfs6f5TtdlCTVVLLCVlZf0gjj0EuIgvx+r6Z2heIfwX6Sj/8j900ujW/dqt4bti1XkgtqaAOaLT5ffhscI2GDYs9LH91DqKH05iTmyMleBRtsrFZL8ITV7K5jzUBLten8JkjwOyQnSTR0zSpjPlYYkvIKqfdiFWazYcOKcC5Bo2vQzaag/GPIDvvTH9hcDIRUqzPIZ7j7u2mWs9pL0v3q4jKhFJaMXxMa2THuRjAXtVRJVK8gFNLXVU426sYQ+5RcdlVEhJLXPPoXyt7VHcR1fGdPqajqjxYepbKppUZ2g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2361.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(76116006)(66556008)(66476007)(66446008)(8676002)(64756008)(38070700005)(66946007)(5660300002)(966005)(508600001)(38100700002)(82960400001)(122000001)(110136005)(52536014)(8936002)(33656002)(55016003)(71200400001)(83380400001)(9686003)(2906002)(316002)(6506007)(53546011)(7696005)(86362001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RVNocE9ERVhtdXl6b2xPcTd4K045VnV5UGZuR1FyYWZjN1Q0WWJGNmo4b1pC?=
 =?utf-8?B?bWtHcXRKc0ltT0xMM3hpYXF4c3ZmaXVmZno0clhYQnV6R1c5MGY1c1dnYU5Q?=
 =?utf-8?B?VlRzalNIckhmOXBCZkYzWk1EYlZhOHpoWXM1NXdmZm1RZEFNSjdHdzVVc3lO?=
 =?utf-8?B?YnYyVU84SzJ0NHRFQ3ZhMkp4WXd6SVdWL3hxQjVLbmhKSjFvSjRFblVHeVdr?=
 =?utf-8?B?WGp3dkRIVytzWm5NVkZtbklhQ2kydnQvSGM1ajdDYkZtcTB3dmI0RGo0OTVB?=
 =?utf-8?B?eGEwbVF0KzlyNURpNGF5dHJINmoyRjhpd2Q4VUpyS21oYmx4dThPelM3OWc1?=
 =?utf-8?B?TnhncXZqandBcjBZNWtSN3o4YzBUWmtBSlh4MkViMGFEdURkOEpGejc5eTBx?=
 =?utf-8?B?TkdLMGp5Q1ovZnpCU1JDbkVmQ1hjSGZyd3d6QzdldDlNOTRVeDdBek0yU0JS?=
 =?utf-8?B?dHFYY1ozeXhncFFJd0ZUSWhmbDRRalVQYWZ3MDFPQm1xL0Y5LzRuRUR4LzlX?=
 =?utf-8?B?Z2tkK3FKMnJka0gxd3FjOHJVY1pVZjF6WHFsVjZJdXpKSGlEN2xINWtKaW5h?=
 =?utf-8?B?S2JySkptTHAyVWlBQUtEMmMyNDR6V1Q2bWEwL3BnRDJlNnRubUxhem9xVkp0?=
 =?utf-8?B?RDlmUlVvVVpGdzNoOCtkRm45U2RVZkpNc1hGOWd3WXErckJqWmRXdUNkN09E?=
 =?utf-8?B?WVRIOFQwNVkrbU9mbWJQNm43cG0vUXBnWU9LWGNkc3ZOQXF3dTd4SmpwK0Ni?=
 =?utf-8?B?ZWw2dUZYZ1h4RklXNjF0Y2hiWlM4Y1Z2bmlCMEhDQmRTMU96SVZZdlRZMGlM?=
 =?utf-8?B?TmtNTFU0RmRWQ3JmRUxEQVV5dnFsSC94emlGN28rNllPOUtUdGhlVmQ5YUFG?=
 =?utf-8?B?Y01Na09jSG55WjRmM1pVZ045K1NrMlM2SWl6RjNTbWVNWWVtNVkxRE1ONjdx?=
 =?utf-8?B?MXFTY0d0UlRVa25nQjhyRWxRc3l5bXpDcHNBNVNoMVJQTm5mVDN6alVCZWxl?=
 =?utf-8?B?UFAxYWNHWU9ab294WEN4S2M5a1RtcGE5ZGo3RDlNUWkxL1QrSm9weld1OW55?=
 =?utf-8?B?OThaSTZvKzN5MUVHeTJObXNaMmJ4aXpIY3A3VEt1Z3N4dDA4c3Q2RWtjSHBu?=
 =?utf-8?B?aUFNYTl1Q2pZc1JFR0ZYTUpTVkc2aWo4NEdXSzgzWTRDaDlrT3Qway9TQkNv?=
 =?utf-8?B?M2lpV0w3TFhtRGNxcHZHYzdadTBqaERLYzMyV2V6YkN4dDhMbEFTSUhEZ2lw?=
 =?utf-8?B?Z09XSkFIWlBndlNOaHloRnNBQW16WXZTcVZlaFpXVXJEdmVnY0crUTlTV1R3?=
 =?utf-8?B?YlZLblRjK2kwSHl0NUFCYXlqTENHKzRNU1BvU2xUNVdubm5EcW1aTCtyUGYr?=
 =?utf-8?B?MG1KaDgvTEpXZ0wwL0gzVUpTaHM3R3JWYVhGVXZDS0RWZDliQWVWZG1RdE9P?=
 =?utf-8?B?UEVoYk1KeVY2dkU0RmRkaVBJSXRFTW9tbWs3R3o0Q1pia29GZkVCb2QvVzdw?=
 =?utf-8?B?MmN0WktUTVpETldmQ0Vjck0xUmZ6amxLZ0dERE5VT1VONG9LR0s1ZjRaNnJy?=
 =?utf-8?B?d291SXRyVStNVWwvNE13WEZOdVREM0YrVlpQKytySkdWVEkwNzM0b3J4Rm9n?=
 =?utf-8?B?SW5KT29nUmxkSVZQbklIYjNUSEFvbDAzWDZPQzVtK081S0kxd1FZVjZQcWt6?=
 =?utf-8?B?dlJIdS9OMlpMQnlIalpzY1d6aU9qWUFhZTFJc3QxaFFEZ0V1TytvSUtKN3Bl?=
 =?utf-8?B?OFlFMDZYSUxIWStqSS83Qi9XN2xTc0JWd3NZYnZQQmFGdEpkQklSdUdKYnhH?=
 =?utf-8?B?QVhMWGU4WkJmR3V5a094TEJRdFJvakQrRkIzbjI1b0hVN2kyZTgwNTM5ajlQ?=
 =?utf-8?B?cHhpQnl5cy9Zcm5qRExxeEQ0ZWpSbjd0R3Erb1BtSEZiSTJMWnBrcmVKV1Fi?=
 =?utf-8?B?ZE0xaEZ2YmgwMDY0Y1ZTdHRTWXcvMktzTnZWVTZOT3VielArNk83b1BOdW80?=
 =?utf-8?B?eEFlTXZZVVhCUDRIVU9OMGJMdkcvQ3pkcGlJNGo0ZTRVWXhlTnFCbEIvK3Nm?=
 =?utf-8?Q?OdzoUt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2361.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 74c91f5c-71a3-49fa-0a0f-08da089c613b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 05:01:36.4744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 YwqOKzJNfOplXJk/ocRFJLz2KrPGC4Q7dq3lEMyZ+ihmhfwQvAZO/1UJ6VLofgtQbNON5tSoi06Y+2Vqqm1CCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5286
X-OriginatorOrg: intel.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Mar 2022 05:01:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2621

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGRvY3NAbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZyA8ZG9jc0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYNCj4gT2Yg
U3RldmUgU2Frb21hbg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDE4LCAyMDIyIDg6MzMgQU0NCj4g
VG86IE1pY2hhZWwgSGFsc3RlYWQgPG1oYWxzdGVhZEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBD
YzogWVAgZG9jcyBtYWlsaW5nIGxpc3QgPGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj4g
U3ViamVjdDogUmU6IFtkb2NzXSBWZXJzaW9uIGJ1bXAgYmVmb3JlIHJlbGVhc2UNCj4gDQo+IE9u
IFRodSwgTWFyIDE3LCAyMDIyIGF0IDI6MDQgUE0gTWljaGFlbCBIYWxzdGVhZA0KPiA8bWhhbHN0
ZWFkQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gSGVsbG8sDQo+ID4gSW4g
dGhlIHBhc3Qgd2UndmUgY29ycmVjdGx5IGJ1bXBlZCB0aGUgdmVyc2lvbnMgaW4gdGhlIHlvY3Rv
LWRvY3MgcmVsZWFzZQ0KPiBicmFuY2hlcyBiZWZvcmUgdGhlIHJlbGVhc2UgYnVpbGQgYW5kIEkg
b25seSBuZWVkIHRvIHVwZGF0ZSB0aGUgbWFzdGVyDQo+IGJyYW5jaCB0byB1cGRhdGUgdGhlIHN3
aXRjaGVyIG9uIHRoZSB3ZWJzaXRlLiBUaGlzIGRvZXNuJ3QgaGFwcGVuIHJlbGlhYmx5DQo+IHRo
b3VnaCBhbmQgd2UndmUgYmVlbiBoYXZpbmcgdG8gcGF0Y2ggdGhlIGJ1aWxkIHN5c3RlbSB0byBt
YWtlIHRoZSBkb2NzDQo+IGJ1aWxkIGNvcnJlY3RseS4NCj4gDQo+IEkndmUgYmVlbiBjb25mdXNl
ZCBhYm91dCB0aGlzIHRvby4gIEkgYWx3YXlzIHN1Ym1pdCBhIGRvY3MgcGF0Y2ggcHJpb3IgdG8g
dGhlDQo+IHJlbGVhc2UsIGFuZCB1bnRpbCByZWNlbnRseSB0aGV5IHdlcmUgdGFrZSBwcmUtcmVs
ZWFzZS4NCj4gSG93ZXZlciBsYXRlbHkgdGhpcyBoYXMgY2hhbmdlZCBhbmQgSSB0b28gYW0gbm90
IHN1cmUgd2h5IQ0KPiANCg0KRm91bmQgdGhpcyBkaXNjdXNzaW9uIGFib3V0IHRoZSB2ZXJzaW9u
IGJ1bXAgdGltaW5nLCBJcyBpdCB0aGUgcHJvY2VzcyBjaGFuZ2VkIGFmdGVyIHRoaXMgPw0KaHR0
cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvZG9jcy90b3BpYy84NzI4Mjc3MyMyMjAwDQoN
CllvY3RvLWRvY3MgYXJlIHRhZ2dlZCBiZWZvcmUgcmVsZWFzZSBhbm5vdW5jZW1lbnQsIEkgdGhp
bmsgd291bGQgYmUgbmljZSB0byBoYXZlIHRoZSB2ZXJzaW9uIGJ1bXAgYmVmb3JlIHJlbGVhc2Ug
c28gdGhlIHRhZyBjYW4gYWxpZ24gd2l0aCB0aGUgdmVyc2lvbiBidW1wIGNvbW1pdC4NCg0KDQpD
aGVlIFlhbmcNCg0KPiBTdGV2ZQ0KPiANCj4gPg0KPiA+IElkZWFsbHkgYWxsIHRoYXQgd291bGQg
YmUgbmVlZGVkIGF0IHJlbGVhc2UgdGltZSBpcyBhIHBhdGNoIGxpa2UNCj4gaHR0cHM6Ly9naXQu
eW9jdG9wcm9qZWN0Lm9yZy95b2N0by0NCj4gZG9jcy9jb21taXQvP2lkPTc4NTQ1YjhmNDI2NTdj
MjFiYzNjYWM5NjQyOWQzOTUwYjA3YTNhY2EgdG8gdXBkYXRlDQo+IHRoZSB3ZWJzaXRlLg0KPiA+
DQo+ID4gTGF0ZWx5IEkndmUgYWxzbyBoYWQgdG8gbWFrZSBwYXRjaGVzIGxpa2UgdGhlc2UgYXMg
d2VsbCBkdXJpbmcgcmVsZWFzZToNCj4gPg0KPiA+IGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5v
cmcveW9jdG8tYXV0b2J1aWxkZXItaGVscGVyL2NvbW1pdC8/aWQ9Y2E4ZTkNCj4gPiA1Mjc2ZDk2
Yjk0ZDk3ZTI2OWIwZjRmOWFkMzA2Zjg0MTdkNw0KPiA+IGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVj
dC5vcmcveW9jdG8tZG9jcy9jb21taXQvP2g9aG9uaXN0ZXImaWQ9Nzk4MGNmZTkNCj4gPiA0MmEx
YzhjZWIzZmQ2YjAwM2VjNjM0NmQ5YmMxMTAxNSAgKGhvbmlzdGVyIGJyYW5jaCkNCj4gPg0KPiA+
IFdoYXQgcHJvY2VzcyBjYW4gd2UgcHV0IGluIHBsYWNlIHRvIG1ha2Ugc3VyZSB0aGVzZSB2ZXJz
aW9uIGJ1bXBzDQo+IGhhcHBlbiBvbiB0aGUgbmFtZWQgYnJhbmNoIGJlZm9yZSB0aGUgcmVsZWFz
ZSBjYW5kaWRhdGUgYnVpbGRzPw0KPiA+DQo+ID4gUmljaGFyZCBzdWdnZXN0ZWQgYSB0ZXN0IHRo
YXQgd291bGQgbWFrZSBSQyBidWlsZHMgZmFpbCBpZiB0aGUgZG9jcyB2ZXJzaW9uDQo+IHdlcmUg
b3V0ZGF0ZWQuIEFueSBpZGVhIGhvdyB0byB3cml0ZSB0aGF0IHRlc3Q/IFdoYXQgb3RoZXIgaWRl
YXMgY29tZSB0bw0KPiBtaW5kPw0KPiA+DQo+ID4gVGhhbmsgeW91LA0KPiA+IC0tDQo+ID4gTWlj
aGFlbCBIYWxzdGVhZA0KPiA+IExpbnV4IEZvdW5kYXRpb24gLyBZb2N0byBQcm9qZWN0DQo+ID4g
U3lzdGVtcyBPcGVyYXRpb25zIEVuZ2luZWVyDQo+ID4NCj4gPg0KPiA+DQo=

