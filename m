Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.39795.1600687451531385260
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 04:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=boleJFco;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: i92jZxzrTlSz7dohJy8AC6NycwYBlmwLnB6cSL9zdN+RDAHhpUE93YViqp5WrM02jENT2jRywI
 Qgy9LzhVj4Aw==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="159653303"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; 
   d="scan'208";a="159653303"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2020 04:24:07 -0700
IronPort-SDR: r2AxHd6F+k1hZDyDMydE1Pt5Kz20O0qYZpwyNKB7szHKp0Wuh2sO8zMQ6v75SingXHMD9kT5vu
 aZaHWIuDSR5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; 
   d="scan'208";a="341512318"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga002.fm.intel.com with ESMTP; 21 Sep 2020 04:24:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Sep 2020 04:24:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 21 Sep 2020 04:24:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 21 Sep 2020 04:24:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dtqp/10hd861NAfdqUP21AU1uzoPBkxx7Nii0dTnZXZkZjvO+ZEdT5AAtdI3QhLsee1vfYUBBZediVys0z/DOa89FP/+fJJzAy405GhuICuZtidVeaTsyZpJx8qA03k4qlrmJvZuaMle8yLdcHqPbpHd8o7dvZzZYFXok7eMv17wLksvzw1NZDOcxWXVLxQKPlaqOl62idJQv3DIOrz3DgmuAcG/B01dxUSCwPymPCLSWhfE1LAGZn9nwTsnovnG3fNBC2p2NsqvCT1EymAjsnLRo7ug2lmoxakoex9JHFIgnDzlBHTQxDvZcEHnmcm3ig9Oswvop5U7r6SdeqPSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ISxEZpfi8rwENMPgW6SZJ0xzthZufuCFqUBe4driFA=;
 b=GYrKZ+s6zrF69wHCgkP7fDCqwqynMDyCbIZ7kzGNpJAaVr+NYyWswGv6sxxfiEMwnFhlr6Jhsx2d943BibgfPKBWZK/IoBS4oN3d4+0jJVA6lWUKzZpnVhCmOEilPXW+k6xYznbuNzQEkLIpManWK7ZVtJNOOuJz2ZIPwC/0U8CMtwr0YqTLLfslaBTxsST+F2XI6XCDPrUzm2xD3Qo58FvbLiFU2heIfSdapdWRjVnwuTI+Uq7otGRH6Oqu0JegvtmUIa/qEyNd+0pCgtHSBaScYPfEXufEoG4mFYNhxUTzGlzr1wmY6lDH/e4ApywkarlTFHOPA6lhWeaUTXbS7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ISxEZpfi8rwENMPgW6SZJ0xzthZufuCFqUBe4driFA=;
 b=boleJFcomVz1sZ828bQmdoj+3Wgaf3QnJFKxC8SK7Vd+XsFUuA+bP6Mily2MrwaWUm+YtqofEvZyWxQIOcfLMdNysGGXcgcsubERx8eOu7JOsjlqWDoWh10LCSkQ2aHwXYzepYK0BqJTY4i8Y0eKDyOgEEegKmc4IoLBoiVIor8=
Received: from DM5PR11MB1993.namprd11.prod.outlook.com (2603:10b6:3:12::18) by
 DM6PR11MB3993.namprd11.prod.outlook.com (2603:10b6:5:19c::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.11; Mon, 21 Sep 2020 11:24:01 +0000
Received: from DM5PR11MB1993.namprd11.prod.outlook.com
 ([fe80::2095:c2b4:79a7:f0d6]) by DM5PR11MB1993.namprd11.prod.outlook.com
 ([fe80::2095:c2b4:79a7:f0d6%4]) with mapi id 15.20.3391.011; Mon, 21 Sep 2020
 11:24:01 +0000
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] sphinx: ref-variables: Added entry for IMAGE_EFI_BOOT_FILES
Thread-Topic: [docs] [PATCH v2] sphinx: ref-variables: Added entry for
 IMAGE_EFI_BOOT_FILES
Thread-Index: AQHWjZsOTVf+mkAUKUa42+l5DBR0TKluHcoAgATaEAA=
Date: Mon, 21 Sep 2020 11:24:01 +0000
Message-ID: <DM5PR11MB1993CE841B26B1463189D864DE3A0@DM5PR11MB1993.namprd11.prod.outlook.com>
References: <1600420007-43045-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
 <20200918091716.22q6yzqvqgr37usl@qschulz>
In-Reply-To: <20200918091716.22q6yzqvqgr37usl@qschulz>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: streamunlimited.com; dkim=none (message not signed)
 header.d=none;streamunlimited.com; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [115.164.81.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd32fe2f-1880-43e6-2d80-08d85e20d710
x-ms-traffictypediagnostic: DM6PR11MB3993:
x-microsoft-antispam-prvs: <DM6PR11MB3993857326C525E097AE9201DE3A0@DM6PR11MB3993.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i3+EYB3O9BFHLooiG7RofoqAu4yOrnc6C0E3kOrBzEYy6O/rdDoRN54eKBZh9L0hE1tRuTqfV933G0hSpCWfHvkMkDZDqCefDBRX/HBD7xNx1mbkSM4XQDCK/pzSkNe8UdP9tQrAHvD84Sp9vOo7ggoef5AKaARH/Db6JqDbotBFqpqoQ4aeQdIuMWOw5EAZBgS5dGCyoPRxDDuOk9ur3VTXWAX1OfRRzpcp8lA3yxqSvvM7toxFy4XppF8F6PMci91j/guAu4NJlycvQ6VLsZsYsiWsEaKGQ8NjJTZkAFuPRVO5EhCVUkZKNv5WJLLQqUux1JuhYrPAUDvMIDKdrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(66946007)(66476007)(76116006)(26005)(64756008)(316002)(8936002)(186003)(478600001)(4326008)(66556008)(66446008)(33656002)(6916009)(7696005)(2906002)(8676002)(55236004)(53546011)(52536014)(6506007)(55016002)(9686003)(71200400001)(5660300002)(86362001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 6hDzu3DODJdTf1N8fEy3dB0NLq5ZOl5prKk120hxviWZUwfGi3ov2h4Z5sX5fU5rBYeNQPfKyzUe9aaYuQKmLaWBaq9P7xhmwkA5aCrpIBHgmik1sve6ZpXpBuAnawHDnFORjquBicemQ3ux/Nh5MvhGKplcjjFlp/5QM5wk/Y00E8lIGal5LXSGPJ4l/WJfP2sXnKr6UjjlHnLjHq7r5pk9vkbw+uU1Q0AQlZP7NAZpjXuSfS0/azM9H1+eI2ldiNN3hOmzEuOp2e8WUjB1NvleT29fUrz+pZT9eRWKAu0do/JHmG+fj4fL3CsM5EBIo7M+2V4bFSZXBjEUwSghYjp48NOEUbPjzkZcbznh+kg/KQKGDCs4VHdVMrR32PGDnA3yBEUbz6M4AQrAk9NMx3zVswDeP70qrYhEhRKc4treVGqf/lVM0YGXMsK5+oXEMNEGlodxUa3U3PuGHyrAf10gwLUxBWJIJSa+2dC0V7Uss0yAszIoM/ghoiOWKE1qOa04OjFXBhuHiBrFOdj1VoZr5CZfM1mEj/Gra0Qc1ubHD0KX+T1hR9KQA5uSj7wmqRuNAf5pzb/RtRTvHBnuBnorW290neMQYUdiJhPqeuzots3omB18tmbXrEB8wgy8ZwnD9lNVc5OnjxcDEwJRIg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd32fe2f-1880-43e6-2d80-08d85e20d710
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 11:24:01.2721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pvkd8BXr6omU9PyuQHUdLri1qVO0Aj/4R6ytcFznfYIwSpVFluYrVcQfsqPYZDUrkW0PJH/Q63oXdIyZBhc0mX/bKtD45eWEEvBTw/W8wx/T/0RJ2zEtT6V2X3vB1ePA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3993
Return-Path: khairul.rohaizzat.jamaluddin@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

Thanks for notifying and the advice!
I totally overlooked these mistakes when I submitted it..
I'm sending out the update now.


Thank you & Kind regards,
Khairul

-----Original Message-----
From: Quentin Schulz <quentin.schulz@streamunlimited.com>=20
Sent: Friday, September 18, 2020 5:17 PM
To: Jamaluddin, Khairul Rohaizzat <khairul.rohaizzat.jamaluddin@intel.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] sphinx: ref-variables: Added entry for IMAGE=
_EFI_BOOT_FILES

Hi,

On Fri, Sep 18, 2020 at 05:06:47PM +0800, Jamaluddin, Khairul Rohaizzat wro=
te:
> From: Khairul Rohaizzat Jamaluddin=20
> <khairul.rohaizzat.jamaluddin@intel.com>
>=20
> IMAGE_EFI_BOOT_FILES created to help differentiate files needed=20
> between bootimg-efi and bootimg-partition when creating the installer/.wi=
c file.
>=20
> Signed-off-by: Khairul Rohaizzat Jamaluddin=20
> <khairul.rohaizzat.jamaluddin@intel.com>
> ---
>  documentation/ref-manual/ref-variables.rst | 37=20
> +++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>=20
> diff --git a/documentation/ref-manual/ref-variables.rst=20
> b/documentation/ref-manual/ref-variables.rst
> index 625a37c..8483e08 100644
> --- a/documentation/ref-manual/ref-variables.rst
> +++ b/documentation/ref-manual/ref-variables.rst
> @@ -2902,10 +2902,45 @@ system and gives an overview of their function an=
d contents.
>        The base name of image output files. This variable defaults to the
>        recipe name (``${``\ :term:`PN`\ ``}``).
> =20
> +   IMAGE_EFI_BOOT_FILES
> +      A space-separated list of files installed into the boot partition
> +      when preparing an image using the Wic tool with the
> +      ``bootimg-efi`` source plugin. By default,
> +      the files are
> +      installed under the same name as the source files. To change the
> +      installed name, separate it from the original name with a semi-col=
on
> +      (;). Source files need to be located in
> +      :term:`DEPLOY_DIR_IMAGE`. Here are two

Yet you have an example using IMGDEPLOYDIR?

(and there is only one example :) )

> +      examples:
> +      ::
> +
> +         IMAGE_EFI_BOOT_FILES =3D=20
> + ${IMGDEPLOYDIR}/${IMAGE_BASENAME}-${MACHINE}.ext4;rootfs.img
> +

Probably missing surrounding double quotes?

Also, it is quite confusing to say it's a space-separated list of files but=
 the only example is with a semi-colon in it. I'd just add one more example=
 before explaining how to change the installed name with multiple files in =
it (space-separated of course :) ).

Cheers,
Quentin
