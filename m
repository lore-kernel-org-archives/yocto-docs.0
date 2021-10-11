Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98097C433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 13:20:11 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web12.11554.1633958409456376423
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Oct 2021 06:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=HNrywbTz;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.46,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAL4eV3l+bV1kn+ozfQvxqcTXOrJvgDEc8srnq1+pz+/dNCSyQJlKL6pvMEXpUfLaFBVAC6GYYoUJrzyBB2eMKKQh1/ABThwI9b+yJzLXhvA34fVhW1ML4b9SK2H6gTBZi1gGTqAiJIDFoUdkYLmZ0fa+/00+igr0ASETj3sgExgrrJuGO8vmHiosenL8tXpYamUf4JGoSy5ElYXJ+NHQVq9KRRG7RKJGrtHjEcmwocN/mjOG6USuBP+xuQnSvPwvYtHggNHFGocIz6MJz/xLHYq/S/KAXEDPQIEvlxZAlzOtGes0jibHz6taDpTRSsQZGMuqfH0N9lPHLKg0pOgoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMnzXFmYo3aB97IWDwjU+k+Eg4Wi/Uyss4Ac185esvM=;
 b=CixweRZMuTbOd56G2HsBQvdvxaIKPLRax3aVWR7dALmA7MTA/jDL7S0cibKMqkPq5/oayR50yKVCiJnpOQbT6IBH4SAPjyWTYpmWcY7HEQwcn4SPt4SAWaZLjf45Vx5+3i4ldsliN+txpi+ra4fDPg1+ppQd21y8snpSbXirYg4QxA8cKCAmpQNXvFY68xf2SAlZYDRAgSsAZSkVfMmQXvC0+BgPjuSUSfwhwAgndKnUVy9kL5bcpB1jhMt0T2XCi389+kbRLFLIFIvaT/uPn/S2+5mlA8MlQmsiujSRgDxqSIL6PIZ7Yq2Ew/boA2Tok4ifkOWpxO/3e1FItMd36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMnzXFmYo3aB97IWDwjU+k+Eg4Wi/Uyss4Ac185esvM=;
 b=HNrywbTz0pTDlDOB9bPsy9bpe00dJiCKO4rrrF/rTOqPZmd7i62SZSYTOVwFvdZ37qhZq6RIICpVqAgiZbbBI2/eH14YQtt7ZdBXJdLU/c9ATHt/D5iGIk9dhbAXHXCrYpGh622WnaW9mjSyXbC4XUrDcFU2nOjcoY5yEBOljws=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB4817.eurprd04.prod.outlook.com
 (2603:10a6:208:c2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 13:20:06 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4587.024; Mon, 11 Oct 2021
 13:20:06 +0000
Date: Mon, 11 Oct 2021 15:20:04 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [RFC 1/1] Start of documentation standards document
Message-ID: <20211011132004.n7cwcmzuc2qaqvzs@fedora>
References: <20211008185850.1032542-1-michael.opdenacker@bootlin.com>
 <20211008185850.1032542-2-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008185850.1032542-2-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Mon, 11 Oct 2021 13:20:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dd5a9a7-e0e1-4d7b-d984-08d98cb9d789
X-MS-TrafficTypeDiagnostic: AM0PR04MB4817:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB481776BC04C899A1E97E3580C2B59@AM0PR04MB4817.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wxAAoMh1AKcSf/O1ZiFAgeMQ4/28pX7vxgHs5WqOR1tliWVLWsNP1b2jt3Zs+2m8s+lG1sd72r/cJ0nrHSxkalom+vJkVmjkmbKKik3kNNvRkILXtBO5IvzNWC/aTL/bR6bS/e77qvIpoGf/EHHHuZkaYy5Cy/+roJwetF6r+8GUeC9cmfvJmQa7fS71OkS+SYy1BcV15A6H9k8GkPQZKWTWt5qHq7nrWreVOUYp2dhPU3qrTUu94M5+wifaabSCmFPiHFWXfUzdCQ4YK3g/nxcDxF/YImQ1MZ90th+eB61qUXnMKWvaJGCUWmJ7rEzcEa5KeYiq3QBMsAioCcu56haY7/mLMMXojr6r52C9YvCb70rrOb+VCc6DSgToz+w47rpVay7ccksWpBPjh2QAGsFCtFlfZ5JnNBQtZwCRdnyOO2xGwz7evltSAu2oVJqRIeOMDUJNWlBAJlHnh/zn6wYPz2lH4QLckLquVNlzhHwkX40/SbNtccQEEshOwLovGj52juuWfbOKta5vLEHNLHeQdpUGX+0+aozN5/u65Dx1UBFT6XjX8hUIJ4k0RlLsVFEi7ZzrbPMVY3iMUCTY8YXcGwJBt2daMkIGUgQN1UObrkNmSQIuEkLun4niCVVNebJ+GZpSOzc/dxOaIFQmT0jWLqPHVhK5eNsUcpi9ZLCDwyvaBTRVJOP9vDwNT2neFqC/y+RXjYgVDDWvUjLoloUn0bdPXguFqXXCnHQrptB1LkbZ1FQxuED527XZWX7ciACHAsMxJijfbIA9fe0rWw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(66574015)(966005)(66946007)(6496006)(316002)(66556008)(9576002)(508600001)(956004)(2906002)(83380400001)(52116002)(86362001)(26005)(8936002)(44832011)(66476007)(4326008)(9686003)(1076003)(33716001)(186003)(38350700002)(38100700002)(55016002)(5660300002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dddr/xRgkwGpoUJWyGiwnVtUXPLTLUMlbpzdQbBL566nSH4Up5S1GtEk3iTl?=
 =?us-ascii?Q?Lqb8gK1RHCeawz15EhjS+KL5c3GGWqJ6ksuK83W5H5risc/AtMBqw8AJSFQI?=
 =?us-ascii?Q?dxyWPNnpk5RndIK5PzYdUZEtPW9TFrAEMVmH46UFrn81BZhnfyqV8D5CI2JL?=
 =?us-ascii?Q?pQghrhGVvcGpQ/JQByIAmO6lt7sTceqKKzJEqU5U7j9FY7iNeWnwn5J1Bobm?=
 =?us-ascii?Q?Lq7+xMQrTXWHqYSFUMlkFkuz4XZTDI20X1f5TLTda0msUR+DxATjR4vJFLbk?=
 =?us-ascii?Q?65CkIP5/w2Y8N612MGFBH1Sl9xxgOMonQ69WTAwnb3KTNZdzfFm456BlejK5?=
 =?us-ascii?Q?ZvmFX5XtFtZEyWunZ9x9P7YMJJlRBj9zfWDGsZnOjblt45/hdlXbYnbaefOK?=
 =?us-ascii?Q?VSDrP5x5XRsbQvxfe9zFGGD8lS2AstQnx5S92B1WgVL5WWCfJJUCsHOcw8q/?=
 =?us-ascii?Q?8S/EI0IyUHOWrJ5XWophuMdhiSQTLBCG92lgv4fH1J9pppormdgeHWcTnMtx?=
 =?us-ascii?Q?ot1jotvbtDJC/PvfaMk6raIZTvuUbHg3V5lfLuWzvMLRTWlSas0vd7sQ4feS?=
 =?us-ascii?Q?YKtQD5XtsBjkda+wGJ+Zt+MUNa1GPfHa9FDJ30Ios9r1sNoPHq8WGEzx4JTS?=
 =?us-ascii?Q?N1KE5fj5p8028MHLGs0vW9yEElHB5FmNw470eGptU0hElGNjV1OJd7tet27f?=
 =?us-ascii?Q?wFfwE2b+M1PNwrmW+Zvm4o0BxTsLIvVBbaKWrfrO8YU8Z+T90seuz9ixnoYs?=
 =?us-ascii?Q?tm3LI4bllzedJfR/aF7EZiQgei4ry/TVIcfvlcmEV1kpdZ6weV9lF/eVxUkp?=
 =?us-ascii?Q?ksHKftEohfgn7Ukd5FGUn3cwfzoOD6RIEHy5Ic2m0NzGfHqZ0kok1YLrZym+?=
 =?us-ascii?Q?XRnwwlMNmaogvRpJHVVba2+V9+H1kMpzSjc0uJiF5bt6u9j/lnyMFpUafKMX?=
 =?us-ascii?Q?ETaDejVfJyQsQoXomCRGaidmuT19gijN97itJC+1X/X9k1pHoQbmZ6Iv9vcW?=
 =?us-ascii?Q?hgJr4HPTa58ofpGYhBu9sOpq6GcLrrr+XDQu9//lMN6OCQonX2gx7b8pfVzo?=
 =?us-ascii?Q?WUb7yUqMmap1b0KlfzeekhbHSUANvoyV+YxRbeoPMzsGn8YbRGoC/zu9iq4N?=
 =?us-ascii?Q?gCZc2n0O3mX5SZTdTBjWnZefYRHpuFY8lfksyDD5Rf805zL9t4oz7xu8n26V?=
 =?us-ascii?Q?3qEMZ2Vr70U8S2wANjriNri7QyqzdrfJv//ztSDWgvjUXIXc2ONDQ3X25nA2?=
 =?us-ascii?Q?FN/bZXqyep48sJ50uG+HgDWL0Nwl2iVm61AHiNnoeiHgjdpzsVw8qb0+cTQ7?=
 =?us-ascii?Q?CqyLlAGS+LK8dABxRb5uAfh4?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5dd5a9a7-e0e1-4d7b-d984-08d98cb9d789
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 13:20:06.4098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Hjby5bkZWvY5XZ3HNj8Ggp47AQDEa8Nv71mDk+xWSb0S39172Sng1g072eydmtPerTRRBB0QlH/FGbYmoEeJ9Uq1ngqf7nHOYuuERt8oM7h1I+n8L5C8ZCB666scyPSj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4817
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Oct 2021 13:20:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1986

Hi Michael,

On Fri, Oct 08, 2021 at 08:58:50PM +0200, Michael Opdenacker wrote:
> This first version specifies how to create consistent SGV graphics
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  README                              |    6 +
>  documentation/README                |    9 +-
>  documentation/standards.md          |  102 +++
>  documentation/template/template.svg | 1160 +++++++++++++++++++++++++++
>  4 files changed, 1276 insertions(+), 1 deletion(-)
>  create mode 100644 documentation/standards.md
>  create mode 100644 documentation/template/template.svg
> 
> diff --git a/README b/README
> index b3836baba0..c5ef2ffdcf 100644
> --- a/README
> +++ b/README
> @@ -7,6 +7,12 @@ Project components. In particular see the README under documentation/.
>  An online version of the documentation can be found at:
>      https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org&d=DwIFAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QF3FZ993w-Eq44rMQY6KNn14ixpGQT25sTiSTI-PGOPWUDrRFhSlyigzrwqiikfb&s=-430Yj3FuRmdIcf5oy5dNhRKPmLckC_gby6i0CMj6Qg&e= 
>  
> +Contributing
> +============
> +
> +Read the documentation/standards.md file with specifies some rules

s/with/which/

> +to follow when contributing new documentation.
> +

s/new documentation/to the documentation/ ?

>  Where to Send Patches
>  =====================
>  
> diff --git a/documentation/README b/documentation/README
> index 2d9eb887b2..f2e2338b7e 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -56,9 +56,16 @@ poky.yaml
>  This file defines variables used for documentation production.  The variables
>  are used to define release pathnames, URLs for the published manuals, etc.
>  
> +standards.md
> +============
> +
> +Specifies some rules to follow when contributing new documentation.
> +

+This file specifies

s/new documentation/to the documentation/ ?

>  template
>  ========

s/template/template\// ?

> -Contains various templates, fonts, and some old PNG files.
> +
> +Contains a template.svg, to make it easier to create consistent
> +new SVG diagrams.
>  

s/new// redundant with "to create" ?

>  Sphinx
>  ======
> diff --git a/documentation/standards.md b/documentation/standards.md
> new file mode 100644
> index 0000000000..f89a1badab
> --- /dev/null
> +++ b/documentation/standards.md
> @@ -0,0 +1,102 @@
> +# Standards for contributing to Yocto Project documentation
> +
> +This document attemps to standardize the way the Yocto Project
> +documentation is created.
> +
> +It is currently a work in progress.
> +
> +## Text standards
> +
> +This section has not been filled yet
> +
> +## ReStructured Text Syntax standards
> +
> +This section has not been filled yet
> +
> +## Adding screenshots
> +
> +The preferred format for adding screenshots is
> +[Portable Network Graphics (PNG)](https://urldefense.proofpoint.com/v2/url?u=https-3A__en.wikipedia.org_wiki_Portable-5FNetwork-5FGraphics&d=DwIFAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QF3FZ993w-Eq44rMQY6KNn14ixpGQT25sTiSTI-PGOPWUDrRFhSlyigzrwqiikfb&s=-nzeyBjDtATpahwb7Xr8TyZDe1O8W4X09Xc5l9zABvA&e= ).
> +Compared to the JPEG format, PNG is lossless and compresses screenshots better.
> +
> +Screenshots are usually stored in a `figures/` subdirectory.
> +

s/usually// It's a standard so let's encourage people to do it by
not saying as if it were a suggestion :)

> +To include a screenshot in PNG format:
> +
> +    .. image:: figures/user-configuration.png
> +       :align: center
> +
> +Depending of the size of the image, you may also shrink it

s/Depending of/Depending on/

> +to prevent it from filling the whole page width:
> +
> +       :scale: 50%
> +
> +For some types of screenshots, for example showing
> +programs displaying photographs or playing video, the JPEG
> +format may be more appropriate, because it is better at
> +compressing real-life images:
> +
> +    .. image:: figures/vlc.jpg
> +       :align: center
> +       :scale: 75%
> +
> +## Adding new diagrams
> +
> +New diagrams should be added in
> +[Scalable Vector Graphics (SVG) format](https://urldefense.proofpoint.com/v2/url?u=https-3A__en.wikipedia.org_wiki_Scalable-5FVector-5FGraphics&d=DwIFAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QF3FZ993w-Eq44rMQY6KNn14ixpGQT25sTiSTI-PGOPWUDrRFhSlyigzrwqiikfb&s=U_vkD3055x6JoQUjZwpcc0mXYDLK6XGuF_JOVe3qpCo&e= ).
> +Thanks to this, diagrams render nicely at any zoom level on generated documentation,
> +instead of being pixellized.

s/pixellized/pixelated/ ?

> +
> +The recommended tool for creating SVG diagrams for the Yocto Project
> +documentation is [Inkscape](https://urldefense.proofpoint.com/v2/url?u=https-3A__inkscape.org_&d=DwIFAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QF3FZ993w-Eq44rMQY6KNn14ixpGQT25sTiSTI-PGOPWUDrRFhSlyigzrwqiikfb&s=c1dT8ta_JgI23fsbegExbb1Tc5IpzxvDkUmYMMWMCSU&e= ).
> +
> +### Colors
> +
> +The "GNOME HIG Colors" palette is used for our graphics
> +(get it from <https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.gnome.org_Teams_Design_HIG-2Dapp-2Dicons_-2D_blob_master_GNOME-2520HIG.gpl&d=DwIFAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QF3FZ993w-Eq44rMQY6KNn14ixpGQT25sTiSTI-PGOPWUDrRFhSlyigzrwqiikfb&s=6cYqH1OYrt_hp21c09Bm4naMFbxGx6VNLQ24IwHZ8H8&e= >
> +if you don't have it in your installation of Inkscape)
> +

"if you don't get it from Inkscape" ?

In any case, missing a point at the end of the sentence.

> +It's easier to use than the default one in Inkscape,
> +as it has fewer but sufficient colors. This is a way
> +to guarantee that we use consistent colors across the
> +diagrams used in our documentation.
> +
> +See <https://urldefense.proofpoint.com/v2/url?u=https-3A__inkscape-2Dmanuals.readthedocs.io_en_latest_palette.html&d=DwIFAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QF3FZ993w-Eq44rMQY6KNn14ixpGQT25sTiSTI-PGOPWUDrRFhSlyigzrwqiikfb&s=azQJIziCwTC0mxAsM6_fThnhqmLRAAwjs4M8Y2S8TH4&e= >
> +for details about working with color palettes in Inkscape.
> +

While we're at the moment we pick color palettes, are we sure this one
is ok for colorblind people?

> +### Template diagram
> +
> +The `template/` directory contains a `template.svg` file
> +to make it easier to create new diagrams.

s/new//

> +In particular, you can use it to copy standard text, shapes,
> +arrows and clipart to the new SVG document which you create.
> +

s/which you create//

> +### Fonts
> +
> +The recommend font for description text and labels is `Nimbus Roman`, size 10.

s/recommend/recommended/

> +Labels are with a bold style.
> +

s/with a bold style/in bold/ ?

> +`template.svg` contains ready to copy labels.
> +

s/ready to copy/ready-to-copy/ ?

> +### Text boxes
> +
> +Text boxes are rectangle boxes, with rounded corners, and contain centered text
> +or labels inside of them. Their stroke color is using a slightly darker color

s/inside of them// redundant with "contain" ?

"Their stroke color is slightly darker than their fill color." ?

> +that their fill color.
> +
> +See `template.svg` for example boxes with different colors, which are ready
> +to be reused.
> +
> +### Clipart
> +
> +To add new clipart, it's mandatory to use Public Domain files
> +which we can use in our documents without having license management
> +headackes. [Openclipart](https://urldefense.proofpoint.com/v2/url?u=https-3A__openclipart.org&d=DwIFAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QF3FZ993w-Eq44rMQY6KNn14ixpGQT25sTiSTI-PGOPWUDrRFhSlyigzrwqiikfb&s=-BzxCi3tzcqHBWtyuR5QMN8QMYvh1crEF5GZD2G78C0&e= ) is the best
> +known and recommended source of such clipart.
> +

s/headackes/headaches/

In any case, I'd rephrase to something along the lines of:

"""
Only Public Domain files are accepted for cliparts. [Openclipart]...
"""

A bit more polite than "license management headaches" :)

We could also add a link to https://en.wikipedia.org/wiki/Public_domain
to explain what Public Domain is?

I would even go as far as to say the source of the clipart should be
given in the commit log so that we can check ourselves?

> +For the sake of consistency across diagrams, we recommend
> +to use the same clipart as in existing diagrams, whenever possible.

s/same clipart as in existing diagrams/existing cliparts/ ?

> +Therefore, you should check existing clipart in `template.svg` first,
> +and if you don't find what you need there, find a new one on
> +[Openclipart](https://urldefense.proofpoint.com/v2/url?u=https-3A__openclipart.org&d=DwIFAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QF3FZ993w-Eq44rMQY6KNn14ixpGQT25sTiSTI-PGOPWUDrRFhSlyigzrwqiikfb&s=-BzxCi3tzcqHBWtyuR5QMN8QMYvh1crEF5GZD2G78C0&e= ) which looks consistent with
> +existing clipart. Then, please add the new clipart to `template.svg`!

If I may suggest:

"""
If cliparts in `template.svg` do not satisfy your requirements, you can
add to said file new cliparts, from e.g. Openclipart. Newly added
cliparts shall stay consistent in style and color with existing ones.
"""

Thanks for starting this Michael, long overdue :)

I shall dig into my mail archives to add the rST rules we came up with
some months ago :)

Cheers,
Quentin

