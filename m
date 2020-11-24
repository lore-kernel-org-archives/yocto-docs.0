Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.1409.1606243199203098954
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Nov 2020 10:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=msQt4pR8;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: vineela.tummalapalli@intel.com)
IronPort-SDR: KYNH3vyuc53QiA0mOqZrpeC0MCk4710G8MeT9tYwNulsSzO+cf+nnrm8XaiEeI8IxLtFe6d23b
 aVkdZAyLuo7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="171216469"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; 
   d="scan'208";a="171216469"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 10:39:58 -0800
IronPort-SDR: WR6ktulkMFzxx4a4GR3Jh1kn8Wpcdv5JoE+cVvhjZo1IVuBbS4QFD5IWt/kggpIQXRSbc35TpN
 DZobdNNeR6hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; 
   d="scan'208";a="361985381"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP; 24 Nov 2020 10:39:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Nov 2020 10:39:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 24 Nov 2020 10:39:57 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 24 Nov 2020 10:39:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gw4RyS2o4KkCtn5YYSeObn1Fgg9B/xwXayRaEP9hO2IfJqguWqm0VMfG9wFrTOvnGlPw3EXrDylWSGAFKhIu93L2h5ZmpcOdYBoY/HctrEDR0YqtN//gIomchzNdRL8Vjlbztc9PYmey20KSWlE10gsoAgYRKFpxBfmT5bHCqYNc38Z5t4KhtFa9JrbJRdnJnmtlxdLYi3Ur+0uHSEzzn+cAQ0HpYUJQzZb7GEaNddDKrhkKqAR65pgy613oT+xY/rsJDXmbjgaXcbvie62tM1sLOwPMfCTH1tNjgd6iv3dSH5LfvNooZYlZF4cEQXfDYWCYjTNk2DA1cnoa1qwh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrI/e4KDJJBcXzHPni/UHDLjHACIgKGz8R3qxX1U6Gg=;
 b=OhWLVhjxt6GxgMsHR7254MMGloQeu7ylrAVjEPKWGsBMWaJ3rt4RDiV69A0GyAL4+AZfr5uTXWznBq9+fgcdR0OC9zCHEfb4a+5TmjS0Uo+XwIDRzkDL2FLMXkZmdSt/Ix6fnlKMlJ3hjrDRbBm9GRQrThRuALlzr6wdQq0Yfe21pcPrtHEjLUY8i4rfDZOfZ13z2XBHntvl01fl7dIL6aiYgH3DCm9tMwxYTXCukBNz6BVGLTB5Hvm+pX7B1K2wIgzy1q1FyjH57ThnO0NWhyZNbKZhxMATAfdEtQN2SkeQbju+E8uM3DLWWAFqTxVSl7NDtRj4LeTnfJjCJPTebg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrI/e4KDJJBcXzHPni/UHDLjHACIgKGz8R3qxX1U6Gg=;
 b=msQt4pR8T5+tFwpaLsuGel0VACEK/6pdt5jJ73SL2v2WqBp7BYAN2+5mmSVmf5hJn7i0HP89O0GzmQL8/z2gOIiR60y4ST+FCKh1wJINFa1N4kXV/5cDDmPxg8wdgYHpBi56yv99Zs+VH1M0sR5YZJHNXV0d7MirV4iwk2eVMDA=
Received: from BYAPR11MB2790.namprd11.prod.outlook.com (2603:10b6:a02:c4::29)
 by SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 18:39:55 +0000
Received: from BYAPR11MB2790.namprd11.prod.outlook.com
 ([fe80::5924:cbcf:3653:a9ca]) by BYAPR11MB2790.namprd11.prod.outlook.com
 ([fe80::5924:cbcf:3653:a9ca%7]) with mapi id 15.20.3564.034; Tue, 24 Nov 2020
 18:39:55 +0000
From: "Vineela" <vineela.tummalapalli@intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Michael Halstead
	<mhalstead@linuxfoundation.org>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Barker
	<pbarker@konsulko.com>, YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Tags in the yocto-docs repository
Thread-Topic: [docs] Tags in the yocto-docs repository
Thread-Index: AQHWwc8mGACSzNqnVEmkms58AFQerKnWGwyAgAAMjICAALqMAIAArNxQ
Date: Tue, 24 Nov 2020 18:39:54 +0000
Message-ID: <BYAPR11MB2790C65E6B3C5DA9320B695888FB0@BYAPR11MB2790.namprd11.prod.outlook.com>
References: <CAM9ZRVvsXTvLcT5+0c16Q=zub2wBZhUhdaudE5+qc_Pg8+vBdQ@mail.gmail.com>
 <858f33431e388f324d93bb75d5ac03f9f9c869f2.camel@linuxfoundation.org>
 <CADfgfoabPkBrKCBVO10_ACVfieExuC0-KQwyqG9pZHDUvWu5UQ@mail.gmail.com>
 <CAP71WjwtJhcxV3k+_NrKjbK0KfeCwtTZQukOsiDLV=aS-yM4hw@mail.gmail.com>
In-Reply-To: <CAP71WjwtJhcxV3k+_NrKjbK0KfeCwtTZQukOsiDLV=aS-yM4hw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [184.101.253.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d44ba8c-4e6e-46ca-8756-08d890a8565f
x-ms-traffictypediagnostic: SJ0PR11MB5213:
x-microsoft-antispam-prvs: <SJ0PR11MB5213848DF35DEE9D9836E54988FB0@SJ0PR11MB5213.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eKOCqCHVEDLOfizkfO4rNgf7WmskFTVIW4nuAm/gpggxZYaEj8SYdNN6BGZBqeCWcw8tVhgtiJqMfT8gIKV0bocadc/cxniYJFE1icZbk6ej2bBCp0bOG4Dn46jd72edfcAcp+XLM2EopVS2Qm3zouwA2GTlviafQjZtLZW6x/Ovp40rPPKISK/hFv7q4DnKFDrOu0sLk6DAjnYV+JrxM5gm2smmTeaAxE38unGilzkBvi37sOwDYHL6p+XtU88xUShQQFCRDaLTQnCZpQs4LG/LtfzbzNmwqd9aTt5dg0FmKPrNPv+PQhnUXW0OTpDFbOMbreRccqFu45Noh7xUpDHDuVkfloCPFqDGF1uZerEc6CdaislQ4E7PhW9AgiYOQVUHZrxGx7ndigBUJnw3vQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2790.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(2906002)(66476007)(8676002)(6506007)(71200400001)(53546011)(66946007)(76116006)(64756008)(5660300002)(86362001)(66556008)(52536014)(7696005)(66446008)(26005)(186003)(316002)(54906003)(110136005)(8936002)(4326008)(33656002)(9686003)(83380400001)(966005)(4001150100001)(478600001)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: q4WLiJNxm4m/lGtX701f5SZIbf5cN+VYDlez7C8LYcKNbUxGZRx8UmuF32Gvvr8WupZ7/OWyH5Qd4U3eJarfqPeyC714WerjYE6JFXnJaGw+BLUZ6VnbF01YjTpXxMojo7nAmn58IH9mEld/6R2Rxy6KNmY9VsxU5B758lnZfkzsAM5UjFhyAWSISt04FeOs1fDhkpug6ZELLfEvGMlz/oBfVWE8LZPjjUCO1rY3g2FtVZ3tYQc3fYgnVdPLyMuWOgNU2k9yfPHzyQT5O6ZhfUGhw9YRUM/3XbKy2XxXaJGU9Q6jJM16yxRtPeYto02isyJ9wMnf1NLGyB+Hb3xuTunFXe50gmmU8PQJX7QiN6s0/QXG2vvK3uiqo3k9W9vychdnP3lMxRuO2GenQH5VXUsYWXBjvwrWMA5lqdjyQVP2PUsrAWsn1qiTvs6haSQ8RLVs7JeghAIWFTcZkGfn7d31tWVte1DQgiODGK8Iwo5FrLKCIiLBin/r13y3cFsBWihfnhyYkdR19pLm9E16F7AtTLSoXrvJ3L8cnsEIn3XapwhjVR6YaFwOCgEabbhtoq722/611BaY9dxR1VqB3yHZ87vOI4u3d7UA+yv2h7bSia0RlvRLsQOD3SvWp51xEp2yoOaPmK5WLayUgCkh0mNpKPIHP+zzatSyEBYN/f6EMclm4U8ptABkBlXhC+zPpktDJnCdNrHw/kwWn7Oxx03LJD89R/lirovHjHn+azrRSykCLSPbW1QGB0sFpGdVvBNdx4OXL9PpArP2ptcU8YTDkgJQTC8S/LVKfY/TrYMm0klGczsphzgP1ao4KcBSR73RhSHLcS+K2cG9i/uXhAnlfioce6E9CKoIB4cNLYXo4J8jAjMWOsAYCjZWNmRnVZgzRoYw7+m1bVNuMHnqtQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2790.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d44ba8c-4e6e-46ca-8756-08d890a8565f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 18:39:54.9642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Th2FYL2cGxq9/lcCPuJhgLz/uKEQjdKC+/GtdWpoPdG9PtU8zSaZGub/AM92y/GcxLImFDe+1a9L4tXy1SiIIVXT9ABIPgbeB6fyv2zpX94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
Return-Path: vineela.tummalapalli@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gIEFsbCwNCg0KU29ycnkgZm9yIHRoZSBsYXRlIHJlc3BvbnNlLiBJIHdhcyBvbiBsZWF2
ZS4NCg0KSSB0aGluayBwcmV2aW91c2x5IHlvY3RvLWRvY3MgdGFnZ2luZyB3YXMgdGFrZW4gY2Fy
ZSBieSBTY290dC4gR29pbmcgZm9yd2FyZCB3aWxsIG1ha2Ugc3VyZSB3ZSBhcmUgdGFnZ2luZyB5
b2N0by1kb2NzIGFzIHdlbGwgZHVyaW5nIG91ciByZWxlYXNlcy4NCg0KTmljbywgSSdtIGFzc3Vt
aW5nIHRoYXQgeW9jdG8tZG9jcyBjb21taXQgdG8gYmUgYWRkZWQgdG8gcmVsZWFzZSBub3RlcyBh
cyB3ZSBkbyBmb3Igb3RoZXIgcmVwb3NpdG9yaWVzIGxpa2UgYmVsb3cuDQpTdXJlLiBXaWxsIGRv
IGl0IGZvciBmdXR1cmUgcmVsZWFzZXMuIFRoYW5rcyBmb3IgdGhlc2UgcG9pbnRzLg0KDQpFZzoN
Cg0KUmVwb3NpdG9yeSBOYW1lOiBwb2t5DQpSZXBvc2l0b3J5IExvY2F0aW9uOiBodHRwczovL2dp
dC55b2N0b3Byb2plY3Qub3JnL2dpdC9wb2t5DQpCcmFuY2g6IHpldXMNClRhZzogeW9jdG8tMy4w
LjQNCkdpdCBSZXZpc2lvbjogZjJlYjIyYTg3ODNmMWVlY2Y5OWJkNDA0MjY5NWJhYjkyMGVlZDAw
ZQ0KUmVsZWFzZSBBcnRlZmFjdDogcG9reS16ZXVzLTIyLjAuNA0Kc2hhOiBkYTg1MjI0YTI5MGQ0
ODRlZWFkYjA1ZWQ2OWM2NGUzYjllMGM4NzNjZjkxYzJlODRlOTZkZDU0YzRmZDI3NTJjDQpEb3du
bG9hZCBMb2NhdGlvbnM6DQpodHRwOi8vZG93bmxvYWRzLnlvY3RvcHJvamVjdC5vcmcvcmVsZWFz
ZXMveW9jdG8veW9jdG8tMy4wLjQvcG9reS16ZXVzLTIyLjAuNC50YXIuYnoyDQpodHRwOi8vbWly
cm9ycy5rZXJuZWwub3JnL3lvY3RvL3lvY3RvL3lvY3RvLTMuMC40L3Bva3ktemV1cy0yMi4wLjQu
dGFyLmJ6Mg0KDQpNaWNoYWVsLCBUaGFuayB5b3UgZm9yIHRha2luZyBjYXJlIG9mIHlvY3RvLWRv
Y3MgdGFnZ2luZy4NCg0KDQpUaGFua3MsDQpWaW5lZWxhDQoNCg0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogTmljb2xhcyBEZWNoZXNuZSA8bmljb2xhcy5kZWNoZXNuZUBsaW5h
cm8ub3JnPiANClNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDI0LCAyMDIwIDEyOjI1IEFNDQpUbzog
TWljaGFlbCBIYWxzdGVhZCA8bWhhbHN0ZWFkQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQpDYzogUmlj
aGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBQYXVsIEJh
cmtlciA8cGJhcmtlckBrb25zdWxrby5jb20+OyBZUCBkb2NzIG1haWxpbmcgbGlzdCA8ZG9jc0Bs
aXN0cy55b2N0b3Byb2plY3Qub3JnPjsgVHVtbWFsYXBhbGxpLCBWaW5lZWxhIDx2aW5lZWxhLnR1
bW1hbGFwYWxsaUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW2RvY3NdIFRhZ3MgaW4gdGhlIHlv
Y3RvLWRvY3MgcmVwb3NpdG9yeQ0KDQpPbiBNb24sIE5vdiAyMywgMjAyMCBhdCA5OjE3IFBNIE1p
Y2hhZWwgSGFsc3RlYWQgPG1oYWxzdGVhZEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4N
Cj4gVGhlIG1vc3QgcmVjZW50IHRhZyB3YXMgMy4wLjEgbGFzdCB5ZWFyLiBJIHdpbGwgYWRkIGEg
dGFnIGZvciB5b2N0by0zLjIvZ2F0ZXNnYXJ0aC0yNC4wLjAuIFNoYWxsIEkgYWRkIHRhZ3MgZm9y
IHRoZSByZWxlYXNlcyBpbiBiZXR3ZWVuIGFzIHdlbGw/IEkgY2FuIGRldGVybWluZSB0aGUgYmVz
dCBjb21taXRzIHRvIHRhZyBiYXNlZCBvbiB0aGUgZGF0ZSBpbiB0aGUgZ2l0IGxvZy4NCg0Kb3Vj
aC4uIEkgd291bGQgaGF2ZSB0aG91Z2h0IHdlIGluY2x1ZGUgdGhlIHlvY3RvLWRvY3MgY29tbWl0
IGluIHRoZSByZWxlYXNlIGFubm91bmNlbWVudCwgYnV0IGxvb2tzIGxpa2Ugd2UgZG9uJ3QhIFBl
cmhhcHMgd2Ugc2hvdWxkIGFkZCBpdCBpbiB0aGUgZnV0dXJlLCBWaW5lZWxhPw0KDQpJIHRoaW5r
IHdlIHNob3VsZCBhZGQgYWxsIHRhZ3MuIFlvdSBjYW4gZmluZCB0aGUgZXhhY3QgY29tbWl0IGZy
b20geW9jdG8tZG9jcyB3aXRoOg0KY2QgcG9reQ0KZ2l0IGxvZyA8UkVMIFRBRz4gLTEgLS0gZG9j
dW1lbnRhdGlvbg0KDQplLmcuDQoNCiQgZ2l0IGxvZyB5b2N0by0zLjEuMyAtMSAtLSBkb2N1bWVu
dGF0aW9uLyBjb21taXQgZjJhZTM4YTA1NWY1NDY0MGE5NjhjNGE4ZDUwNzRmMDQ0MjAyMzgwZQ0K
QXV0aG9yOiBTdGV2ZSBTYWtvbWFuIDxzdGV2ZUBzYWtvbWFuLmNvbT4NCkRhdGU6ICAgVHVlIFNl
cCAxNSAwNDoxMTowOCAyMDIwIC0xMDAwDQoNCiAgICBEb2N1bWVuYXRpb246IFByZXBhcmVkIGZv
ciB0aGUgMy4xLjMgcmVsZWFzZQ0KDQogICAgKEZyb20geW9jdG8tZG9jcyByZXY6IDFhNjllMmMw
MjlhM2NjNzU1NzM0YzhjMTg1ODQxNDFjYzMzMDk2OTUpDQoNCiAgICBTaWduZWQtb2ZmLWJ5OiBS
aWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCg0KDQo+
DQo+IE9uIE1vbiwgTm92IDIzLCAyMDIwIGF0IDExOjMyIEFNIFJpY2hhcmQgUHVyZGllIDxyaWNo
YXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4+DQo+PiBPbiBNb24sIDIw
MjAtMTEtMjMgYXQgMTk6MzAgKzAwMDAsIFBhdWwgQmFya2VyIHdyb3RlOg0KPj4gPiBIZXkgZm9s
a3MsDQo+PiA+DQo+PiA+IEkndmUganVzdCBub3RpY2VkIGFzIEkgaGF2ZSB0aGUgd2ViIGludGVy
ZmFjZSBvcGVuIGZvciB0aGUgDQo+PiA+IHlvY3RvLWRvY3MgcmVwb3NpdG9yeSANCj4+ID4gKGh0
dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS95b2N0by1kb2NzLykNCj4+
ID4gdGhhdCBubyB0YWdzIGhhdmUgYmVlbiBjcmVhdGVkIGluIHRoaXMgcmVwbyBmb3IgcmVjZW50
IHJlbGVhc2VzLiBJcyANCj4+ID4gdGhlcmUgYW55IGludGVudGlvbmFsIHJlYXNvbiBmb3IgdGhp
cyBvciBoYXMgaXQganVzdCBmYWxsZW4gYnkgdGhlIA0KPj4gPiB3YXlzaWRlIGluIGZhdm9yIG9m
IG90aGVyIGNvbmNlcm5zPyBJcyBpdCBzb21ldGhpbmcgd2Ugc2hvdWxkIA0KPj4gPiBhZGRyZXNz
Pw0KPj4NCj4+IE5vdCBpbnRlbnRpb25hbCwgd2Ugc2hvdWxkIGhhdmUgdGhlbS4NCj4+DQo+PiBJ
J3ZlIGFkZGVkIFZpbmVlbGEgYW5kIE1pY2hhZWwgc2luY2UgdGhleSB1c3VhbGx5IHRha2UgY2Fy
ZSBvZiB0aGlzLg0KPj4NCj4+IENoZWVycywNCj4+DQo+PiBSaWNoYXJkDQo+Pg0KPg0KPg0KPiAt
LQ0KPiBNaWNoYWVsIEhhbHN0ZWFkDQo+IExpbnV4IEZvdW5kYXRpb24gLyBZb2N0byBQcm9qZWN0
DQo+IFN5c3RlbXMgT3BlcmF0aW9ucyBFbmdpbmVlcg0KPg0KPiANCj4NCg==
