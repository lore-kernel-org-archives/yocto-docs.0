Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E92C433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 13:54:45 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web12.7849.1635947684892117304
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 06:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=rKKB1YNh;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="230216847"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800";
   d="scan'208";a="230216847"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 06:54:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800";
   d="scan'208";a="599904797"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga004.jf.intel.com with ESMTP; 03 Nov 2021 06:54:41 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 3 Nov 2021 06:54:41 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 3 Nov 2021 06:54:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 3 Nov 2021 06:54:40 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 3 Nov 2021 06:54:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgnXJQYuNFoD2VTYmueklg4dDuSNJTfby38A8qD8Qi4+xR6P4oMAptQXi0HyRbG76ixtmHnm2uRMdntnTzTd20JcXTeHqQUfk8v5H9aQmZR+U0H9wXpnlLQeUg842t1LAF9/6dlN+nBZH2AMdUp3l4sVEdSeghPK4D9WlhT2xyzBnU0noJe95I7EcnoeIdOqlKj5s7BNq4R9BHZTIaZJe/TeTz9DU4/ljxONSPqrEn9tkdWbHu+uYNWbPXUmKjdBzSscHxYnVc+GhX+XxKeXNtt+cxsA1EKbTr42sgq1dSfitWDseq0gMFivqVO9a/GZqaIENhVoscQPI0R6nw98Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8oI/rm+O5h+sSpO6QmooSNa4OhvVEy+0TmFlSfp1qM=;
 b=VIswBs1AG/C2Y+/NvfMQZFzlX4Ze99z3v32ZwWX7tjXDGMEQrSLAsfR8/Y9OtCB7VTr4KmFxdoN3ClnM8ebWRscfao1rYlxazxDzst6rIXwkA42BAvZOxoAF3gq123sM3Of1xRMZV8LKW2EW5fvs8tONv1Mxc35rri2EcWFYrmBH3aX1NcLCABT9QQodXi3FAK3XNwBekXsInSWKhfjlze1B4bLcWAgg17WuukUlwoFG5muLItJsd38zEoEmytfduSXN23BV8uFmJ3VKKw8tqWnwyBMZofHsDeIARTBG6ZPPdmGoYA4m69GBEXTxwCJJoRmU753pXnI3jN1xQ75bQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8oI/rm+O5h+sSpO6QmooSNa4OhvVEy+0TmFlSfp1qM=;
 b=rKKB1YNh4YYBBO4Fl6MW0Nd+rTQCtFKlvlje7gO5yglOTBwoOj2sd11NuQmzBJXwYTPEJgxQTCQdLIJDa3A22rRyD1srptWNyAM2DLrl8iADF2hY/B3AO2zr5qHg0S1SVd2DNxHcQI2vxLwIchZnV2IwCzxMFKAA1tP+2Owy9XM=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by SJ0PR11MB4846.namprd11.prod.outlook.com (2603:10b6:a03:2d8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 3 Nov
 2021 13:54:39 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::2c3d:dccb:aa85:53c5]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::2c3d:dccb:aa85:53c5%2]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 13:54:39 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "michael.opdenacker@bootlin.com" <michael.opdenacker@bootlin.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [hardknott][PATCH] documentation: prepare for 3.3.4
 release
Thread-Topic: [docs] [hardknott][PATCH] documentation: prepare for 3.3.4
 release
Thread-Index: AQHX0JC5LJzWVpmS90eNsVj1iKytV6vx040A
Date: Wed, 3 Nov 2021 13:54:39 +0000
Message-ID: <4a07f7caa69fe09343d1e1f4e5ff6974fcf4c6d9.camel@intel.com>
References: <20211103071023.51887-1-anuj.mittal@intel.com>
	 <c283050e-847c-e54a-fbfa-cb81f5a86365@bootlin.com>
In-Reply-To: <c283050e-847c-e54a-fbfa-cb81f5a86365@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: def48206-23ec-476c-6172-08d99ed17b01
x-ms-traffictypediagnostic: SJ0PR11MB4846:
x-microsoft-antispam-prvs: 
 <SJ0PR11MB484647F299B62D0F26D175EDF88C9@SJ0PR11MB4846.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 E181AfeNnwGbDn0li8QU1b/g4n4qa1lDhaLbvdUJpGsOjgwy9OiaWLXps827++2FPeaNlbdRcpk8ru3J+VQm93gVJBawJBT2XIZ1YS6FjD4IWWE4LJGrrSSQyeTcd5v5st83eoXQ4wO1UaGI/bxd83hxas0UrPkkuH7m9w7jdGwGD0CiB8mGLYQmVqfBS6RZ/+fYQcoLghNbzTv64KDLtzLfq5oGcUS6Lkg24Z6lAaPs6N6/OjLeOCp6HBNpFFx2VlajSRcNSLENkog6O9ftY9R7+kadf7ec5gDs+uaMleHEgvf1ehBPgVw0M7mk+/m36ANKWedqRegSjKk5R7B4TDVGdyydIJuy2XAfvGmJzM6OUJ0jsT9NoVtkPaz4/gR8ygcAaQgAXbHEElD+rDS/zhNACUzQbh5e4nsoOGWaXgd6qEOADocvn/PVF7n/Kh2bKlCP4s3fraUhVYS4L8Cw3tHO4fxgtJXbaYqJD4tubKerUe3XsoJgITFKDZcSBhxllCN8WDiyyhyOHpjy1amxfE5LReEg2/9P9jf2qJQvaCFc+VXJsHfvTC8bdLVdVAr5NIouG7zgXMLlcBlcFEX814JWbXAHGHVB1qMfirgCwqtvs/q5a0JU/qazxNiYJGr3yQgYm6v17phfTE1Gv1xIGi8LBgRxRjh8GtpcUajtr3R4rZ73x55SRuTOBDrsAUqTmAmxOCxkhCxNq1ovW5B9Q/JHcRprcsbrlGywGtJ5ka2VKux1p2RAtt22ePduzZYoh7IFih226i3j2JBinsC45DXzjPdT99WlH++QyPviUMU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(966005)(8676002)(38100700002)(6506007)(53546011)(6486002)(83380400001)(5660300002)(8936002)(66476007)(66556008)(64756008)(66446008)(38070700005)(66946007)(4744005)(110136005)(2906002)(508600001)(36756003)(71200400001)(6512007)(26005)(122000001)(186003)(86362001)(76116006)(316002)(91956017)(2616005)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MGFDZUhzUXVOSWJYdUpLV0xRa0FMVDZWdUNVMk9mbFdrVmlucjZGN1ZJU1NX?=
 =?utf-8?B?NVo1SzdFR3U0UlZHUFBCWU5PZWhYamhneTMyRjhyR0MyUmNCUkRLci9LQTRu?=
 =?utf-8?B?czV0NHVvNnRnTlU3aXdTT3dwNzd2M1pyTy9RUVFTR25kMnFhK01jQnpuNDJH?=
 =?utf-8?B?eW5xT1hRa3BpUFFzK05DMEg4am82NFBjeG42MUdrSWpqNlFTZHZMY3JnMUFu?=
 =?utf-8?B?Y1ZyVFlRTkVMSlpYcFkvUmExQmVNQ2MyNGVaaWx0WmtydmxjblRKb2xha0Jy?=
 =?utf-8?B?Sno0MGJycytad0kxc0l6U21Ic095dFcwRjZmczBiZWx6VnBPeFRmSGJ5MWZL?=
 =?utf-8?B?VXQ1bHNzV0VpMHc3WHBzLy9GWTA2dVRjZkM5Y3UyKzl4SnBRU1QyVFROSTBz?=
 =?utf-8?B?OTV6c1VPS2F1WGtQMTMzVy9sNGxKM2FSN1Q1RHcrTzlZa1NPV3hCaXdDMGhx?=
 =?utf-8?B?THo4U0g5WDA5VzZpUDRxQTlkL3daMXhmWDdXbmQ0S2NVeStQRU1pa2VpS2RR?=
 =?utf-8?B?SHJ1UUQ0VVRFSGQ0TkFNdlhSdGIyUGVUT2x5WG9zOUk5RjdTenpjelB1c0JE?=
 =?utf-8?B?VEpBTE1PbUVUSTlqb2o2VXV3YUZIMEx3bWZBT2pWNGRsZ1I0bmprRjJBYmwx?=
 =?utf-8?B?MS9GaW8zQU1DYWFGWTZ2NWtSUjFlbnFra2o5T0RYaFZoNDhjd0RDSG1HMTY1?=
 =?utf-8?B?TGJYbEthRjlOOTBEbW9IWDg0NmU2V1JaZlNlMGNpSzh1SHBTOTZuNlZIZXRZ?=
 =?utf-8?B?bzJhV0d2U1h3dXJNMDFsaGgyRVJwYzRYVEVSOUR5b0JldS9LUnlqVm1tVzlN?=
 =?utf-8?B?RjNhUWl3czRlWHREZmQxcjVoOS90ZDdxRFZaN1ZpaytyQTY0SkF6R2o2UVdD?=
 =?utf-8?B?UTdTRzhqOEhtV3Q3dnJHdUhodXhJUWdvL25XaWpwT014bnVVZzdPUVpTeTBE?=
 =?utf-8?B?Q1BHTG01eVBReG1SY1BTWk8rZHNHNmF4YVliK05VanFIdDVNUG1acy9iV3o1?=
 =?utf-8?B?QVJUMDQ2OWl4SlVxaXFvY3BOWDBYM2pmUUpSL2VlOWZFYnM3c2tJLzh5ZTRq?=
 =?utf-8?B?VC93TkQ2cjNSWFYvU1JzSnhtOTZFQlBxSjlYc0tNZTc5UDNlSDFEeWI5L041?=
 =?utf-8?B?S1dhSkgzM0tBRjVMU2tTZmNPaElObkY2TDFra05QTjJWOU1ILzNkalpNTVox?=
 =?utf-8?B?c205eUZXc1JDTkFqSkNwVlhqVDc2YzM5V0JWZUZVZjVIYXBhUWRkaGhDNEpv?=
 =?utf-8?B?MFdTUFdyN05VZE56T2VhL1ZrOWNtRmZZcnZkZ1NkMklXOGN4MXowRkxNZ2Za?=
 =?utf-8?B?SnJvMGROUisvRTBKaENpSEY4dnZuUmFhMEVFcFpqRXlXajAxUmxyV0liMi84?=
 =?utf-8?B?Zk1hSll4eS8vVUF6aldKQXByWXpCY1JWM3Q4MWZFcDBabjVJR25sd09EYUJk?=
 =?utf-8?B?S0ZVL1FjSCtvR2VLQVdUQmVMYzduT2xtTlRHTFJoZy92QXh2THlrbnNXNlQv?=
 =?utf-8?B?UHg3WncyY0Q3S1FxMzRKZmVBdjExbkxINk80SG5zZnJobDM5T2pnaUVWSDBw?=
 =?utf-8?B?djltYzM0aUdrc2VSb2swSjVqUk1Ic1M5dytHUUdkSWRCOVgveGRSUkFNNUhx?=
 =?utf-8?B?ZkdBOTNuL3hwK3g1dUlXbFFTTi9YL0FnVjlQY1RZQnJ0N2lBbGlKRHNyVU11?=
 =?utf-8?B?SUp3T3EvQ2d2NFgrV3BTVm40Z05FL21mSVdVK2FxVmlRN0ZwamgwNkxEQ2sz?=
 =?utf-8?B?K3lsUlVKcVE0bDhSbXFxRDNUU1A5ZWhnOFhJYWRyNE1tOVBtVmtEeWR1VUNj?=
 =?utf-8?B?bDZnRWZMQVJjcUExVTRpNlZuT2RKZjRubFdza0g2TWo1Y1ZxbkErZFpmbjhM?=
 =?utf-8?B?cjFmb3FJWkpUZGFDdTJVM3FaVVpXQWVNN29vYmdQL3hPVVJUQ0lNdHJQQzBP?=
 =?utf-8?B?aVFHR3RPS3puaVpkQStpQ2ZIam0xc2dTWTBrNUVYMXlKOEZTaXJFNzhHem94?=
 =?utf-8?B?VGZWTWNNOEFRVUVNajhMR2w4Mm9LUnRjOEwrcU1hTzhySGIwb1IwYkJCMm1j?=
 =?utf-8?B?RW5vRHFpK2I0TUNhR0VnbDRDcTZZUTdpRmtyUzF1TmZmTXNPaVZQWGNmVkRU?=
 =?utf-8?B?VlFGSEVERUI2S3piY1haUnIzVFFJY1FRSktPUkp4Wi9UWEdJRExRQWY2bTcr?=
 =?utf-8?Q?LKNfDkRh7lIS7lbl4AL+0EoVv1MwB3zpOErEkrlZ9FoX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00BDB4289B41CD4EB1A344A83E162918@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 def48206-23ec-476c-6172-08d99ed17b01
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 13:54:39.7841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 xyAQry7vdHaMYVjSA5ugSJqpo40FkjAoQRYPtfcz+eeTYS9vTPyiMFCLYy192Iis3ZdovBMQJkJSewyTiDUE3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4846
X-OriginatorOrg: intel.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Nov 2021 13:54:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2078

T24gV2VkLCAyMDIxLTExLTAzIGF0IDA5OjU2ICswMTAwLCBNaWNoYWVsIE9wZGVuYWNrZXIgd3Jv
dGU6DQo+IEhpIEFudWosDQo+IA0KPiBPbiAxMS8zLzIxIDg6MTAgQU0sIEFudWogTWl0dGFsIHdy
b3RlOg0KPiA+IEFsc28gYWRkIGEgbGluayBmb3IgZG9jdW1lbnRhdGlvbiB0byBqdXN0IHJlbGVh
c2VkIDMuMS4xMSByZWxlYXNlLg0KPiANCj4gDQo+IFRoYW5rcy4gTWVyZ2VkIGludG8gdGhlICJo
YXJka25vdHQiIGJyYW5jaDoNCj4gaHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dp
dC5jZ2kveW9jdG8tZG9jcy9sb2cvP2g9aGFyZGtub3R0DQo+IFdobydzIHN1cHBvc2VkIHRvIGFk
ZCB0aGUgdGFncyBieSB0aGUgd2F5PyBBbSBJPyBJIGd1ZXNzIGl0J3MgYmVzdCB0bw0KPiB3YWl0
IGZvciB0aGUgcmVsZWFzZSB1cGRhdGUgdG8gYmUgbWFkZSwgaW4gY2FzZSB3ZSBoYXZlIHVwZGF0
ZXMgdW50aWwNCj4gdGhlbi4uLg0KDQpZb3UgbWVhbiB0aGUgcmVsZWFzZSBnaXQgdGFnPyBJIHRo
aW5rIHRoYXQgb25lIGlzIGNyZWF0ZWQgYXQgdGhlIHRpbWUNCm9mIHJlbGVhc2UgYWxvbmcgd2l0
aCBvdGhlciBZUCByZXBvc2l0b3JpZXMgYnkgVmluZWVsYS4NCg0KVGhhbmtzLAkNCg0KQW51ag0K

