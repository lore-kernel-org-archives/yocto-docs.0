Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADE2CD1288
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 03:12:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by mx.groups.io with SMTP id smtpd.web11.9593.1711681937472264695
 for <docs@lists.yoctoproject.org>;
 Thu, 28 Mar 2024 20:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=EwvdkpvN;
 spf=pass (domain: intel.com, ip: 198.175.65.16, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711681937; x=1743217937;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DbJoHhbCzVH+F9Gg0vaKJZIYXkjW6622SbNzNV15kBM=;
  b=EwvdkpvNiCHQFCRv5Nnrj/gq/bFXCcc0pbH0+VID+ywSwVRYmomhvyUU
   S72z9diQ63YlSQmR7aXEfmCD7MiqylJDliNdcbG1vm9jtfod0Em8qUsTU
   kgyPBNFPoWfFYhyjLYEStIh1wxQeHlcuYeeI7EHYkv3/pOsLyAQJy3k0A
   bNlqZox2Rjx/VyDke/wWO2bpAYZCl+qTbR5S7KFU+2qQApfN7MpwSuU5S
   ci319fvnFksqC5xWn9yyEX03hnVt/1xT0LniXcnIbOzoRaA6aFMffL0vu
   WQRfNVKAyX+BTQXqu9e7ipaH/wwOSl4lcwb1OY4lG/RvzG2O6oZI2NSdK
   w==;
X-CSE-ConnectionGUID: GyWSJcAkSgyD2I0sGdse+Q==
X-CSE-MsgGUID: bdhx3jK4QzaRV+TF+Yt/QQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6982618"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6982618"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 20:12:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="21562201"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Mar 2024 20:12:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 20:12:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 20:12:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 20:12:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiDwC7dthnCNM6stwim60v7SHkCltEV+QbCD706ZTWxCzMu3K79PuOvqZRIwDKGXv9aG0VBA73fxRNtZiOkxbDtxks6SdoPg70kA7ZdKtYjUfaW6LE+gaCY/WCnXD4pFE2/QWqcAWxmtpMZVKf1oeXmiqkaK5ayEUuKPOXeEeIt6IEbQWCZrrXu8R2j/1LqlPHCKtpWGNOefniGStI9V6XXYl4NTliJS2iTxOQU3Pfge4S0LDElWg+l2jpZzM4K0RJCbawHmy6CQrAUPSlzQlRFVIrYuQpglAKGempPli1ERH8Jl03iShjEm+8DE+hy8Cx60q3B/IRTocFdX80cvzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbJoHhbCzVH+F9Gg0vaKJZIYXkjW6622SbNzNV15kBM=;
 b=jaCOudgDjIh69TB7Bdrsg0vzji6rk2WRddLNK2Yix/OM588Won1Ea5lJj+C1W5AIZcENxJ3F3+7zJM+bGboxTVlMIzB2SusQHbI/lp9dYnBUybaIj4O1BZOw+U5uhLSxERXIq1zyGWsQ/pR0/uebPKHNmd9xVEK+2HzXvNWvXp29x3n7Qa7Celts7jzeOEAyMKEdQoBkCqPAcHwhgaB+oMvIe9OZJJ1wdgG1RfbzACCSjUgfi4Il6u9keWWEP/mSlfSHWQhH6Cv4gh8m2zzq77H0Jyi+dj713ScXzNpUMLJEcmLfm8TzTrsJRPP/e5X1rVuWRYUFZhSy7i8Xz78JuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8093.namprd11.prod.outlook.com (2603:10b6:610:139::10)
 by PH7PR11MB7148.namprd11.prod.outlook.com (2603:10b6:510:1ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.38; Fri, 29 Mar
 2024 03:12:09 +0000
Received: from CH3PR11MB8093.namprd11.prod.outlook.com
 ([fe80::d5d3:b249:93f9:bf22]) by CH3PR11MB8093.namprd11.prod.outlook.com
 ([fe80::d5d3:b249:93f9:bf22%7]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 03:12:09 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: "michael.opdenacker@bootlin.com" <michael.opdenacker@bootlin.com>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] release-notes-4.0.17: reorder CVEs
Thread-Topic: [docs] [PATCH] release-notes-4.0.17: reorder CVEs
Thread-Index: AQHagR4SqgbgHwufM0y4ncppa6b9N7FOAbFA
Date: Fri, 29 Mar 2024 03:12:09 +0000
Message-ID: <CH3PR11MB80933F43D2EF6AE2E343BA18B93A2@CH3PR11MB8093.namprd11.prod.outlook.com>
References: <20240328023142.3416785-1-chee.yang.lee@intel.com>
 <2fcb0eff-8a38-4238-94f7-44cfbb8a8cd9@bootlin.com>
In-Reply-To: <2fcb0eff-8a38-4238-94f7-44cfbb8a8cd9@bootlin.com>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8093:EE_|PH7PR11MB7148:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pCJDGD1iiJ3HsQl9bU/lOQp2+Zey4yLR4SMdoecYl0kBAegI1bCN3PJ3wbIBunWeugQ22YM5NRf99SM8xong37g9V5uq4KDEB71nGNMhkUS+IGYgiLkiCNBy9QkBW8KdpTN+kqSD4qyKkOANJlMiTfgGwf/qua1wljqQRJ6eDdSA9w76lMF9t0ZB5bhx8m4ZoEEzJEzbYEEM6OlY32aeu2MlsFKxZIWg/gd+VBGzuAl3YiI/tH651VR+zB4Qb+VtKgVVoT1wRFAmLV+UvPDZSMjU6Ap0AWhJriHHGTuNsYBv6OtM9LJw89NyVLJtQNLCMhys1Z3lQV6qRpdjCEbzp4DZ2VCwtAHIQPbLXudRWugVWV33VLJ/nFZOGqJGA+CBlKAPxqR3ePR9PnMwh4hqe+tqpB2/7kSwpLk4iGTpctwGctO6pg4sFrjoyFMgfKORBbvkUH5sO0jjPpVF12on6qvxgrpn3SFCk3Ik9ETst3TaHwterB53KrosT0aIo6CDdxmA0rPQBCdtQ0HnSxZ5iq81BVVNJ8KS+7bgCe2PIyrbhJdr/sD0TMvfSOlcw4TeV8fmP6U429p0ao/NjW7GAA4TFNGfafX2CnSzKGAMnAY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8093.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjVFTkJmamdwQkV3K29QWC9zNkhmVXdRM0c2SFViS1R6TnZnajR6bFJpek9z?=
 =?utf-8?B?aWFyMGtZemV3bjIvM2FHZVl1ZGVraGhFb2c1ZFFwUjU4NElpL3c1MVNrRkdI?=
 =?utf-8?B?L3g0NURhRGZTWGpYVFQ5SXBleUg2UXlrWU5xWnFMSFZpL2g1eUsxTCtJTkhk?=
 =?utf-8?B?bnZQNm44ME90aGEyUEZxclhoRzVadWxEZ0FaVW9jQmNqSUllck1yWlRqZTVx?=
 =?utf-8?B?eTNENE1MWWkrZjJYZlZtM1IzVW03aDVWcDg5RzRQWUVJNnFiM0xvWUV1a2RT?=
 =?utf-8?B?Wk45QU54UTFmUjRHT3dCeURKVWo2a1ZrYTRyVkVYYndKMmsweE93STEvcGZa?=
 =?utf-8?B?Zk4rQVVEMUxVQXlMc2szY1lrVmMyZjFOU1loT0tyT2tmSnRWdEJtdEpuL09H?=
 =?utf-8?B?UEVSVXNwNFNvYmt2WTY3TGlrNzY0RVBmUzVYdnFRNHR4ZzJnYlRFN1VvbTNQ?=
 =?utf-8?B?V1hPLzNqT2ErMFNBRHZmeVFvdWR5Y2pkckJES1RyTXovYzQwaDBmTjNBaEx1?=
 =?utf-8?B?QkY5SytVakgvZVFUMmhaRG9PK0hkL093d1MxVmdzQk9IbE1NMFZzM1lWNDc2?=
 =?utf-8?B?MXEzRWlLUEtNU2lPYm96Slp4KzdIQXhDWTNhamMya0NsWWFGckFtaURMWFNN?=
 =?utf-8?B?emV6MkdIL1pWTlJKcytWMnkzZFB3eVNPR0xCelFVbENqbXVDcTNSV1RCcGV3?=
 =?utf-8?B?VXNFQlIzRFRMZTR1TkxvNnNqaS8waXVFZFBoV3E1RGZtdkZRNE80ZkhlQmpB?=
 =?utf-8?B?S042eVBFVnZINFNVQ2Q4MkJDWXpvWXNaUGVPVG1La3AxTDMwQzZONHdTZ1lS?=
 =?utf-8?B?L1R3dkxtaHJtakprTkRTdXhzSTl1U3VyRDZPbVF2bStMKy9JTzRhaTFZVGhR?=
 =?utf-8?B?aFZOQjkyM0tNenlEY0dzNTNHemRYTGtBdjNWMVFzMW9lKzVvMmxCelVZVVMy?=
 =?utf-8?B?c24yK2pUSVV0TEJMbjhBcEVteDdGaVhOSHo0KzVsQUhKY0J4Qk1JaXE2YzVP?=
 =?utf-8?B?VU51TldYV3JCeXRzTkxRKzljUUd1eDhIZzFCazhCTThQc3RkMStvcG5rZzZI?=
 =?utf-8?B?Q0hHdTc5NlgzVlAwMWVQOHZiWEpQTERkd25QQ2wvczl1aTRqYkdCQ3lJSk16?=
 =?utf-8?B?RlRXNVFwb1VJUlZ4OHFQTkl4THBJOE9kYkVRbE1xY2dZZ012VXNDUVZzekVG?=
 =?utf-8?B?SzBQUmJoMm1qc0M2ek90R1RoQ1oxNzRIWVRpNWZYRU50OGt4ajRmWndYdVla?=
 =?utf-8?B?SndheVE1bGhMcER2dUVraTEvZDNkV2Q4Y1pMckZvOGNTQm1qMUE0VEJ2cHE0?=
 =?utf-8?B?UnJIWjFFQit2Z1MweVpDSEFzMHdVTVd2MVNHUmlFRmNSdlB3ZDVDdlQyMHE5?=
 =?utf-8?B?Nkk3TURRYmVlaHJtaXlndkVvbTZCQjRNUVRmd1pJSEtwcVFhUGFVTUhXSTBj?=
 =?utf-8?B?alo5VEoxWXZxQk5aUnpLckN0R0lxeUVKVExIb0xQYTl1SzBpejBxS2lleSs5?=
 =?utf-8?B?TlQxMGdlbTVHbDMwWnVQNUFPK2FWUkNQMWxFU2EyUzFlU0NvNi9wMi9GK0lY?=
 =?utf-8?B?dlhyaENvMnV2K0Q3WHdYZERUSkxQZUNNMEFINm44WUNSM0g2cHdoZzdLbWs0?=
 =?utf-8?B?c3NuNUZCQ0VpNHBoYmJMb3NCcEQyMzA2QlIrUFlsbXVscmxMZDN1YUJtdkJN?=
 =?utf-8?B?ak9wS1F2RUNvb1UxaE1kQS9hRUk1NXJQTzN0U05XYU83R3V1bFVsdC9aYTNr?=
 =?utf-8?B?V3FsaHJqYU1wbkF0ckxsRDFsN3Y3WEo2cXFTWlg4S3J0NTJVZWo3eXdQdmU5?=
 =?utf-8?B?TDNmWTVDTmxnWFFSN20rZys5TDd2T0Z1a1RuT0U0Q3JxbEkrUmNROTN0TFcr?=
 =?utf-8?B?L2ZxNjhaTUVnRWVsRTFjYkJNaEE0VmNPR0ZnSVR5eHl2Vk1vRVBqRGFaVXE1?=
 =?utf-8?B?VUs5bDh1R29La1hEQi9ndFJZTHIvQTJwS0phb282NmRHY25qaTRYeGxrb292?=
 =?utf-8?B?VXNZQ3BNL1poMjVCYXQ3ekN1c0NpVUxTZzVsV0Z4WGd5R2FRcGhob0FvZzBL?=
 =?utf-8?B?d1E3Vk9rZmpuN3NoS0N1NWRGYThnZWZUbXV6SjlQL2lLalNXOElyblNvcmNu?=
 =?utf-8?Q?tZeu2OqDCguVFwCNSILa53oy9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3337b4-d968-4e97-2de4-08dc4f9e058b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2024 03:12:09.5923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0/dI9+rNWeTxhsAuT/B8VDy7ujrC0gZJ5EaWQu5F8e9LYNssQCJr6wdljcMArnSDGDMAcUKz8kkr1wQedpjbZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7148
X-OriginatorOrg: intel.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Mar 2024 03:12:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5026

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZG9jc0BsaXN0cy55b2N0
b3Byb2plY3Qub3JnIDxkb2NzQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZg0K
PiBNaWNoYWVsIE9wZGVuYWNrZXIgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU2VudDog
VGh1cnNkYXksIE1hcmNoIDI4LCAyMDI0IDEwOjQyIFBNDQo+IFRvOiBMZWUsIENoZWUgWWFuZyA8
Y2hlZS55YW5nLmxlZUBpbnRlbC5jb20+DQo+IENjOiBkb2NzQGxpc3RzLnlvY3RvcHJvamVjdC5v
cmcNCj4gU3ViamVjdDogUmU6IFtkb2NzXSBbUEFUQ0hdIHJlbGVhc2Utbm90ZXMtNC4wLjE3OiBy
ZW9yZGVyIENWRXMNCj4gDQo+IEhpIExlZQ0KPiANCj4gT24gMy8yOC8yNCBhdCAwMzozMSwgTGVl
IENoZWUgWWFuZyB3cm90ZToNCj4gPiBGcm9tOiBMZWUgQ2hlZSBZYW5nIDxjaGVlLnlhbmcubGVl
QGludGVsLmNvbT4NCj4gPg0KPiA+IHJlb3JkZXIgQ1ZFcyBmcm9tIGFscGhhYmV0aWNhbCBvcmRl
ciB0byBudW1lcmljYWwgb3JkZXIsIGFsaWduIGl0IHdpdGgNCj4gPiB0ZXh0IGJhc2VkIHJlbGVh
c2Ugbm90ZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMZWUgQ2hlZSBZYW5nIDxjaGVlLnlh
bmcubGVlQGludGVsLmNvbT4NCj4gDQo+IE1ha2VzIGZvciB0aGlzIHVwZGF0ZSENCj4gQXJlIHRo
ZSBDVkVzIG5vdyBhdXRvbWF0aWNhbGx5IHNvcnRlZCBieSB5b3VyIHNjcmlwdHM/DQpNeSBzY3Jp
cHQgY29udmVydGluZyB0ZXh0IHRvIHJzdCByZW9yZGVyIENWRXMgaW4gYWxwaGFiZXRpY2FsIG9y
ZGVyLiANCkkgaGF2ZSB1cGRhdGVkIHRoYXQgc2NyaXB0Lg0KDQo+IA0KPiBSZXZpZXdlZC1ieTog
TWljaGFlbCBPcGRlbmFja2VyIDxtaWNoYWVsLm9wZGVuYWNrZXJAYm9vdGxpbi5jb20+IE1lcmdl
ZA0KPiBpbnRvIG1hc3Rlci1uZXh0Lg0KPiBDaGVlcnMNCj4gTWljaGFlbC4NCj4gDQo+IC0tDQo+
IE1pY2hhZWwgT3BkZW5hY2tlciwgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVs
IGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCg0K

