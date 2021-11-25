Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178F2C433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 02:04:47 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web08.7140.1637805885299589134
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 18:04:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=HixnoAah;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="222295133"
X-IronPort-AV: E=Sophos;i="5.87,261,1631602800";
   d="scan'208";a="222295133"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 18:04:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,261,1631602800";
   d="scan'208";a="457230957"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga003.jf.intel.com with ESMTP; 24 Nov 2021 18:04:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 24 Nov 2021 18:04:44 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 24 Nov 2021 18:04:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 24 Nov 2021 18:04:43 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 24 Nov 2021 18:04:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gppHTlHacadEheIqkzStJJHAwNZR3MJT4yk5kaaWtiAn90f54bAahLLGqI4SIHklMfmXe84qY2Mpj3RZcXL7Onys8ods2e4pNvvYYWRqwqGB3j0K5rvhFoEsA7jRjm54/hR/qOM/W6b0fBBsBAU9nrPplLzTyeBzFPlbVkS0fIU/N8iE4neTaF3aZ57WqvgjMooJyoNKj2VcswFWt7Ilfwox7L8GVQTOhFoFRG/rCmppYR49yhqCB+gXtrc905A0DCDmn++zAChGXPAAD6QeToJaeVx3sJ2+JwT5dREit8ixDoDCyJI13N5cv+JhCncO9eDMr7FrAUlJ+/PtWBlgng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZdsVLZfDn9UEfwBMpdr5jhhxEPX0HP/a40IPsQwUwA=;
 b=ejFb8Ib1QH/JLLNsFb6wf7niBAWfqFrbGzBBHSozO9y2EZTs8MSEwINnDUU+8zupWSie4dF8iLrm2g4ypjItOpdE6Ghj0D7IQdYCT6YTbsdDxGsmfrxpCWGd9TO5BzrL/1w4ZY2VujiD644GDhcD3CQ7wzsYPmkLCwznfRgvvJCbNm4vd2l3pJlmGv7BlTGAQCS1kaPuy9o6q1+Qub/3Q662fHyYJ6ED9yOUvW6ULXMc4wswN+bvyfN7kI8Q5RDfTInTW19cRdllf+wVy1wfUvSuZiGa0pMgT8p0RH9NqVqRh5jIa+YzeQbcK937naFm9z/kifkR8gvfZOQUY7F23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZdsVLZfDn9UEfwBMpdr5jhhxEPX0HP/a40IPsQwUwA=;
 b=HixnoAahBgU8OxzSIcozWdIjwjeC1eQFKHF2V2rGc5GNtJCkK1GMaDKSo9LKBiIijRSmqndEy743rCVGmyhgt8mqVh7GWdDLk+gbM5kdMsX6uIBcl/tinyVljAeDbYllTl+PJDR5i3qJI9a106WOraL0qydNbO3wGO/YRDtTsoo=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB2725.namprd11.prod.outlook.com (2603:10b6:a02:c5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 25 Nov
 2021 02:04:37 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::2c3d:dccb:aa85:53c5]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::2c3d:dccb:aa85:53c5%2]) with mapi id 15.20.4713.025; Thu, 25 Nov 2021
 02:04:37 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "michael.opdenacker@bootlin.com" <michael.opdenacker@bootlin.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [honister][PATCH] documentation: prepare for 3.4.1 release
Thread-Topic: [docs] [honister][PATCH] documentation: prepare for 3.4.1
 release
Thread-Index: AQHX4XXU51lOLjfCLUS/sIqpXJM03KwTfqqA
Date: Thu, 25 Nov 2021 02:04:36 +0000
Message-ID: <e413eb962e1590f491545eb7a6a69150073bdaee.camel@intel.com>
References: <20211124150928.11645-1-anuj.mittal@intel.com>
	 <16BA84AC7B404D44.11456@lists.yoctoproject.org>
	 <3cf9ec30-d44f-f35d-fbb2-d118e3e2d5f8@bootlin.com>
In-Reply-To: <3cf9ec30-d44f-f35d-fbb2-d118e3e2d5f8@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.1 (3.42.1-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9887de80-89f2-4463-f38b-08d9afb7eee3
x-ms-traffictypediagnostic: BYAPR11MB2725:
x-microsoft-antispam-prvs: 
 <BYAPR11MB27253BDF1D4E784A872B472FF8629@BYAPR11MB2725.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vQg50dBGofNnYbhGzOoOnIDXs+Krwz9fFksT6Dc0Tceyhe4bTc0Zl+ahOD3EDK+njBMEqHhpoyYYjsJcd+2E039a0cddCfwdC961po14Rk07cc/EXMlhWPOay/FyzYwJUxRGc1vewVHUfG9oe8aEb/du11j5gKf8qAzTshbzcG0lUwcqA6x1wrbteHlsy7+nNmAyXZUGg7or+f7QQfkACuIZdPEu0uiSlOlBjWpC+n6P5CCLOs+qLKbxCvyJi5j3O0SJ8658dGBC34F0jwHUFrHwxUgHkjFPZoF3E/wwfYdzt1Rf8qsinYo6/yANQNP9viHa1uAjsUpQTEzMFM/zCnrrtztH6tjKqld/rdZuYJGwnnMuXH0CyGlmcRSzcYlaivGE6PceqKnEt+EAxC8E5W4dPljVEqCw3o/2dFc9kfQ1y657GKxrUcX97yu8aqZ2u7BzfygxhC7XzsYBJWUlKdH0VQ8pov9KgvjAZtvWr+HLRoC88wrV01adMIDp22bFeE55usdXlV8rsmTPDwFQBTZOXa76y4BNsnvD2tZmR8m7LfTs5dTTPUyqJShd5U/QuRtHhLskxASd6qnE5MjKf64JCjEnI7lfkKBzjlsELBwQ+J6fr4f4oKT2bu1+DpS6JHpuXbprFaUXPXcPyLVOUQsaNV9tz35Nb0ucph3HKqdsnyZR7XyGQRUbIJrlggY/crUY1NFIVysJssCvOUy4dKC74jbbmZqeIgAUyomzK6TpxFXrE/QS3GivnP1gKMdmUpH6vaQlbCq/W7gVxH6k49DVbthhl5pijBqq/BsIELasnvOGMYYsgNYnu11/2leG2nm1nqjL74aAIGZbYKqY5g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(508600001)(38100700002)(66446008)(64756008)(8936002)(186003)(110136005)(26005)(6506007)(38070700005)(122000001)(82960400001)(83380400001)(2616005)(316002)(6512007)(86362001)(91956017)(66476007)(76116006)(71200400001)(66946007)(66556008)(6486002)(4001150100001)(36756003)(53546011)(8676002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UWVoY1Z3V21ucmdLTlRSU0lIb3ZIVWRGbzZtVGN2cXVjYTdWemVEaXphTE1r?=
 =?utf-8?B?a2czaGhkcVdGalpPNXVMcW5uMkJXdnhWSjFUVVR3ZmR5cGV3N2c1ZW1ZNjA5?=
 =?utf-8?B?dHRqNTVXSzdXYzJ5ZjhDQTdBamwvQ0x0Q0l0U0xkL0ZhS2xsTjVZdzczSkJ2?=
 =?utf-8?B?UWdWZ21QWjBiQnBaZ2NiZE4yRlRnRXpSNXZMWk9ST1lSTWlCLzJqbytGYlpB?=
 =?utf-8?B?enIwRExtN2lRWVI2N0NuOCtrUFI1TWswWDdnbXBHR3ZIRENxVFVBVVVZdzU2?=
 =?utf-8?B?SDQ2d3FaeXVhekFvRHlOb20rb3FtV2F3aW9OTXR5YUFpZ1ZobW8rT01YcTV4?=
 =?utf-8?B?bjV2TEVKYUMzcGdKRlQ2L2dRL2JmM1dJUXV3WEJiUm83Z2VKSTZTb2dPcXJP?=
 =?utf-8?B?aEtkSzZpeGFZVDBoOFd0V0dGV2JqYnJ3anVIR1VOSWwrK0o0a2xOeDBCaVJK?=
 =?utf-8?B?UUlKL1pSeGMxZ2ZuMXJEbkFxT29zQzBLOEQ4M0dGbnFIRVdZU3g4Qis5OWR2?=
 =?utf-8?B?M0Z1bXg5WFZldjg0bEFRdUlaSFNyVVJZcC9CM0REM3pXbTlid2IyY01vK2Zq?=
 =?utf-8?B?V1F1RXZ4UFdHenZkcTFJbjY2bDFlbUcxNkc2dkd4QmYyRVZxWVFDbU1xN3JV?=
 =?utf-8?B?bDFVUU13UFpjbVhWc25CYWtnV2VuYWluaG9rTTJEcDBlRk5XYXg2Z2xjOThR?=
 =?utf-8?B?SHJzNmpVdkRpNjhqL2E1RnFTOVFrVkV6dW1wNHRudDlyM0c3Z01ncDczU2Zp?=
 =?utf-8?B?L3RhM2g5SS85cVRZN212VGRCOVBNcytMWXNqTmx6NForWDdLeUx2RUVaeGxD?=
 =?utf-8?B?QU1XMTJOM2c1WHZDa2pQUXlETlhoM0JGeW1VcHFRSFFNOVRzSjZ4UlpXTmlT?=
 =?utf-8?B?dkptRW95SFBBYVRhWHR3VG1lY2ovTTV1U09seE1xZlY1WEFFNjA1dUFML3o1?=
 =?utf-8?B?aWF5TG5nN3k4Z0RiU0ZyTG1GcjNoM1NqakRTTGhOQXNXVEpibzBycmQxZFBT?=
 =?utf-8?B?S3gvMUl2ZUZMQWlkdEV1V3pGOW13WGFrRTZMTTIrRHNIU0w4OTBLZkdtVkVw?=
 =?utf-8?B?ZEJuUHdLTzBVZktrdFJ2OFl0VXRLQU8yZmc0c21MVWhpSkRyNU4xbFl4M3lp?=
 =?utf-8?B?MmlkTU43R3YvUzU5N29lcUZvc0dJK2tEK2FXSW1HT2FiVEZDQVN1d2FFc2wz?=
 =?utf-8?B?Y2JJc2loUjJZOVlIOXNLYldOQWNmSnpiNmhGa2FCU0JmdklrcXBFUUFKWnpW?=
 =?utf-8?B?bEt6RG5QTUpMNWhyM0RGa2JUMkk1QnZLbnJqSzRFMkl5TEMwS0dubjRMWTk1?=
 =?utf-8?B?SVpoekhlVnBsUDNzSlI0dkVJNE0wL3ZqTGFMSDdHc1NXcTg3NVRrVTlZR3VR?=
 =?utf-8?B?VnBSK2V5aVBoalRqSGtEVXQ5aXNkSlJqQ3FpNHFVcHJoNk5FTXA3NTBOc2Mv?=
 =?utf-8?B?MG5lSHZ0S2dFSXBPRXp2YWxiLzlILzhKeHZ2blI1Vm9PSUZGM3hqVzhmYnVI?=
 =?utf-8?B?dVBLb0ZOclBBWlRBNCtmODAvY3JMSlFyNXpBcis3NlYwNVJHTkN2aHNtWWxr?=
 =?utf-8?B?TEU0czVyYVVMNE9HS0E1UWxIZFp6N0x1Z3dBcHBWMzdtTGYwY1UvZERXRGtZ?=
 =?utf-8?B?dVBYUExYZkxCTGJSa3pBWUNPdTdRaWJ1MzRkMlZ3WDFaSlE0MEJRcmdXSnI1?=
 =?utf-8?B?RFN4UU41Nlg5bkZ5Vy81YVQzSTF5VHpaK1AybjlyWTllSWduK0dKMGpZYVQz?=
 =?utf-8?B?dXplbnFDQXI1d3V6eVBBV29TVktqRHpsRGVSMVpCQnVyV04vUSt1Z085OEgx?=
 =?utf-8?B?S2x3TnpmRWlPc2prUFQ1ZUJQMXRiZlNLZlpvSDByUDJkVlZZeTZ1ZmErb1VS?=
 =?utf-8?B?Nk4rbFF0Q1FNUW54WHJOa21qTnNxUklFeGxQeW8xc3pocXVOMHpKampPMEEx?=
 =?utf-8?B?MzNsdEg0cTl3dzFRRmF0RUs4NWZDUmJIUjVRNW1MQnN4SFo4MGNKci9TRDVq?=
 =?utf-8?B?V3Fxc1pBY2IzcWprNlNoRko1WitHc2Q3UHVYR3g3WFAzZStFdmx2cWwrZVhV?=
 =?utf-8?B?QU5aQU5Db3hQWm1YS042T0FPeGMrQmQzYVNnYm5jTllOMXdXK1VGeFF0S3BZ?=
 =?utf-8?B?ZnBHZnVUUHY4WVhUZ1lhY1oyOHkvTE5ycE0yQlVHcGRtT2RoZWpGYUNRZ3Rw?=
 =?utf-8?Q?3NYyrmowRS6T+MHzQkQN9x30EBcA1WaPQ5UZOIKjIxn3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95CF60A70CED1948B989E0C5364B77C1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9887de80-89f2-4463-f38b-08d9afb7eee3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2021 02:04:37.0014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 4b5KMDgmNIDkcfOAw8Eo67+61ieCGdqYf3tsFR0cU/8yNtXp/FRnglVlQOqxiZGZ/VIrw3hAW1n0ioD2rfB2tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2725
X-OriginatorOrg: intel.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Nov 2021 02:04:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2200

T24gV2VkLCAyMDIxLTExLTI0IGF0IDIxOjU3ICswMTAwLCBNaWNoYWVsIE9wZGVuYWNrZXIgd3Jv
dGU6DQo+IEhlbGxvLA0KPiANCj4gT24gMTEvMjQvMjEgNDoyMSBQTSwgTWljaGFlbCBPcGRlbmFj
a2VyIHdyb3RlOg0KPiA+IEhpIEFudWosDQo+ID4gDQo+ID4gT24gMTEvMjQvMjEgNDowOSBQTSwg
QW51aiBNaXR0YWwgd3JvdGU6DQo+ID4gPiBBbHNvIGluY2x1ZGUgcmVmZXJlbmNlIHRvIGp1c3Qg
cmVsZWFzZSAzLjMuNC4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQW51aiBNaXR0YWwg
PGFudWoubWl0dGFsQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqBkb2N1bWVudGF0aW9u
L2NvbmYucHnCoMKgwqDCoMKgIHzCoCAyICstDQo+ID4gPiDCoGRvY3VtZW50YXRpb24vcG9reS55
YW1swqDCoMKgIHwgMTAgKysrKystLS0tLQ0KPiA+ID4gwqBkb2N1bWVudGF0aW9uL3JlbGVhc2Vz
LnJzdCB8wqAgMiArKw0KPiA+ID4gwqAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RvY3VtZW50YXRpb24v
Y29uZi5weSBiL2RvY3VtZW50YXRpb24vY29uZi5weQ0KPiA+ID4gaW5kZXggMTA0YjQ5ZWEwLi45
ZmQ4MzZhMzUgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kb2N1bWVudGF0aW9uL2NvbmYucHkNCj4gPiA+
ICsrKyBiL2RvY3VtZW50YXRpb24vY29uZi5weQ0KPiA+ID4gQEAgLTE2LDcgKzE2LDcgQEAgaW1w
b3J0IG9zDQo+ID4gPiDCoGltcG9ydCBzeXMNCj4gPiA+IMKgaW1wb3J0IGRhdGV0aW1lDQo+ID4g
PiDCoA0KPiA+ID4gLWN1cnJlbnRfdmVyc2lvbiA9ICIzLjQiDQo+ID4gPiArY3VycmVudF92ZXJz
aW9uID0gIjMuNC4xIg0KPiA+ID4gwqANCj4gPiA+IMKgIyBTdHJpbmcgdXNlZCBpbiBzaWRlYmFy
DQo+ID4gPiDCoHZlcnNpb24gPSAnVmVyc2lvbjogJyArIGN1cnJlbnRfdmVyc2lvbg0KPiA+ID4g
ZGlmZiAtLWdpdCBhL2RvY3VtZW50YXRpb24vcG9reS55YW1sIGIvZG9jdW1lbnRhdGlvbi9wb2t5
LnlhbWwNCj4gPiA+IGluZGV4IGYyZDFlOGI5Ny4uMTFlMjA5ZTMwIDEwMDY0NA0KPiA+ID4gLS0t
IGEvZG9jdW1lbnRhdGlvbi9wb2t5LnlhbWwNCj4gPiA+ICsrKyBiL2RvY3VtZW50YXRpb24vcG9r
eS55YW1sDQo+ID4gPiBAQCAtMSwxMiArMSwxMiBAQA0KPiA+ID4gLURJU1RSTyA6ICIzLjQiDQo+
ID4gPiArRElTVFJPIDogIjMuNC4xIg0KPiA+ID4gwqBESVNUUk9fTkFNRV9OT19DQVAgOiAiaG9u
aXN0ZXIiDQo+ID4gPiDCoERJU1RST19OQU1FIDogIkhvbmlzdGVyIg0KPiA+ID4gwqBESVNUUk9f
TkFNRV9OT19DQVBfTUlOVVNfT05FIDogImhhcmRrbm90dCINCj4gPiA+IMKgRElTVFJPX05BTUVf
Tk9fQ0FQX0xUUyA6ICJkdW5mZWxsIg0KPiA+ID4gLVlPQ1RPX0RPQ19WRVJTSU9OIDogIjMuNCIN
Cj4gPiA+IC1ZT0NUT19ET0NfVkVSU0lPTl9NSU5VU19PTkUgOiAiMy4zLjMiDQo+ID4gPiAtRElT
VFJPX1JFTF9UQUcgOiAieW9jdG8tMy40Ig0KPiA+ID4gLVBPS1lWRVJTSU9OIDogIjI2LjAuMCIN
Cj4gPiA+ICtZT0NUT19ET0NfVkVSU0lPTiA6ICIzLjQuMSINCj4gPiA+ICtZT0NUT19ET0NfVkVS
U0lPTl9NSU5VU19PTkUgOiAiMy4zLjQiDQo+ID4gPiArRElTVFJPX1JFTF9UQUcgOiAieW9jdG8t
My40LjEiDQo+ID4gPiArUE9LWVZFUlNJT04gOiAiMjYuMC4xIg0KPiA+ID4gwqBZT0NUT19QT0tZ
IDogInBva3ktJkRJU1RST19OQU1FX05PX0NBUDstJlBPS1lWRVJTSU9OOyINCj4gPiA+IMKgWU9D
VE9fRExfVVJMIDogImh0dHBzOi8vZG93bmxvYWRzLnlvY3RvcHJvamVjdC5vcmciDQo+ID4gPiDC
oFlPQ1RPX0FCX1VSTCA6ICJodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmciDQo+
ID4gPiBkaWZmIC0tZ2l0IGEvZG9jdW1lbnRhdGlvbi9yZWxlYXNlcy5yc3QNCj4gPiA+IGIvZG9j
dW1lbnRhdGlvbi9yZWxlYXNlcy5yc3QNCj4gPiA+IGluZGV4IDUyOWQwMGU3MC4uNmY3YmNhNTQw
IDEwMDY0NA0KPiA+ID4gLS0tIGEvZG9jdW1lbnRhdGlvbi9yZWxlYXNlcy5yc3QNCj4gPiA+ICsr
KyBiL2RvY3VtZW50YXRpb24vcmVsZWFzZXMucnN0DQo+ID4gPiBAQCAtOSw2ICs5LDcgQEAgUmVs
ZWFzZSBTZXJpZXMgMy40IChob25pc3RlcikNCj4gPiA+IMKgKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqDQo+ID4gPiDCoA0KPiA+ID4gwqAtIDp5b2N0b19kb2NzOmAzLjQgRG9jdW1lbnRh
dGlvbiA8LzMuND5gDQo+ID4gPiArLSA6eW9jdG9fZG9jczpgMy40LjEgRG9jdW1lbnRhdGlvbiA8
LzMuNC4xPmANCj4gPiA+IMKgDQo+ID4gPiDCoCoqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Kg0KPiA+ID4gwqBSZWxlYXNlIFNlcmllcyAzLjMgKGhhcmRrbm90dCkNCj4gPiA+IEBAIC0xOCw2
ICsxOSw3IEBAIFJlbGVhc2UgU2VyaWVzIDMuMyAoaGFyZGtub3R0KQ0KPiA+ID4gwqAtIDp5b2N0
b19kb2NzOmAzLjMuMSBEb2N1bWVudGF0aW9uIDwvMy4zLjE+YA0KPiA+ID4gwqAtIDp5b2N0b19k
b2NzOmAzLjMuMiBEb2N1bWVudGF0aW9uIDwvMy4zLjI+YA0KPiA+ID4gwqAtIDp5b2N0b19kb2Nz
OmAzLjMuMyBEb2N1bWVudGF0aW9uIDwvMy4zLjM+YA0KPiA+ID4gKy0gOnlvY3RvX2RvY3M6YDMu
My40IERvY3VtZW50YXRpb24gPC8zLjMuND5gDQo+ID4gPiDCoA0KPiA+ID4gwqAqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqDQo+ID4gPiDCoFJlbGVhc2UgU2VyaWVzIDMuMiAoZ2F0ZXNn
YXJ0aCkNCj4gPiANCj4gPiBNYW55IHRoYW5rcyBmb3IgdGhlc2UgdXBkYXRlcyENCj4gPiBKdXN0
IHRvIGJlIHN1cmUuLi4gd2hlbiBkbyB5b3UgZXhwZWN0IG1lIHRvIG1lcmdlIHRoZXNlIGNoYW5n
ZXM/DQo+ID4gQmVmb3JlIHRoZSByZWxlYXNlIHNvIHRoYXQgZXZlcnl0aGluZyBpcyBhbGwgc2V0
IGluIHRoZSBkb2NzIHdoZW4NCj4gPiB0aGUNCj4gPiByZWxlYXNlIGlzIG91dD8NCj4gPiBPciBy
aWdodCBhZnRlciB0aGUgcmVsZWFzZSBpcyBtYWRlIHNvIHRoYXQgdGhlIGRvY3MgZG9uJ3QgcmVm
ZXIgdG8NCj4gPiBhDQo+ID4gcmVsZWFzZSB0aGF0IGlzIG5vdCBhdmFpbGFibGUgeWV0Pw0KPiAN
Cj4gDQo+IEkgZ3Vlc3MgdGhhdCB0aGUgc2Vjb25kIG9wdGlvbiAod2FpdGluZyBmb3IgdGhlIHJl
bGVhc2UpIGlzIHRoZQ0KPiBjb3JyZWN0IG9uZS4NCg0KSSB0aGluayB3ZSB3ZXJlIHVudGlsIG5v
dyBmb2xsb3dpbmcgdGhlIGZpcnN0IGFwcHJvYWNoLiBCdXQgeWVzLCB0aGUNCnNlY29uZCBvbmUg
aXMgcHJvYmFibHkgYmV0dGVyIGFuZCBjb3JyZWN0LiBTaG91bGQgSSBzZW5kIGEgdjIgYWZ0ZXIg
dGhlDQpyZWxlYXNlIGhhcyBiZWVuIG1hZGU/DQoNClRoYW5rcywNCg0KQW51ag0KDQo=

