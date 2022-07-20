Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C092CC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 13:08:56 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.63])
 by mx.groups.io with SMTP id smtpd.web08.53676.1658322531519041418
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 06:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Ywy8GTPp;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.63,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeCeTXXbm8+xjc67mX85dlFc4c84i0nbViLjd8hhw3I/X66484dtegCL4prJCPD4k+C6hSbSMR6K4m/AXNcUd8tUsCFNSFI2HKsmY99irVOz4w3edyBeIGU110aA3sBW2vnBCQ+eIKvhFKDv+dsio3YXPt8gdhBBXYnOylv5PNHKHvLwEI1sMUxBnCT1/ZOJ9OAd1waeOXbUqc1I8zAlu3a849CDW63tPfN0nxuadUoLsxWhS5vqKiAlZ9fXRc61f82XgBRe1fBempbLKYQ9nup7G/TrAQWv5f6aiVjznqPXJj3Z5E8bv7+GKnTOa3vqvu8ouJug4Q6TAEjF5K7aAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKLMvMtUoblr8QB3R5/yHWOEpQRktQTeYCtmOO5kuQ0=;
 b=T0mRh1MCg3AbMVPiP4p9Wp/Fd2m5F2BDcIiHdXwpptRhxQtJaoGHjb4h8VFwIcu3SECldRNltiBlPZQQneuxTsq5VKT23S9/N8fyyhv32xybEmu0xGYM3cViWCmXKMHyM+8TVcng9qF16COjcpxJD0MG7JGVOvI3ZgeaWoU0CDOKx8siN+A03Vm33zKKJjDaaM/xgnQyUtzzg7Y/+dVGlXVlOspMEz+KksiQTU97HNMcSRv1rD9GBeschdtowEGjBjjB02sK4ZfVDY68iTwQyKfwxAEzIk96Su4b5aKm5abgF7stPf4FVO9vrMozEryDg2w/0oSrNeFWRqLtQkPW1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKLMvMtUoblr8QB3R5/yHWOEpQRktQTeYCtmOO5kuQ0=;
 b=Ywy8GTPpt6aBYYZXYI61/CIlzsLuar+kZjhtzBE8I5kpeGFQX1RPVu39tGSY6s2N1iir0Diz5Xq7SnvHZ6T4g40BvICgNOlaPGAHkDYRq5zqt53URDX0F/cpvEawweWEFC+2Gr46toaHQhjyBnyXD6RV3Y0scKbjsaVph+jibCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM0PR04MB4852.eurprd04.prod.outlook.com (2603:10a6:208:c4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.24; Wed, 20 Jul
 2022 13:08:47 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4%8]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 13:08:47 +0000
Message-ID: <91e02526-fd34-2858-30fd-aac9ef324d54@theobroma-systems.com>
Date: Wed, 20 Jul 2022 15:08:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [docs] [master] Pull request
Content-Language: en-US
To: michael.opdenacker@bootlin.com,
 Richard Purdie <richard.purdie@linuxfoundation.org>
CC: YP docs mailing list <docs@lists.yoctoproject.org>
References: <8d2564aa-adde-1ed9-b303-5572326d9733@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <8d2564aa-adde-1ed9-b303-5572326d9733@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9281ab8-cdad-4c67-cba6-08da6a50fb5f
X-MS-TrafficTypeDiagnostic: AM0PR04MB4852:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qEHdByKPKoGhNV0DGGHRbxNk+dyaplfesJEr74/Fq9ZepPdX1TW40b6dRzQEuHRJTbdmPQTkM9QqHABwEchGjUE6L/r873qHn1Iv1dcUkruNraX3+OFn26kHytxHMxf7n+GkdNoCsdfjAsfGjrOz9gbIdiqTggB7WrneK2CxyCGZrWo0t1gu2FYRvEDYY8wNEOhraaYWHTJ3fm3kBuLnr7S3g5j526fBKThEd/3WAb9Sfcukv++K8KVcMotRnINLvlsAWkz5zj7tUaKxNizGqIXHBkefzzLGjzMGWe/31nCO3LpSHFTyQpBg6J/bYu7G+a+54qX9du1gvAj4LgeTuPpCPsK8PypEsEMo75h/Nfhqh8dcrQ6Sizq+Gj/yqXPg8pYZtrPipi2EpijHmB6KO0TpLYdI0DuU6EtalTZbqybGZpAyRRnePLWsKvP5RveSrk8GmiwsVHyktxk34EhLLAAAdPUyXPypRNQyyRhzAQFmLJCX+Wi1cz4JVJ7Bo4XMNEJLmPBvZmulzGjux8iFPFqAsGIwsKWIp5DEzQ5rp+C2+H/dCu6b4HYAOY1XZszgX0TiD/Oon+tQeGFkw978Jqt/6XVnVU/6ESLKklxrPK7G+h2u2XrZSTeNB+UwmylWtxQ+7dTTj/IvfA8Eiy5bT3djtwJlIHDmSN6qDAJqief2ijiVyYUlhxY3Q7Qctzv5S6o87igIBAPjNby8lCdFDqyNkF8wYCycOWuhu00xycAh4Jxt59jLC5wraboJL6bu5MGSC9o21BlHc39bBBNOaA4QuyViz2EvXFXgLMqK16AhIi6061qeCAh/c7W+Hfnq7rEXuicFPq1QdZCsC3GqU6hSpgEw6fSF7Kj6KA+LP/s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39850400004)(396003)(376002)(346002)(136003)(478600001)(6486002)(38100700002)(41300700001)(83380400001)(186003)(966005)(31686004)(86362001)(31696002)(36756003)(2616005)(8936002)(5660300002)(316002)(2906002)(26005)(66946007)(6512007)(6506007)(53546011)(4326008)(8676002)(66556008)(66476007)(44832011)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g2ZOfJa7v9TPC+xOjbhbs+yMxEkkOeIEFwyix8wryd7V7yfsJx3qcGuLcGb3?=
 =?us-ascii?Q?58BzzzIGlGdjuNnOsvYbntpKQXfrKZDx2G4ItT+QiUdkwIdH1W1chTI3Xugg?=
 =?us-ascii?Q?3BHFhMVih5flXB4Lt3OcSq5jGDSTsdjFFBx0EgfNzxlN2yNZ1G4KgpIFZV2T?=
 =?us-ascii?Q?wf87QkQvj/cb/8ZDFkd4WYMu529ytiufFV/yI4X6zF2bSa9wScAKGREVt6ry?=
 =?us-ascii?Q?w6tFhc6+6Lo3Nmf9cm+/U/qj9J/1yQDcUqzGi8xjkZLHPnxjZ02j1bZuTA6V?=
 =?us-ascii?Q?HlRpcLaxrz4MaN5rdEHMLsWOulEu3PgmBu31Ek1PbW74oc7PLJSww9lWGBZt?=
 =?us-ascii?Q?hy4kLVQZUh2WltCuohwBMYzdGqVkYaeN5JVBPTocAStcDBVD6tcnqjeYBrz4?=
 =?us-ascii?Q?MmZ8UU8TUyHhL8l79KC79PdoVRGu+fA6e8hf8DVzT+9HirhhowIfWtdrCzcG?=
 =?us-ascii?Q?RcVYdhVE1BCf7N5lqC9eiRwdjunQ11rfHkMFU0AjGjpmAKN9Td3J7gEilJCv?=
 =?us-ascii?Q?vODlfutQydwLmi1FBdE0lPT2kvti6LRV1M1Hr7yKFXkJXu2vcjUY0oQgjslQ?=
 =?us-ascii?Q?bOprpo238k5knhWa1+uAXIdXPB4fDTwKG7Ghl/8yuQHLvgmSXSXFLgT56I3H?=
 =?us-ascii?Q?740kEYx5ctonyksu2daAIwOpSQIA9VIKU0ojhVDu997An3yXPB9hd2mR1jfx?=
 =?us-ascii?Q?zgO5eNa3No3WF5+gEBJHHOYLKFZEg3cPUzLEhlN1MWuVHpMMwN0Zfq6wgzLf?=
 =?us-ascii?Q?o+5ygqSjiV4mmP+IhsOgSRpKyypcR6AsyxDSWGaAfiNZPCKxh+w9Z8g+iRb5?=
 =?us-ascii?Q?13+N6ViupZkEfh/J1d9BUaRJ0xG8n2yMMP38KWla/dGuYTIJIMiJOQy9fAyJ?=
 =?us-ascii?Q?2horJLHJqoczo+3bsiSCqq7SDsHpj8A1iyPjTkcTFwhprMr3vd7J4Dc9SyDm?=
 =?us-ascii?Q?ezQXOJgmccDXB5SP/L0eKLQDX6loSnDRH8ById0+ei1syULfSkWB0j3jNma7?=
 =?us-ascii?Q?EBeJW1t2KpKNSRNa8fCAxv+c2fx5n38XIvZs5k8Rn4rqEUTgHXhlLLB3qDHC?=
 =?us-ascii?Q?VXgo1YfYW0XOEPbl3XB+4IoxAo7y285tLfjABwEGPMfs1kkELhzJksSD1s0Q?=
 =?us-ascii?Q?vigF98bwUV7damQFXXmE8Qz5ivS/2Y0gbr7vPlJdrJIRqau60qxRf4+Z0rvI?=
 =?us-ascii?Q?ymaXZJo3f2hQnFXrYdMSQ68p1zzoFZqL4MjA8P7NVP8ITjpsi4B2WOjai9SI?=
 =?us-ascii?Q?p4OswjSz8Brb253dbdVBXyykLbP4VJjLm0TUnEblzKAjNjPHmoY59ATjjj9z?=
 =?us-ascii?Q?hLhdgDVYFx58FGoJLxHTq+J/qt6WjSqhLq1J5PrGxNGvxcShwnhSW84in9S3?=
 =?us-ascii?Q?s+zQsfVdimjTX836tBb6ZRLQXCaMvn6jxB8O02tVmmGVj4+PMvH1fk5+kAD9?=
 =?us-ascii?Q?rccH6QxKUaziIAfvOkicDLFMUO0JUbDz1y7k+lGGSI7pg0nCN8o2gcQkSSnS?=
 =?us-ascii?Q?L+zcvO0vWY0WczBbH4ss8yfpEBeaK//nFLBFAYB+rWMXaQH8YNgXOSbMeZty?=
 =?us-ascii?Q?u/iKafFRANyYfbb9yw3VezNAxx8nTcF8/K8vpo6ZoxW2hpajTaMxMmJLYiL6?=
 =?us-ascii?Q?7tdmJQi5YdFoOqytVmCbk3c=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c9281ab8-cdad-4c67-cba6-08da6a50fb5f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 13:08:47.4571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cLc6dgQb4TZNGfFc/E6I2eGBReljIrSmVzPmGQPNTho4j3M9tFuP02l7+NTYS4O66NJ4NJut3gsfyt6unSin/9yd85bIQPs9RgbFJs1b3mIt/xVfI7wu7WUVKhmOk3G+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4852
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Jul 2022 13:08:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3078

Hi Richard,

On 7/20/22 15:01, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Richard,
>=20
> Here are changes for master, in particular the update of the hash server=
=20
> host (happening soon) and the set_versions.py update from Quentin which=20
> will allow to take his changes to run-docs-build.
>=20
> Thank you in advance
> Cheers
> Michael.
>=20
> --=20
>=20
> The following changes since commit=20
> afa895871e8ec18f4861f48f70b8a54cc2e4cb98:
>=20
>  =C2=A0 documentation: remove obsolete PEP517_BUILD_API (2022-07-15 12:30=
:30=20
> +0100)
>=20
> are available in the Git repository at:
>=20
>  =C2=A0 git://git.yoctoproject.org/yocto-docs master-next
>=20
> for you to fetch changes up to 5004957d1c65d03d3e296bc9f0a00982457a27f8:
>=20
>  =C2=A0 docs: BB_HASHSERVE_UPSTREAM: update to new host (2022-07-20 14:50=
:03=20
> +0200)
>=20
> ----------------------------------------------------------------
> Aatir Manzur (1):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ref-manual: Sphinx note directive for DIS=
TRO_FEATURES definition
>=20
> Lee Chee Yang (1):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 migration guides: release notes for 4.0.2
>=20
> Michael Opdenacker (1):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docs: BB_HASHSERVE_UPSTREAM: update to ne=
w host
>=20
> Quentin Schulz (2):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docs: ref-manual: variables: remove sphin=
x directive from literal=20
> block
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docs: auto-generate releases.rst
>=20

This will likely break the autobuilder unless=20
https://lore.kernel.org/yocto-docs/20220719081214.1924835-3-foss+yocto@0lei=
l.net/T/#u=20
is applied in yocto-autobuilder at the same time.

Cheers,
Quentin

