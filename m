Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.28150.1601260767974634299
 for <docs@lists.yoctoproject.org>;
 Sun, 27 Sep 2020 19:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=YgVOHp2j;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: mNpFwBVuWZBafdXr0LVmq8AYUSk/6WWShL4VjqUifb4Yj/WEOfWGumF2Az2Uc9+e2rXU4YhnEt
 HPvPXUD75Jfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="149705557"
X-IronPort-AV: E=Sophos;i="5.77,312,1596524400"; 
   d="scan'208";a="149705557"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2020 19:39:26 -0700
IronPort-SDR: iasrPJAloLAmpF0v5S7Wpcga6zOoc4Zdz5Wg2zBY3TklpEiUIAci6Q/gORU954rw/pZVuX3wpf
 9654oISQE+ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,312,1596524400"; 
   d="scan'208";a="340275486"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga008.jf.intel.com with ESMTP; 27 Sep 2020 19:39:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 27 Sep 2020 19:39:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 27 Sep 2020 19:39:26 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.51) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 27 Sep 2020 19:39:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQBYz8LgRqed7txm5ADhR/xHC+eQlQFxm6w1ubgqImsNhQdMWn87Je8dKnE1uW7B37nCs+VK9B4VGZZfNbc0o7aOo9KdUpVsJug93Ep/FCL9REk2wTpvqCt8U3lxiQ41T6UARq+QtDmY7x8fF6kd/LauoURlh7Rrwiv53oO64xgdCN3kb/kyAeN+IJcUHEfQsnbyBztL15EBG7VQf0m5F0XWZagzXFD1ApVFtoXlTs7nR9EyISjOtM/05ArEj0T1cVW+Wo+jGZ/IHo3ueChTV0UVu/7vnjM/PlSfqFNZGjjMtCzYFO7OC5hIz1J0NQt9csPMjzSycvfOAJPoQ+bisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIz/PXdFtaLtTixxreCIx6JgSntjq6sZACk8IS7Z+fQ=;
 b=LQOQWCxoHOJ1++XeY6DA+AI22KIqnlNToHcOQ6wax/tMf2WGDjoIuWTd92bmSlb/00+ihWKADjmkUG0VtamJm5C6K6QI6GWvx6f0wsD7Tx/z2mjsIsdenSN+WFs9L6hvThzmoEoLqst0j2nIJh9HUeE4s7JndPE490v3NBr43R23Sjgl8cyHqX5hqHZL6gYDFEasGJm9g8Fp1aiDua5ZgzDYJMQWse07HyvNqS+FZEfMgMfplHZoW2BxYNC5+QlGMAUAyy/6T6mQEQN36yjdmsBXB1OixeCmEBkGIAuSlGqSXtXKZB0y8kY/FGsph0ThzXVma6Lv2VZvGWpoGj+Ucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIz/PXdFtaLtTixxreCIx6JgSntjq6sZACk8IS7Z+fQ=;
 b=YgVOHp2jdYQuVX8Fok9FeY2ZXeo19zo7GkbneoiP8CeiJGB7DxUfGgsfWW4AnCUTP+0KquPCTELfdqi12ftzVXQSC2vRvzWNancn7bcwSe8/eHLRam8dfrl0rnhBn6088LoBRfZzkvpJ8dnTC0eSPTJ6Kz9SDx8peka3AG8H+SE=
Received: from DM5PR11MB1993.namprd11.prod.outlook.com (2603:10b6:3:12::18) by
 DM5PR11MB0026.namprd11.prod.outlook.com (2603:10b6:4:62::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.23; Mon, 28 Sep 2020 02:39:24 +0000
Received: from DM5PR11MB1993.namprd11.prod.outlook.com
 ([fe80::2095:c2b4:79a7:f0d6]) by DM5PR11MB1993.namprd11.prod.outlook.com
 ([fe80::2095:c2b4:79a7:f0d6%4]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 02:39:24 +0000
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [PATCH v3] sphinx: ref-variables: Added entry for IMAGE_EFI_BOOT_FILES
Thread-Topic: [PATCH v3] sphinx: ref-variables: Added entry for
 IMAGE_EFI_BOOT_FILES
Thread-Index: AQHWkAoiXe5AI+1qwEaNIZEslvO1aKl9YNzw
Date: Mon, 28 Sep 2020 02:39:23 +0000
Message-ID: <DM5PR11MB1993C7F06445E9E4E8A8F684DE350@DM5PR11MB1993.namprd11.prod.outlook.com>
References: <1600687615-18331-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
In-Reply-To: <1600687615-18331-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [115.164.216.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fdd4afb-ce85-4855-3290-08d86357b614
x-ms-traffictypediagnostic: DM5PR11MB0026:
x-microsoft-antispam-prvs: <DM5PR11MB0026D01003BA427A512F3892DE350@DM5PR11MB0026.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Ws54Ub2ZNUy1vV1gQEINdoEr9CmvkPrW2AHGhiP3SAzy2836Ezj+1b21vG0sNlYPerwP048e4xR3otXzCjObGzwi/WO9CrP6FUGtxFnPfYxShyZPUMA5ko61a/wpEc22hU51yBdfLKneywMKyfIwxsiYAQqFdkxxRS3gCZZo+GeKCkKL1Tlkz91Mf+hosBUZibuZZ0pPkNav2Ve6Jmij/TLOvd19QNOpaelan56yBLMpkczjjiLphMvZFMX2jbzFkVMBy4F1ZUztdbk0ZfLwoEXuOhzLJUb97DeotgtBXImgjfVmwhrbac+IU2s0uy2ESbM049wHPfHFDWoJ88eW/T3sfUhhWlPX2hDkc2K5am1bSplfq1OPnDZKoKRBTPt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(5660300002)(52536014)(9686003)(55016002)(8936002)(8676002)(478600001)(186003)(6506007)(66446008)(55236004)(53546011)(26005)(66476007)(6916009)(76116006)(86362001)(66556008)(64756008)(71200400001)(83380400001)(66946007)(2906002)(316002)(33656002)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: ElrfDyrIS+JG0RM7rPPs5lBJE0Pq0bdPgRFcLdweBOmXs3TeXj32MtQI9VY+gSFdQ8yLH0DtrRnfnD+vx8XfepnVnNpDd++faVHc4GTNtRbZp9Wl4ErlUdeneygcXuM4qdCYx631LGVeEUHCPg/8XcTt/1Oc1vbeozrp5/m8Da9v7UE7Bsq+s7uS9YKc2lO5543pw1cToK8TNORuOxbe8MTBJ2vk7QtusJMEafzaEcivn5EY0QyFyq0DTY+VhK+k45gLSSAdrptE3UBhgpjnlFB4Pclf3606HE2wtB4tVyF+1OO2u4f2C6ZI3D1wfK/GupWsQGr3P41gRwRV4uA9boKC3AyqNzY2Wf2euJLHcYH8/huffby4uG+hxAaJ/SOFtdHVOUG8NL+I8lwAA+QuzwiOXLTwSrFkj/gInA8Woz8w8fABIA7bDaiDNPV2AtEFChh5UxdwG2KK4aJGXzZi/5yeJeQzNSCRzPmumNzzo6e4LngsIYuD2+l8BVNBithKUy1HPenZ8ddoIbIFwLis9/jr4943Lpd3zx3wElnKNE2VzrHaAOpTFTGQHTpq4vQJurDz25tvMiOuDKKa8SrhS1cbBZ7bp0yFYjGyET9xM30C19QBQjNnamPlmtvE2evY0S6ekbbZNU7cxAqOWe9/mw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fdd4afb-ce85-4855-3290-08d86357b614
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2020 02:39:23.8368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VAY8Ry1zScTU+TNRFs/YOYBhl/GEh+3q7pGPtnJrN7m+zDUfqp8abzZmWXadHZhPYo0B3f2OeDaGmDNSQHhGgWa6x2VoaJrixkKWhRl57wdLHOxhThMmGwEjaQ9wqRU4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0026
Return-Path: khairul.rohaizzat.jamaluddin@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Does anyone have any updates on this patch? Does it pass for merge?


Thank you & Kind regards,
Khairul

-----Original Message-----
From: Jamaluddin, Khairul Rohaizzat <khairul.rohaizzat.jamaluddin@intel.com=
>=20
Sent: Monday, September 21, 2020 7:27 PM
To: docs@lists.yoctoproject.org
Cc: Jamaluddin, Khairul Rohaizzat <khairul.rohaizzat.jamaluddin@intel.com>
Subject: [PATCH v3] sphinx: ref-variables: Added entry for IMAGE_EFI_BOOT_F=
ILES

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

IMAGE_EFI_BOOT_FILES created to help differentiate files needed between boo=
timg-efi and bootimg-partition when creating the installer/.wic file.

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@i=
ntel.com>
---
 documentation/ref-manual/ref-variables.rst | 38 ++++++++++++++++++++++++++=
+++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref=
-manual/ref-variables.rst
index 625a37c..c09809e 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -2902,10 +2902,46 @@ system and gives an overview of their function and =
contents.
       The base name of image output files. This variable defaults to the
       recipe name (``${``\ :term:`PN`\ ``}``).
=20
+   IMAGE_EFI_BOOT_FILES
+      A space-separated list of files installed into the boot partition
+      when preparing an image using the Wic tool with the
+      ``bootimg-efi`` source plugin. By default,
+      the files are
+      installed under the same name as the source files. To change the
+      installed name, separate it from the original name with a semi-colon
+      (;). Source files need to be located in
+      :term:`DEPLOY_DIR_IMAGE`. Here are two
+      examples:
+      ::
+
+         IMAGE_EFI_BOOT_FILES =3D "${KERNEL_IMAGETYPE};bz2"
+         IMAGE_EFI_BOOT_FILES =3D "${KERNEL_IMAGETYPE} microcode.cpio"
+=20
+      Alternatively, source files can be picked up using a glob pattern. I=
n
+      this case, the destination file must have the same name as the base
+      name of the source file path. To install files into a directory
+      within the target location, pass its name after a semi-colon (;).
+      Here are two examples:
+      ::
+
+         IMAGE_EFI_BOOT_FILES =3D "boot/loader/*"
+         IMAGE_EFI_BOOT_FILES =3D "boot/loader/*;boot/"
+
+      The first example
+      installs all files from ``${DEPLOY_DIR_IMAGE}/boot/loader/``
+      into the root of the target partition. The second example installs
+      the same files into a ``boot`` directory within the target partition=
.
+
+      You can find information on how to use the Wic tool in the
+      ":ref:`dev-manual/dev-manual-common-tasks:creating partitioned image=
s using wic`"
+      section of the Yocto Project Development Tasks Manual. Reference
+      material for Wic is located in the
+      ":doc:`../ref-manual/ref-kickstart`" chapter.
+
    IMAGE_BOOT_FILES
       A space-separated list of files installed into the boot partition
       when preparing an image using the Wic tool with the
-      ``bootimg-partition`` or ``bootimg-efi`` source plugin. By default,
+      ``bootimg-partition`` source plugin. By default,
       the files are
       installed under the same name as the source files. To change the
       installed name, separate it from the original name with a semi-colon
--
2.7.4

