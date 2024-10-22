Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFDECDD0E2
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 19:59:22 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.72])
 by mx.groups.io with SMTP id smtpd.web10.3501.1729627156023812156
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 12:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=bADpH0L4;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.94.72, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ptd+swa9tiqjvbbr/6o4FWzhSs5Tvr/iM8G4eP8EvRVVE34P2kiz1/rNMO7/46ds1AE8ek4l46V9fFYWIQLTh+UWfNeNf5FrYKBewzHX9NJB6i2J3cfTznEsCOA4Ha75PkU9b6Y/nFvQDosnY4IocHfWkEaC9lVN/c5xID9jWw+CtxHPXtyHdH+u1TeeYcmR1WKMS/iF0iUJhguaws7FbTFOzWJ8K6SUehTrszFvIu3XLC/WybOb+7LWy3x9vRI+Jk7FXJtCPW8dT9XMYJedP4eKbQ+zOR+pcSyqndJdWqz+lHiQCOtinhXZA89Sq8ErFmRkOUXullo06aBTm352Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAlVkpQRhON/n0RYIo3tTg+L6Nb6avO9xvj9sGPDQ6M=;
 b=CP9LITN3Vd25l0peWI+kr/3rDFsaC2pkyBWfHN/LpHqei4gWSQGo1T6hzHpOsmsKC3HiqCahShzlLmgadsm29X+eI6wvc7Ue84I9OyCxCyN0mzKpk0CD+AF2vsdlbXGLz26Vzk6njWqCUBXwhkSkg+EEbnN8UX8yQ1C6byV7U/4jIJEO1+hTeCCtyKVA8hGU0cQlYQXktXlhSIOuk/CCoZihq7ijDUews8a5UpXS/MTErCpqF2HwrTXvUTAfKPa5RLQsQN+lYJxxSzheJSl81JK4QwFUTfwToO5Y0ESRbSW16EI5htqHx+E4MSswgOhAJe/CppwBVEy+7SbvPNMJbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAlVkpQRhON/n0RYIo3tTg+L6Nb6avO9xvj9sGPDQ6M=;
 b=bADpH0L4t/r3+YLtkqdzcCx2sEhRR0ai4y82FYA1b4MM6Ao15EcOBBVLEgB/f9iaz6cG+jHSa5NfTqFYQIBIUGhmPidpIxcRyBS72rSzarL/rqA08p1jlANhopWDgLGS0uLUM18VpY+CO7J/xEkxu5VRqSoYEpjIxTUbujftEH+GgznkFpaiQKgKaLJJFUqjsyAGk3FG2wmXIZkbH3G9K228NRwp0k7mQziNHGB39KbVo7IWXWp/jtBuzUP0HGtAeq2cAomwUkAHgUozHJtShIvfevKTRpT4iA/8jNUHdH/eYW3BCVm0C6XYmdVAvNOSfZXZ60tyfX1r8d2RnbBjPw==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 DM6PR12MB4282.namprd12.prod.outlook.com (2603:10b6:5:223::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.29; Tue, 22 Oct 2024 19:59:13 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7%4]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 19:59:12 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "quentin.schulz@cherry.de" <quentin.schulz@cherry.de>, Antonin Godard
	<antonin.godard@bootlin.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] dev-manual/debugging: improve gdbserver debugfs
 docs
Thread-Topic: [docs] [PATCH] dev-manual/debugging: improve gdbserver debugfs
 docs
Thread-Index: 
 AQHbI80tYXjJ2hQrsEeSVXOAFYDvJrKSq2eAgAADuACAAAIfgIAAI8JwgAAHVwCAAADC8A==
Date: Tue, 22 Oct 2024 19:59:12 +0000
Message-ID: 
 <DM8PR12MB543072BAD5BA35868587B8568B4C2@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <20241021152254.1745411-1-chris.laplante@agilent.com>
 <79f143c4-7d78-4090-88bb-2b0e5ec4c404@cherry.de>
 <D52BOKSQ5RMM.31B7I4X4AJMN3@bootlin.com>
 <fdc83afc-d274-4a90-8fbe-ef0717f099af@cherry.de>
 <DM8PR12MB5430C3DA2E9AB3EC2F7EEDD18B4C2@DM8PR12MB5430.namprd12.prod.outlook.com>
 <aad1cebc-3424-4a9e-b9e1-4f60d606c24d@cherry.de>
In-Reply-To: <aad1cebc-3424-4a9e-b9e1-4f60d606c24d@cherry.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=0be32dc1-6674-4e73-a86a-afe997968133;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2024-10-22T14:54:53Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|DM6PR12MB4282:EE_
x-ms-office365-filtering-correlation-id: 48841c6c-f388-42c4-7077-08dcf2d4001e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?AB2JC/fr3Gq3j4W60jHyHDID+QBhtqTswww4LicGeHE0Tswc6fkNEdpnG8fy?=
 =?us-ascii?Q?Ny0V1bJ1kjmYLkfuPVNsVsxsjwyeHedxzWy/38xQm/f9dnWy0xuWaTYPI5M3?=
 =?us-ascii?Q?fUMW+LsKAdviPo4fdmv6i5Tq8yHfEX+rs5hgte8ghTY4eJGA4pKhTT9lholm?=
 =?us-ascii?Q?Srqk8UiEx1FaaO0h2iKd/KrA4L7xngqmdjVBzzCv1JN0ni5xON80U4+vFD1U?=
 =?us-ascii?Q?ZS2DX7N3WLrJwcoeZhi8izDz9ZJivYsHCLdfDAlG26PSVoiKcvvYwmgPXj+6?=
 =?us-ascii?Q?CBpBSPwFPCfXxftEcC3oRbFP5kyHsPkw+U6pDwK08mx5FrFyo/gMo61wFoho?=
 =?us-ascii?Q?ySGUXHWPYFUoFBKt+JsUbs+fE7C79L6H2xIBTNXbtWJ/4u2spXnsl+SDMska?=
 =?us-ascii?Q?9DW56qykR2qTWIn7LG6ldB8twvEWYlqbYPktZ4g63D44enI2jXlLbrUnTsVz?=
 =?us-ascii?Q?p5xqTHra3fuRgjJBAqv7OtVtx8gX7kE7+yIwNKxasfz5XaaIfnu0bDk3VWXI?=
 =?us-ascii?Q?7AFyjc1h7qwleDvzU/ZxNFLGaFx7KNOstm9wkx0cbixE1uGbvl9UDieyG42b?=
 =?us-ascii?Q?5bbUxB7EpEsCUkCT6tTfoFGahfp2lUi8XO+daYiYuBXAha+rY19EL/KF++5f?=
 =?us-ascii?Q?AFO3KL2d7oDurcE7fyIe5EjCBh3fxrAHrl27hHERN9Mwze/7RtBnL/NFWkM/?=
 =?us-ascii?Q?W4sUdrABPy4LPsjEpvC9vkg8Fh/MdVZsno4rsE8PEU/4v+YWgeHCBeHZTdjQ?=
 =?us-ascii?Q?fIc0MTWwuQN7hKQkD6q0X39W/cDPeFgP5dbB33nkYDvbEXufpaEpyJFv4GA0?=
 =?us-ascii?Q?LopUYnQX14XqByy1W/Y8xU3bdk395ubJHwCJYhgVqK2sYg6E602Fo7dSBrds?=
 =?us-ascii?Q?20FtqFvhT500iJ1f305uQc7vYrDgHqcV+YVIv4Sh+w1L/behF8M/eoVNXb8K?=
 =?us-ascii?Q?vjlMvyrwAhUkpe1ECvFuXvxnQV2BhGxfQWs8bXdIrdeBH8hrPh3hMayxh+et?=
 =?us-ascii?Q?TLFbUbTFvcNL+MYKXzGR2H2h3KJexs/RCImnAEE7kiUYKMz6PmMygbiSFZwa?=
 =?us-ascii?Q?3i5uen4Mwcg+3D3stYf5GVblafwHzQ/D+KtXjCzxbxoweRMq/7wQtjaQp4LZ?=
 =?us-ascii?Q?olhUK3z64izYAaj2D5VR8PgR6PJPx5yI6dD36t7rhrg8lsZkA5aFqxx21q+O?=
 =?us-ascii?Q?lk7E5dXAFBW/J4L6eXtWXrfl6nJvUwJgXcvXKDAQu5VvmDntltqM+GLkGrtq?=
 =?us-ascii?Q?R2ia/iCjdccW8ypvceO38gBxo1RY9cH8h44kjn99EibmeEFnMd1BN0K9EBIu?=
 =?us-ascii?Q?D4JWbrb8XYyapXwimA+7in9UPml3xugN8SrNR/pPuJTaDLMPbvfsGCvcIS4u?=
 =?us-ascii?Q?ddhSlvQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?y8MgToftIfogimQ7P4bregNzz4A+c2W+85V9vlEIsq/+gV/jfdzx58l+t2G4?=
 =?us-ascii?Q?Xv0FNkBsWNPaZ2Kdzuoc8CK5Hr8jIRy/qh78YlEVemGE9hNq4uVQo5aqvgXX?=
 =?us-ascii?Q?X/rDkpLh9fL9Ni6iGZCUiMzW01+leUWxCvJkDy8q53S+lHDCMakI36Edze3J?=
 =?us-ascii?Q?USEWVEknqWhMCODoa2jPrb8R1LGwQTyEe6mKoytJV1b7VxKJP8VVRMq+UVV9?=
 =?us-ascii?Q?IrUwd0G16pOplPluijf4ygsEhFNNAtdrIOdc+/BXL6pldA1x+h7Rnees0h46?=
 =?us-ascii?Q?CVYcjzgHraPgaxKpMzUs9GLu9IhTTUbu6dr2+3t9BOU4O1qAj+apbbbCvnv1?=
 =?us-ascii?Q?mCcJZJriLl6Q6nAtua1mFKErtpMwhK0zKsh4cFNF+uSqbelsrnFHAQhRAcM0?=
 =?us-ascii?Q?wFBNy5W9qfLiVlQdhhyPWfy4h+ioeAgIM8wHJ2uaKlXlMNg/5+rf7cyEsbwC?=
 =?us-ascii?Q?21W9cctV4/7XtA4NPy+mwsJbq5CaSxCS1XYkBEa8NQh6oiMLzbX9OKt+D7PF?=
 =?us-ascii?Q?qBXbi0baHDFklC/ZQ81cIu+qf4Iek8CXpoiAdbTB+erCzrG3zJykwt4PYRer?=
 =?us-ascii?Q?al4sJQegeucxlpPBi/q85msfM7rQer8cBiJCxXtJftpTx7dhDT+7nqnQc74p?=
 =?us-ascii?Q?M4sRrNVCLGPgrsg26e1kOKb+ENeDikCMnCA8UgWQW5ecOZ12gjV9LaDw4s4n?=
 =?us-ascii?Q?NhftasYjR21GkrTHFibtfXR0aoKDfwTu3i1sQl/xa+AyTu2e3ENzkY2hSGjc?=
 =?us-ascii?Q?KvP4P/fZAZRVRy0Vo+FP9qdYDMQPuoQbsBB3m2IV82gJI/xKNxkpQumy83dZ?=
 =?us-ascii?Q?zwkCzKXoad3hp9Zrbt+s6Gw4xWh0dXM85NG7K77rO09QYwYcUIAJ99AXMv+r?=
 =?us-ascii?Q?w/Pfkioq1b4mIX4BgEl9kTylW9a04MLQnaE3sK8e05sMIXLBjvti+UIJ7XdU?=
 =?us-ascii?Q?swRk9SQ+t9dOAV3s6u1BPkheH8BapUBh1JzKr/xTACmIXnXyLO8RsbsxxnWe?=
 =?us-ascii?Q?eGovrGde9UaU83UET/+iqx3N9+UuxWOUxdhuhSYgzDir7zq+CJkKr9hNP1dB?=
 =?us-ascii?Q?HO8mK+9G9NLhUGATodZosZvmh1qYvQWYO2tusXunQZMWUjeF8a7oCJ+DdoSd?=
 =?us-ascii?Q?jMXtjLCOBqYeBq82IAYuU29c5Tmv5e5DuDzx+ZE7WCAU6VexNFi5CffCASiC?=
 =?us-ascii?Q?aZbVOE9Jg72iMNXF/trHnQeVF0eucJAyHqC2YhFCk95AfhiC+ecl1/WETCD+?=
 =?us-ascii?Q?ldAHZp9L1Fnzef3Dhh5JXEhPMzv5Xh7Q/5WQdgoE4zrICCB8fVV9cR9OmzVS?=
 =?us-ascii?Q?zv1fUmWcUKCWEv12hi7ovsTUKnp3yv0c85p8lgbYNSTzfZfBUWAENEAsl+nt?=
 =?us-ascii?Q?d4qeFvlonRr9HWX9gkDRd6iSApJCGwJPeOAJ5DV0icuTXiRPmHiun6dU7tyi?=
 =?us-ascii?Q?W8QFJftdXHd6rH/mE8YIm4nF94O2a8HIfC/1LHgclsnCfohzK1qyG4NJYzAf?=
 =?us-ascii?Q?US/YOkz62cDxE+jj5t5LGinwtyt07YFCIK9xJ9uBklCM8oVS8MH7MgxxE9Qq?=
 =?us-ascii?Q?h0oNHgkdy40aKdazjsxf/0eF00nOkEJyggb/Ctxc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48841c6c-f388-42c4-7077-08dcf2d4001e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 19:59:12.8626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N7r5DKb3Dp8xVffHrOCkazKZlVBnFUvtmhqOQSi+eQq3t/vuLo6o7rMlDqGWCTOz4JdGB9LKuxysUcXCOQ/nIZ27RfdGOas4Lrii3JAHQHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4282
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 19:59:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5570

Hi Quentin,

> > One simple solution (untested) could be:
> >
> >
> > diff --git a/meta/classes-recipe/image.bbclass
> > b/meta/classes-recipe/image.bbclass
> > index 00f1d58f23..c7ad272339 100644
> > --- a/meta/classes-recipe/image.bbclass
> > +++ b/meta/classes-recipe/image.bbclass
> > @@ -400,6 +400,7 @@ python () {
> >           debugfs_fstypes =3D d.getVar('IMAGE_FSTYPES_DEBUGFS').split()
> >           for t in debugfs_fstypes:
> >               alltypes.append("debugfs_" + t)
> > +            alltypes.append(t)
> >
> >       def _add_type(t):
> >           baset =3D _image_base_type(t)
> >
> >
> > I can test and send in that patch if desired.
> >
>=20
> We need to send at least one patch.
>=20
> Either this is the intended behavior, then I would recommend we make the
> selftest use a different fstypes than the one in default IMAGE_FSTYPES so=
 that
> it's explicit what needs to be done.
>=20
> Or we fix the missing fstype(s) from IMAGE_FSTYPES_DEBUGFS by adding
> them to IMAGE_FSTYPES automagically. I don't know if this is desired, Ric=
hard
> would probably know. If we go this route, I still believe we should chang=
e the
> fstype used in the selftest to use one that isn't in the default IMAGE_FS=
TYPES
> to make sure it is actually added by the logic.
>=20
> So... don't know how to go forward with that :/

Personally, I think it should just automagically add the corresponding type=
s to IMAGE_FSTYPES. Definitely agree with adding a test too. I'll work on a=
 patch series.

Thanks,
Chris

