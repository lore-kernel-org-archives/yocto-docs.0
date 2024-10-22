Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D201DD2C560
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 14:39:15 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.48])
 by mx.groups.io with SMTP id smtpd.web11.19860.1729607949662352273
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 07:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=Sb5C4sAZ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.236.48, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAO6ba3dcaaT8mTObmv44MMm0uvKFepqR8cjHhykq34JluATU1h5qFlrDrJiEQaaut8A9yDJA2nK07L7xah6R85U/uZeqr8MY1IXxYxoVhehEMpEtbwxKW4xB41QM57DlVrm0HhrKgHQm5yY9OzW9SL333C7C+Z+YiVdxQhNrGRm5mp9KFyRBgNp40uRHH8nlF23vRBfiVeEzq0sTeW7muGSHpP2ud39kR0AP8bZJ6VihHto4mVdTDWl0fv+5Oc+4VtIB7mEU7rEnbR4YXhxxnQoyecFewPxa/4xJu14DfesA9w6MIwDJ84ZfiRdZmG90arrqgOTqP2qyR8P8pV1ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZErNoY3KUwGeKM+soS7D9sFruhDwWr7uOxwUSmbNMZA=;
 b=v93FlE5xxEa89CC2m+whhnaJC13uLuKGBF9U90v1CB448F26Uf0t8np/GGK0t5HwlerHbZeB4e6GBlWSCJEG5OZLBvnPGPucVdTO5rjrtNyx+LRbIgXj5iH2RWQOp3oubH3sY6vi8jFgce4U5sjTRUPrHGpa5nBWAyelt8XUr67NMlqsJJCHY8d11YOQ5rXqxncCE1sE9M6c7doFFTawMfmvLC1qa0AkmOQT5wuJkoklTjVd4BxzYVVtag+S7UhVjsi7fKYX6SPlOgN4gOKSSFOqkA84++uKNeMZ5q7EZwdLdcLkCTwqxsxUeDg6KT5Tgc1SL5n2wbQaCxOoSdOugw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZErNoY3KUwGeKM+soS7D9sFruhDwWr7uOxwUSmbNMZA=;
 b=Sb5C4sAZzK79SxmeX0Zw8JC3c38yxbUCSr5RC4GHq6mBt4Cv+XP8KQGzYlorXvnde9ST+KxfHwYoMbsfvjF84Nyy/j7oKkKuOTjtW32M5/Xnc9dTzTOqPaBwjqxsdldXZYXifxMOLWfS6ueuJxP2/+VTETM51fFyQraC3Xt+wL/j/catpc2Ds8yYzGw4T2dh4G8XXruSX7kwyCwcE0+pKxaCxpN5Zdqd05u1XPWevbVcpbrO6xDi60vK5w3hEqN7myZhDxjS60fe1qkiqMNR8HCoX2xP6/ugoFuL0YpGmmldrn5W60Y8SlnB4+6NvpRy0Nk2JUKCa9IbXr9CJcP+VA==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 CYXPR12MB9426.namprd12.prod.outlook.com (2603:10b6:930:e3::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.28; Tue, 22 Oct 2024 14:39:05 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7%4]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 14:39:05 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Quentin Schulz <quentin.schulz@cherry.de>, Antonin Godard
	<antonin.godard@bootlin.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] dev-manual/debugging: improve gdbserver debugfs
 docs
Thread-Topic: [docs] [PATCH] dev-manual/debugging: improve gdbserver debugfs
 docs
Thread-Index: AQHbI80tYXjJ2hQrsEeSVXOAFYDvJrKSq2eAgAADuACAAAIfgIAAI8Jw
Date: Tue, 22 Oct 2024 14:39:04 +0000
Message-ID: 
 <DM8PR12MB5430C3DA2E9AB3EC2F7EEDD18B4C2@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <20241021152254.1745411-1-chris.laplante@agilent.com>
 <79f143c4-7d78-4090-88bb-2b0e5ec4c404@cherry.de>
 <D52BOKSQ5RMM.31B7I4X4AJMN3@bootlin.com>
 <fdc83afc-d274-4a90-8fbe-ef0717f099af@cherry.de>
In-Reply-To: <fdc83afc-d274-4a90-8fbe-ef0717f099af@cherry.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=2624dd28-e1aa-4090-b454-edf210ed55e9;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2024-10-22T14:25:53Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|CYXPR12MB9426:EE_
x-ms-office365-filtering-correlation-id: 930dd663-98ff-4b04-6a32-08dcf2a74752
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?GB8R8LYPrwxXO+FfI3n6xAUsdjiDSgt1zeKRrTPL5goaniJA5VdIieKZlKhy?=
 =?us-ascii?Q?9Bs3MLEfdlXh72nccBELJYutAU4JohCfQxGEaP3/EFYcj/g42s8zbbFYa57f?=
 =?us-ascii?Q?liPFxvUsq3NqoSp3Wm47BD+2EzFIf+haa6x0o2TiumGa5ZSvfVEk6ZNfqkHq?=
 =?us-ascii?Q?2mo5eMR6YAMx+1wqimcSqlI9XYaKIJHzW6oxZ4DNV6gCu9q+Z2mFay3aAFkv?=
 =?us-ascii?Q?Uxjm0oDx02G/ZzZoyz+hc/CGA6jsdCM8wVGTXxeQjhVM16wvOpc22cYL9bFN?=
 =?us-ascii?Q?egHPZJdkJ1CcISZY/TIZ9ZiMP1qT5Pou+CgrvSOhWO9KQ3wtINe/Ui0b14Gj?=
 =?us-ascii?Q?IN+Uj2UqSL2i3JXThpQPuAJVY/alJpqXyPcaQJPFha2fQqaGE+mvWqyALJ/A?=
 =?us-ascii?Q?+Y/tytaq1bMy4wYTlqfDQuxmOC4/fSCJm43ZAtp7/KtjJhhmKzv/l68hGa9e?=
 =?us-ascii?Q?JDGIQpJqArZ+TahgED+RYdqW6RajsFlU1ObWg6g2ksQQjp4Z6hS6E6iwPZ0h?=
 =?us-ascii?Q?nSareUjPY0hxJoTa0C7RFEa7AspH2xC4qVGn3nKoW6w9Fq5IKXaGu4pAlUjS?=
 =?us-ascii?Q?BAsq9KS5gG6IHpaPD5RAZhlHctCBmAypBJBly1t7TxYPGQBT/INxlpchBige?=
 =?us-ascii?Q?iXNhOOGT2gDAR3Vl6ZfGWrBHYITO4Gakz8egZqfxTNA+EKmBf5L1mgrP9gKY?=
 =?us-ascii?Q?XW5+G8ZR2I0YS4ha86Mveqtx+CEGxp+6wTQSFA2MPvKskG7OVz69SvGsuo/E?=
 =?us-ascii?Q?skU8WgguVPew4GJVDKF8M4Kkx6Da09nVSo0xjqHIPpyDk9fbKuiiws2rDqL9?=
 =?us-ascii?Q?6DIRX/Qh5/Hj2vw0Q10iLL0vceXZmMDgu56X22/e168qvBYK211WRM1p9jbr?=
 =?us-ascii?Q?K1PJ3TI/zCeFdHzenZ81mbj/zp/tqbvqXGxZbPUKDzxXJJF4LbLbcYm2Hlkr?=
 =?us-ascii?Q?RJgRRNQgs4s+LTuw3Ngrvg6zksxn4j9Bu1TkxmpCBEEaSCw+ayeeDJgFBh/O?=
 =?us-ascii?Q?Vf/7NtyJhwUJh+Q9vedf4wvycEth3BMyQlRCh8wa8ZCokTxKDwZm/4oO5f81?=
 =?us-ascii?Q?o5cQIOGgfSt8FmOUHKRraYrYCi13qQSqI/+SG3BZJoxyZAYKr4eQJRaXJTJc?=
 =?us-ascii?Q?VgWuyX3IQiaLA2XLAbSOfZvt7YI+/F4bbo2rx51fllU9b8VUXkniQSveWx3z?=
 =?us-ascii?Q?K4DvjBUJjSA9mUcactvQ1EYwUC17HDBSALKJQ0pjDJjfGyNKps3wuUK0A4FL?=
 =?us-ascii?Q?04w5MgTXXvyoRF6PkpP6sDKWqwc+k/MTgiugkRY2sQ3an6gof7X62kOLEc+v?=
 =?us-ascii?Q?VU8LGLoTJZ3y+ZCNmipKhREE52x+MS36HGC8K3tQKs3Ws3xO0nv3KptsyB+q?=
 =?us-ascii?Q?BemX7bo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?S3VJiNmrlQNRPaSu1aqGr7VBVwmm/Yhs9t+AsDzzwgaTln/+b3k2An3kpciO?=
 =?us-ascii?Q?Vartc8JWszIR2usKqIXJQ9RtMOkXgMGtzbzXPDbl7uo3dAf8qpbcNEylSBLH?=
 =?us-ascii?Q?W7vzKkpiwqoPhn2Bv0gylHytqmVKZQeeVK9IrN01Ltf5cykT3pkFiGCV+R7K?=
 =?us-ascii?Q?yzinSHGpIOogvXDOnY4sBZAXmgi64WAb2DyTBmS0oILKiI0nKLalUOqyKN12?=
 =?us-ascii?Q?3j18RWIO8Z1/SxocG0EhYkVyVVSYXcYzl/JhkBi4mPQT62QHcZ3DLz+xUwRs?=
 =?us-ascii?Q?yBosw790Yt4kNnGNx0MNGQCSPWKMQqp5h+8pBJIfqGDSCj+NP/Tzs+V4YAc2?=
 =?us-ascii?Q?RTCoYzgVgYxcMwrLwD3D8IdWV+nV23BFxhdrmSAkiGieZC6ltw8k3wAa7u+W?=
 =?us-ascii?Q?MBXB6ZTbCeJCRjPXbXP+8LylaU6iOBWVdW8yP8p9ak9iTgjXDWt8BeQtyBKI?=
 =?us-ascii?Q?rbjCuQuvu94bcN2cppO3LdKUjhWTv4t41XwsvYqhDQSIwJOstJhcE5RXiou5?=
 =?us-ascii?Q?SPKXrB7DyPj28245EIbJn0M3piQAtMl4eSkjPktnZI1yMy+haz18FmaeITtw?=
 =?us-ascii?Q?09fbfcgJ7t8U9VBo1Aum407UAceldqhU+I/bmH79r5aAlwN3nAiMXUho7n7o?=
 =?us-ascii?Q?rub/faE9mMu3G4PzcVts0wvIGbJNRkdrJxpZZrx7wWuF8RLCqWv0Bp7PsBIL?=
 =?us-ascii?Q?8fLQg7pc6t+hTH9pAX1rybgg49gxLz4ZyLMpj53JN1GwFwVihxPRJr6xQuzA?=
 =?us-ascii?Q?31N3fiLN+Kb1LaGeQBHfP2u9kPPNfk/Lrabl1M0JWDkGkhIZre+jlOpJGgWT?=
 =?us-ascii?Q?02oszFy5T8BdHKr2PwoRikYgakuuF4elbwJftyORte5LSJxG5wFn3/EI8YwN?=
 =?us-ascii?Q?4w0QyFUQL9RVNl5+LHeHEYm1WrFvE2JCTHuacwr10YjooxFWaawfSvpX4lq/?=
 =?us-ascii?Q?NIQki7mjwOgf2a3iZI5OEfVD9Pk56Ef5DmaX+c0FYFGU1k0BFrVXXeNnyF59?=
 =?us-ascii?Q?a5vUMci3lD2JNyFq09cO8G9qQ5+mEsUewC49jZns5vRo+oHHk+x9bGMug/wl?=
 =?us-ascii?Q?0yf6agI7YIa9gT6h2BSr3+tBexG1Ygf64aMJt3Lu4HQ8wX7D+CBmOwMVFLoY?=
 =?us-ascii?Q?8jCavsgoVg6jIUX/4SRX+Say4kLO4mdMSL+tbFJRVi2YMa1tmtbjo6iGlAOI?=
 =?us-ascii?Q?++PbrB7XnwGDRCUkdK+rkuOOFcpKWldfD8mf3ZoUQ7D3sNUd7nNzYgAUaYmV?=
 =?us-ascii?Q?NtQjDGkkRmKW94BlaVm2fEVw7XwNGQXkOhEMVWXJaCl6QQys1HTEKYdAeQz9?=
 =?us-ascii?Q?IPH4zZO1IVPS+ilbxFfzve1Pr3MuoKwLInYMYDGJuMAjz/Y0XSGwmbdkSdnR?=
 =?us-ascii?Q?GTcvNBU40hEMoptDfQFKipI7baE7e8sfwT468si1hbwumrb3RwkBQIWlxCAf?=
 =?us-ascii?Q?EsTjEfHwLsVM7IPnw+CuWM9apiTpHvtuifYr/1qpPqiBWQaYOWpXUugqxGXV?=
 =?us-ascii?Q?HzkFt14JLWdu+YNMm54LseR9c+mINo59/ydnOi+6/1WYfu+jn536H1DaJBjG?=
 =?us-ascii?Q?0OWXn56qDT1Ua2qGi1TJ1dtCC64woZKhEi2em4bD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 930dd663-98ff-4b04-6a32-08dcf2a74752
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 14:39:04.9459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1nNUPlCTs71wJ7b5rqTx+RJHL2R2i0ibf0JbsfNj4/csVY2677S7Equ0iwFH87qCo3zkk/hWh/MOSe2EQ1mkeiLtci4RWYSSuQTujth6aVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9426
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 14:39:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5566

Hi all,

> Hi Antonin,
>=20
> On 10/22/24 2:10 PM, Antonin Godard wrote:
> > Hi Quentin,
> >
> > On Tue Oct 22, 2024 at 1:57 PM CEST, Quentin Schulz via
> lists.yoctoproject.org wrote:
> >>> 1. Make it clear that IMAGE_FSTYPES has to contain tar.bz2
> >>
> >> Yes, but isn't it done automatically if IMAGE_FSTYPES_DEBUGFS and
> >> IMAGE_GEN_DEBUGFS are set?
> >>
> >> We have a selftest here: meta/lib/oeqa/selftest/cases/gdbserver.py
> >> that doesn't seem to be adding tar.bz2 to IMAGE_FSTYPES, so I assume i=
t's
> fine?
> >
> > I think it might be because qemu.inc adds it by default (not a oeqa
> > expert though :) ). Here's what I have by default with qemu:
> >
> > ```
> > $ bitbake-getvar IMAGE_FSTYPES -r core-image-minimal # #
> > $IMAGE_FSTYPES [3 operations]
> > #   append /build/../work/openembedded-
> core/meta/conf/machine/include/qemu.inc:18
> > #     "tar.bz2 ext4"
> > #   set /build/../work/openembedded-
> core/meta/conf/documentation.conf:215
> > #     [doc] "Formats of root filesystem images that you want to have
> created."
> > #   set? /build/../work/openembedded-core/meta/conf/bitbake.conf:844
> > #     "tar.gz"
> > # pre-expansion value:
> > #   " tar.bz2 ext4"
> > IMAGE_FSTYPES=3D" tar.bz2 ext4"
> > ```
> >
> >> meta/classes-recipe/image.bbclass and
> >> meta/classes-recipe/image_types.bbclass are the only places where
> >> IMAGE_FSTYPES_DEBUGFS is actually used, and it seems that we're
> >> adding the content of IMAGE_FSTYPES_DEBUGFS to those of
> IMAGE_FSTYPES
> >> if I am not misreading it?
> >
> > In image_types, the following:
> >
> >    fstypes |=3D set((d.getVar('IMAGE_FSTYPES_DEBUGFS') or "").split())
> >
> > Is an union, so if tar.bz2 is not in IMAGE_FSTYPES it won't work actual=
ly.
> >
>=20
> It's a union, yes, but that's why it'll work :)
>=20
>  >>> a =3D set([1, 2, 3])
>  >>> b =3D set([3, 4, 5])
>  >>> a | b
> {1, 2, 3, 4, 5}
>  >>> c =3D set([5, 6, 7])
>  >>> c |=3D a
>  >>> c
> {1, 2, 3, 5, 6, 7}
>=20
> c.f.
> https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdocs
> .python.org%2F3%2Flibrary%2Fstdtypes.html%23frozenset.union&data=3D05
> %7C02%7Cchris.laplante%40agilent.com%7Cbf8562bbfb1548b643be08dcf2
> 9393ec%7Ca9c0bc098b46420693512ba12fb4a5c0%7C0%7C0%7C6386519
> 62912305989%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC
> JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata
> =3D41m%2FAwTD9msyScku1ytng1IKYXPKbakuOSgpMFdLaUo%3D&reserved=3D0
>=20
> > About the other IMAGE_FSTYPES_DEBUGFS references, it does look like it
> > should add IMAGE_FSTYPES_DEBUGFS to IMAGE_FSTYPES, but it didn't
> when
> > I tested it, so I'm not entirely sure :/ Maybe this is a problem in oec=
ore?
> >
>=20
> That's basically what i'm trying to figure out. Should this really be doc=
umented
> or is it rather a bug that we should fix (and could document for older
> releases)?

The imagetypes_getdepends function you are referring to (in meta/classes-re=
cipe/image_types.bbclass) doesn't create any do_image_* tasks; it only dete=
rmines image construction dependencies and generates a bunch of "<dep>:do_p=
opulate_sysroot"s.

The code for adding the tasks is in meta/classes-recipe/image.bbclass. I ch=
ecked and the reason it works in selftest is indeed because of qemu.inc:

# $IMAGE_FSTYPES [3 operations]
#   append /home/laplante/repos/poky/meta/conf/machine/include/qemu.inc:18
#     "tar.bz2 ext4"
#   set /home/laplante/repos/poky/meta/conf/documentation.conf:215
#     [doc] "Formats of root filesystem images that you want to have create=
d."
#   set? /home/laplante/repos/poky/meta/conf/bitbake.conf:846
#     "tar.gz"
# pre-expansion value:
#   " tar.bz2 ext4"
IMAGE_FSTYPES=3D" tar.bz2 ext4"


One simple solution (untested) could be:


diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass
index 00f1d58f23..c7ad272339 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -400,6 +400,7 @@ python () {
         debugfs_fstypes =3D d.getVar('IMAGE_FSTYPES_DEBUGFS').split()
         for t in debugfs_fstypes:
             alltypes.append("debugfs_" + t)
+            alltypes.append(t)

     def _add_type(t):
         baset =3D _image_base_type(t)


I can test and send in that patch if desired.=20


Thanks,
Chris

