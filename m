Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.88])
 by mx.groups.io with SMTP id smtpd.web11.21298.1627632984109268548
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 01:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=RvZhwj/0;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.2.88, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPYU2KepGH8NZ8nElqwi7Tj5g+7MDdrj+QODIXBgtiqyHAgZyFmAcNjbb9LYU2/e9tWeepRtAVtAAIqNHDnNycHYKZ5Ye6Gdki0OyqmyN4j8LOz0/8uCli3pAd+vaO8b3SB5Cg13i4fL6F5TpBs1GEHOZOcOovyXOcclge3tH+CflIA24aC0edzz+8ivqgsUxvyPD0K3SFKOCkNZEYHSvocs7JYGkFQukOt8smOGuKq2U8IOJIzOdRn3v91+le3qd/itLRRKdHwVswFCpzRP0shN2GKyVkoY7rtjYs3DYRl5EokIVVsDLi8BrSDZDtrDDFhEbyYrbw667mC/6rnHJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgVvdlYA9ThTuiIT0+wskfVwiKubSYdwPgVaekdLYqs=;
 b=eEsnTnxBaLiDsK/llpcNk767+1z3IPE6GGSgtVymk8htCY9+FVvFkF/CrqrI4Mg5Ol4W0nci98OeL8zaP4ha4JP4z7ATrYk3ca7d2h+Njpt/HB2Xu3bC73UH/3qmveeIOzRFGiGgrriXW+ySlE6OJyamhW4Dz/Ba9Ws/XzntTkN4//AKoO3sskARUXu5K5jgrusulydzVkg/Uyg52Kmb5Fo548ojOLgQG4c1yxz0X81fmQ5+C/C8m29P7qD4HatcQwhoIVZMxAma20pPiVfFcV8VfBLL9f0fiRDVkNpXHju9/ihxrkfQBgp5i+oPF9zmlREPcdUaL6K/pAo23cVXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgVvdlYA9ThTuiIT0+wskfVwiKubSYdwPgVaekdLYqs=;
 b=RvZhwj/0zpHufDfpAN+RibomKkCaiiMky8Ovuhbtf13q4YzWXaBEGFAg7UXXp/hmQhK+JZTiI2v0W7stWlnj61WRAYXm7/bPWGZXnHuOZ9JM8y9l5d8OoeL5pdnb+plNg8yWiGjYP+i8CLJY+kmGZoQsRZ67UU/CKR1TJkZHt1U=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB8276.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Fri, 30 Jul
 2021 08:16:21 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4373.021; Fri, 30 Jul 2021
 08:16:21 +0000
Date: Fri, 30 Jul 2021 10:16:18 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: Add start of 3.4 guide with override migration notes
Message-ID: <20210730081618.bgwfpsbtzh7vcfuf@fedora>
References: <20210729220945.3333837-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210729220945.3333837-1-richard.purdie@linuxfoundation.org>
X-ClientProxiedBy: FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::16) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.10 via Frontend Transport; Fri, 30 Jul 2021 08:16:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d61907f8-89bb-4414-c466-08d95332504d
X-MS-TrafficTypeDiagnostic: AM9PR04MB8276:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB827651C7DF15B904825F14B2C2EC9@AM9PR04MB8276.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+dPyHmGL3litEsKEBRSJ37qS3UP2qjzEqzA9mzJE6nmLPF7MhMYNbxA5FOO/U4dmVi7XX1NzfXIOIiGJYFLAXB2qWZnAj3i/8d4ZGPnKDDNEFy/nIjHRxI0wmxSwHSMNAnzlYlLJ44i5o+hq5SNWqh0DrHrtHwiDylALaDfm7f1QDCqWkitueF1w0c6IXvvfCc1qtbGPt+D+V3MZldHFEU7A7/Jsk+NFvZiY8uMA9CuLGci/kqVoxQLblfC3KLxCYInEuq1IZarUH1G2DiJF3zlrNDpEx7LvNHXka+bjRLBYfbvct0rSLeei64c8GsUKZCZWMzwci1Bn9rwOVrIow3hGJ6z5jODG0JO2S4mm0wdUQTIUlRADtOdm5wt/UhhyWIX0eiZNjVEUxo4kvFFwW3RzgtjEvi0zf63BJxHcTvlDOeJEiUqViomzTyHOckhGr5Z0ULNUBLujp5VJoo2ezIXw2YX4jOmHcExuc+98yK6DgCeBJbzmQUai42/0ZQ+4L+6wQ2mWpbCnN+Uu0AGuh+ZSUu02E+oAiAN0WgbA40ndPPqUMkGXDQcn6if4K544UiBB2WWITwMA8BV4wFVQlbKRAL0+7pYRQC+O+tLZwzW3PZ5/i+Jw3iLQiUuIe8cJy+PPI8P1yoLXjspJSUg9+ibmqs0VYLOMr4nrQ2Bry6RLHVeyU/YB7haIpWuOm7jLjN44POY72iCkKOLB1hGXvA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(376002)(39830400003)(366004)(346002)(1076003)(66556008)(66476007)(8676002)(316002)(9576002)(55016002)(9686003)(86362001)(6496006)(33716001)(44832011)(8936002)(6916009)(478600001)(66946007)(52116002)(2906002)(38100700002)(38350700002)(4326008)(5660300002)(956004)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5OSxeHT8XT7+L/d//N8k2NagCadO16zUpz8MMUvOzBfn+EFefFGNSTXbCiA8?=
 =?us-ascii?Q?c/l2p5GVXv3bq65DrygTdN5qePrZYuA6DWk1J7PdkQzp4iB3dKwXAVeXh7f4?=
 =?us-ascii?Q?v+XQSAPm5edbQa/yAnB9pxGM2c3F9d+nfU76f4tGVcgYl7cUQ3AEeVqMj65+?=
 =?us-ascii?Q?SQj5KV0MaORf93DvDria3ZShNV3NzyDEhosCrFvdiTYloTMRMURXvShUY9dp?=
 =?us-ascii?Q?7d5Ht/48QTGBgCZTXoy3liSIgmcVgu0Ob1cndEYDpnsiTTjKbgFK9LQrZrZN?=
 =?us-ascii?Q?7nMKOmrFJXI+Hl34rHPhwDsOQiXu5XuCbjSFqCW/nyNisYBTsPAN662eAMOU?=
 =?us-ascii?Q?RNTSKXN9keQ2Y2dWVSS80uRHBrx+9luzw27N3rm6Axfc/q/4EZNYp96Ko3nP?=
 =?us-ascii?Q?0TCGrObKjxhA/aTLmArn2VGHXYzGFy1clXO3pSuQPLer0XDj+hITL3gESKFH?=
 =?us-ascii?Q?aDZBNwb/zgHtYVwhhlJCd8zIC0wLKEdrc5qYZtsTfrG449+8M/jas7ZAH+gy?=
 =?us-ascii?Q?yuNu6vCfbnIscL32QIxG1tvIy+3tAnmKszuaxpzlbTuE8et4fxK68lXx2RO8?=
 =?us-ascii?Q?191bDR3mtec/kZA5Fqh/8wCKeUjh5Hlw2GI4AxyY9vMOUH7CLi32hhTmI82q?=
 =?us-ascii?Q?VA1OMeASMwwZW4givQPmMDTK2qblADtIQ1a4J7VIVjKjvqZ8FMTM0ZrZN1Zb?=
 =?us-ascii?Q?QIEID20hEvPNwZyMKSXw+8/JXwoiS5PXmjSN1Tjoqjln4rKGH9vGDH5MuXpa?=
 =?us-ascii?Q?Faop06XzWCYQLCxpc2p3yiFXOpRDrum/OsBI+kMRBxjHnoBX8Of+RnOQaj9M?=
 =?us-ascii?Q?O/lE/Sb8W0bEgPKliLQBk8VYH4JQtA/tjJfuXsmpFETdH0E+EEwWCO6iQjcQ?=
 =?us-ascii?Q?aMPjunFBUHxXS9KdDzI4+YMr9XHhDV2xLHWIez0XneZiYwqZFku41cPjyOtA?=
 =?us-ascii?Q?ZFnWD62gF1mxqy66bkxKykh/djAXlbOJ1CWGqxxCE52IIt0B6+wk4Swu/jGM?=
 =?us-ascii?Q?I8IF/SiYixmjzaQKDMihuB9Eh8kFnCrJRosjZxCUDTd0zsbgp4ybScTNKdIl?=
 =?us-ascii?Q?wzeDUSv9HQHyO5eX9NlLxKgp31HghQqNyOoxWowMD1HL8/EAa01fuw4Mv530?=
 =?us-ascii?Q?RPebp6BEojlwW0unYJyGnsZ0npVU/qVRL3a+8Xy9hNLtdSbUSJ8oZv1Vf2eP?=
 =?us-ascii?Q?3Fl5JiEzWGDWfeIg68xaWbbBF3ToQVoumFBVjPLvnNdjYxAiJ0kbuLafTMUW?=
 =?us-ascii?Q?EIcljlfZoHWedpmWNPFsx7BkowhrLDh/PIeHhwu1soaf7jOfM3UXnkS8lKm7?=
 =?us-ascii?Q?7dlTJ6N6au0hjM/wiPBAN/ji?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61907f8-89bb-4414-c466-08d95332504d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 08:16:21.2268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1msKkJkHVP7zoS7JtzgPKTgEfdZYpBqKZUJj7UVFd7Uv7b5Qma8RoGHzvHq7ABVzbXZz4LJ+ETR15AIsyX3kVRn1O5lSwJ3DnOMB7Fex7a6ZIpjH6/trFQDZhh1a7Vjr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8276
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

On Thu, Jul 29, 2021 at 11:09:45PM +0100, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/migration-guides/index.rst      |  1 +
>  .../migration-guides/migration-3.4.rst        | 72 +++++++++++++++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 documentation/migration-guides/migration-3.4.rst
> 
> diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
> index 6304e6318..287b55319 100644
> --- a/documentation/migration-guides/index.rst
> +++ b/documentation/migration-guides/index.rst
> @@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
>  .. toctree::
>  
>     migration-general
> +   migration-3.4
>     migration-3.3
>     migration-3.2
>     migration-3.1
> diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
> new file mode 100644
> index 000000000..45ce38cd6
> --- /dev/null
> +++ b/documentation/migration-guides/migration-3.4.rst
> @@ -0,0 +1,72 @@
> +Release 3.4 (honister)
> +======================
> +
> +This section provides migration information for moving to the Yocto
> +Project 3.4 Release (codename "honister") from the prior release.
> +
> +Override syntax changes
> +-----------------------
> +
> +This release requires changes to the metadata to indicate where overrides are
> +being used in variable key names. This is done with the ":" character replacing
> +the use of "_" previously. This means that an entry like::
> +
> +   SRC_URI_qemux86 = "file://somefile"
> +
> +becomes::
> +
> +   SRC_URI:qemux86 = " file://somefile"
> +

Is the leading space here on purpose?

> +since qemux86 is an override. This applies to any use of override syntax so::
> +

I'm pondering whether we should quote or tick quote qemux86?

> +   SRC_URI_append = " file://somefile"
> +   SRC_URI_append_qemux86 = " file://somefile2"
> +   SRC_URI_remove_qemux86-64 = " file://somefile3"
> +   SRC_URI_prepend_qemuarm = "file://somefile4 "
> +   FILES_${PN}-ptest = "${bindir}/xyz"
> +   IMAGE_CMD_tar = "tar"
> +   BASE_LIB_tune-coretexa76 = "lib"

s/BASE_LIB_tune-coretexa76/BASE_LIB_tune-cortexa76/

> +   SRCREV_pn-bash = "abc"
> +   BB_TASK_NICE_LEVEL_task-testimage = '0'
> +
> +becomes::
> +
> +   SRC_URI:append = " file://somefile"
> +   SRC_URI:append:qemux86 = " file://somefile2"
> +   SRC_URI:remove:qemux86-64 = " file://somefile3"
> +   SRC_URI:prepend:qemuarm = "file://somefile4 "
> +   FILES:${PN}-ptest = "${bindir}/xyz"
> +   IMAGE_CMD:tar = "tar"
> +   BASE_LIB:tune-coretexa76 = "lib"

s/BASE_LIB:tune-coretexa76/BASE_LIB:tune-cortexa76/

> +   SRCREV:pn-bash = "abc"
> +   BB_TASK_NICE_LEVEL:task-testimage = '0'
> +
> +This also applies to variable queries to the datastore, for example using getVar 
> +and similar so d.getVar("RDEPENDS_${PN}") becomes d.getVar("RDEPENDS:${PN}").
> +

Probably would benefit from tick quotes?

> +Whilst some of these are fairly obvious such as MACHINE and DISTRO overrides, some

s/MACHINE/:term:`MACHINE`/

Ditto for DISTRO.

> +are less obvious, for example the packaging variables such as RDEPENDS, FILES and 

Ditto for RDEPENDS and FILES.

> +so on taking package names (e.g. ${PN}, ${PN}-ptest) as overrides. These overrides 

Tick quotes for ${PN}?

> +are not always applies in OVERRIDES but applied conditionally in specific contexts

s/OVERRIDES/:term:`OVERRIDES`/

s/applies// ?

> +such as packaging. The task-<taskname> is another context specific override, the 

Tick quoting task-<taskname>?

> +context being specific tasks in that case. Tune overrides are another specialist

s/specialist/special/ ?

> +case where some code does use them as overrides but some does not. We plan to try
> +and make the tune code use overrides more consistently in the future.
> +
> +To help with migration of layers there is a script in OE-Core. Once configured

Add a link to this script whose text is "a script in OE-Core"? (I know
it's mentioned below).

> +with the overrides used by a layer, this can be run as::
> +
> +   <oe-core>/scripts/contrib/convert-overrides.py <layerdir>
> +
> +Please read the notes in the script as it isn't entirely automatic and it isn't
> +expected to handle every case. In particular, it needs to be told which overrides
> +the layer uses (usually machine and distro names/overrides) and the result should
> +be carefully checked since it can be a little enthusiastic and will convert
> +references to "_append", "_remove" and "_prepend" in function and variables names.
> +

Pondering whether the one (or two) paragpraphs above should be in a
..note section to highlight it.

> +For reference, this conversion is important as it allows bitbake to know what is
> +an override and what is not. This should allow us to proceed with other syntax
> +improvements and simplifications for usability. It also means bitbake no longer
> +has to guess and maintain large lookup lists just in case "functionname" in
> +"my_functionname" is an override and this should improve efficiency.
> +

Thanks for the patch :)

Cheers,
Quentin
