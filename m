Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.6248.1601432640736847082
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Sep 2020 19:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=Bd413A0v;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: VdECe0ZLv+kMlj6ImUPeabWpRTUmpwsHNUvWtRxwxYE5OrfdqC3INiquX9ujw/bane6v8e4wbj
 DNKRT7eDVisw==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="247071086"
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; 
   d="scan'208";a="247071086"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 19:23:59 -0700
IronPort-SDR: Tck5FYtgqKdN7TjLT3gvXfKv65X0n/A5OFcRU5Yc6EcEzGiK4WvBYyjcAC7rmE0AHvHSez5yU7
 W09ZYfJ6iCGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; 
   d="scan'208";a="338900631"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga004.fm.intel.com with ESMTP; 29 Sep 2020 19:23:59 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Sep 2020 19:23:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 29 Sep 2020 19:23:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 29 Sep 2020 19:22:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3wfgP0ZdGJRqM9ao5VGqGw2gf42INSTvgXMB5YIgol50NE1PAbZIRm2SDo6oz7cOknwp6xVzijdIrwPJvwX2eqKkImhLR6XhBqyk7ZFnZb3lFJlI69NStuv7t/nvAaK4aSd0JQ8m3h2HcLWLJ9u5sRlpD4v9SPWzULuJs1+MW765QsGqBA9/IsQWhjmMBjMldp6GQBFxT+P4oGaQk47+9p8D/S7SsaTl4NCam4yeJusrYJV+acs8w4Fa2RhY4f9c+pHvbxvkHkVuI9Y9A+X/S2yR8h2bTzo25RFLUtNAbSCoKkg1bruXHyxXuLSyJlE53JGjnkXlfUMdmpbg3wwqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/aOYp6SHAf0E5TTA1H7kMbYZ5ZK5JF6sWF8YzWEKr0=;
 b=NV7qJMeLgliQWOK9ayy3b2O//BZWuQ9rIHGoxujoz+g9h2/lXiWxL2/jh0nAPVgr9O/MxjQC78IFB7XY1BmWPbHW/HrNZuAt/lYDYq7pU3Q6fADdPJhmSWKWRux+7nzEGJIhoyaKS1qLJB50UMoVqzdr6r90Hy0R4oFXCR0hPUv+iocmY0SPS7ug49+bLJH5NUnkmJDUewWkVvWmKfrd3TWQkrydFygS4EhKrB4LgERidViXTMy4q2oFoLCm+pIPjspenyu/7ZsfmgIyXAzjD0KBUH4DfhOYChxdaRyBR5BONyxnZShX1tgCqv9A/UQQm2isEYfLrHSA6X7wez4SHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/aOYp6SHAf0E5TTA1H7kMbYZ5ZK5JF6sWF8YzWEKr0=;
 b=Bd413A0vh2BZKjYwNHwM3n5RtAy7bfktVQ6WeCgakWSx3RTla7wmlC1J8aEdcYbvABTNvwY5brxDvlQUmWxdsqXxghJz0b0G8pf+ua/e82KPB3lYUkP8gnGFFgNunVToQ6S0Lr21qkXa2MuKblXDTB/IT67jVt1RqY5MwaB2Fz0=
Received: from DM5PR11MB1993.namprd11.prod.outlook.com (2603:10b6:3:12::18) by
 DM6PR11MB4156.namprd11.prod.outlook.com (2603:10b6:5:192::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34; Wed, 30 Sep 2020 02:22:57 +0000
Received: from DM5PR11MB1993.namprd11.prod.outlook.com
 ([fe80::2095:c2b4:79a7:f0d6]) by DM5PR11MB1993.namprd11.prod.outlook.com
 ([fe80::2095:c2b4:79a7:f0d6%4]) with mapi id 15.20.3412.029; Wed, 30 Sep 2020
 02:22:56 +0000
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v3] sphinx: ref-variables: Added entry for IMAGE_EFI_BOOT_FILES
Thread-Topic: [docs] [PATCH v3] sphinx: ref-variables: Added entry for
 IMAGE_EFI_BOOT_FILES
Thread-Index: AQHWkAoiXe5AI+1qwEaNIZEslvO1aKl9YNzwgALfOwCAADSoMA==
Date: Wed, 30 Sep 2020 02:22:56 +0000
Message-ID: <DM5PR11MB199348ED7CC1896324E98AE0DE330@DM5PR11MB1993.namprd11.prod.outlook.com>
References: <1600687615-18331-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
	 <DM5PR11MB1993C7F06445E9E4E8A8F684DE350@DM5PR11MB1993.namprd11.prod.outlook.com>
 <2980b80ca25a8f4e08124048d6200932ecff7ba2.camel@linuxfoundation.org>
In-Reply-To: <2980b80ca25a8f4e08124048d6200932ecff7ba2.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [113.210.100.225]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42e92ecb-881d-4f00-81b3-08d864e7be85
x-ms-traffictypediagnostic: DM6PR11MB4156:
x-microsoft-antispam-prvs: <DM6PR11MB4156B5467714ADA56825AB18DE330@DM6PR11MB4156.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7lSLSCdujZCkCItaWwVvPcO1KqtpYgp2zmehG/Ogjcu7F1MmAapLgosvc390zv+X5LLjDHxDCWYJreA5imEiAuFtYBFjadftJVhrfsiYw0noOLezfsFRV4yPpYOX+Sw8wcstOE0QVdz4DyIDlR3BCA4WJQcC+WvBBHPD2ZpjaZWMWvupxkIlA1VSae6uVs7b8XKO+w7J6wBOMBmGWjCJZ8ma7lT346pBrF0uvOMuQhaFFoEt6WADXKlCPME6PS6a0wk3agkmi6f/gFv3Rksin+eVPKR83+uIisBA3i3CZuk/WIluiiKvSi87gVMvAUJLGEtkbYHkbn1eBhvawJh5IA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(6506007)(53546011)(55016002)(5660300002)(71200400001)(8676002)(8936002)(83380400001)(478600001)(110136005)(316002)(66946007)(76116006)(33656002)(66446008)(64756008)(66556008)(66476007)(86362001)(52536014)(186003)(7696005)(4744005)(9686003)(2906002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: d52xUosoURwhYzq9C4VRZoeI9EzUhfo9EQa39SEW18CR67r5a9IRNA6M+Pzds/FjbWu4rZBJlN/oVIbQAoufJcrsFcC/zkj279SyVK9RlgH8O4ieEOyxV9W2EwIzvcsL+CXMJf5PCvjsCDKoxdbhNu6Kyl5u2pDhNSmc7po1XQEIfaRrxA7OtzzG/1xOAN8Tu3YwlUK/ON22PD0zfDjCAjrznakwSltwcLLuzPW47evD6bWPTMVO80gq/LAvYdhs9StBtSYmcu2fFGm0u24Hq4MKoWon8ZQfGE/pa6FNIfqvF8ScKy9p77w928LbNEgBahBgttLUtiH67UhkTXY5hagP8qPyH+ZcIYFQQAxdrQSw1RGpFUTy/D7u3dJZgUcxrQnWbik1Ifo8V0cKJFegfPNjBClBVxXHrfUr7vtSPOJrWki/6tHpXT12wt7hiQxom/D/8YN6/AK9SQkV3dXqyESFkJ3jSv3EEQgGrmVUs4mBYAOI3bJNNzGJ2ZkmLev0i4iSGkf9F2a3QhyHf//PkniKfgjNAvzoWFUbsdsQJisDjj2M7TkX+TyuEmDNli625axsGPuWJbNJYKAtK1ohi/AuNIy2vGN0EwdorLotrfspXZSELN1+7E+h0+0HeiM2iLdsT7FpN4k7iM6qloZmAA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e92ecb-881d-4f00-81b3-08d864e7be85
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 02:22:56.7909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hqiypdBZIe25dYI0WMIUHcOcnJiHfndp2T2bbeagdhnLcZBB3uo0MxbkM310Z6IFTfZj/lkfIL35Xih7jtORtl5Dvk+LMaPDlCleu1+Fz4a0m4hsrUS/Yc2Cia+y3Gn8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4156
Return-Path: khairul.rohaizzat.jamaluddin@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciB0aGUgaGVscCwgUmljaGFyZCENCg0KVGhhbmsgeW91ICYgS2luZCByZWdhcmRz
LA0KS2hhaXJ1bA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogZG9jc0BsaXN0
cy55b2N0b3Byb2plY3Qub3JnIDxkb2NzQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFs
ZiBPZiBSaWNoYXJkIFB1cmRpZQ0KU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMzAsIDIwMjAg
NjozMCBBTQ0KVG86IEphbWFsdWRkaW4sIEtoYWlydWwgUm9oYWl6emF0IDxraGFpcnVsLnJvaGFp
enphdC5qYW1hbHVkZGluQGludGVsLmNvbT47IGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0K
U3ViamVjdDogUmU6IFtkb2NzXSBbUEFUQ0ggdjNdIHNwaGlueDogcmVmLXZhcmlhYmxlczogQWRk
ZWQgZW50cnkgZm9yIElNQUdFX0VGSV9CT09UX0ZJTEVTDQoNCk9uIE1vbiwgMjAyMC0wOS0yOCBh
dCAwMjozOSArMDAwMCwgSmFtYWx1ZGRpbiwgS2hhaXJ1bCBSb2hhaXp6YXQgd3JvdGU6DQo+IEhp
LA0KPiANCj4gRG9lcyBhbnlvbmUgaGF2ZSBhbnkgdXBkYXRlcyBvbiB0aGlzIHBhdGNoPyBEb2Vz
IGl0IHBhc3MgZm9yIG1lcmdlPw0KDQpTb3JyeSwgdGhlcmUgd2FzIHNvbWUgY29uZnVzaW9uIG92
ZXIgd2hvIHdhcyBtZXJnaW5nIHBhdGNoZXMuIEl0cyBpbiBub3csIHRoYW5rcyENCg0KQ2hlZXJz
LA0KDQpSaWNoYXJkDQoNCg==
