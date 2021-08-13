Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.42])
 by mx.groups.io with SMTP id smtpd.web11.33964.1628841987878284740
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 01:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=kxIinxKB;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.4.42, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyG97n78lGyXF2HdfaxoPTNROJHzds1c3b7cPAAkJ6Kmcwq+xBt5MXQetoMDwtvn5liJPbt/zj62SKRnh9iSzQUikSM631RFIgHvB4jUjjLfGhZE5m4TdDz3LSRHZ67uT2MjOvtWzTp6ILA6/MYr676nCkY3jLeEJR98fHCFUpSUsjY1aRohBKToGS5VnmT3NH3FGBVCyR6CSEUwoaDCuvo5+t9kyvGrdVLhH84dmSlyaPTvHPnEMaUaZsh4Tp9yoM4qmzljT4KOVwAz38LhWJ3f1rdhxFcCZY+PEclLLrWOLM06h0lWFZccYZ4vLwTiK9f3WzmktzC2w+cWMGfBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzhXKtC5evsqpdN2nVt0e5HkcNqHE8QGaogn/0Q94HY=;
 b=PPNMRY1Ped9t37TXeVUImT8t5uBXXvzMm9NTcb4/0uLiljxOyvL1cVlF0wK6dQxSVesYI1fHabgpYq+RshvcnvlznLVCjtxuZEuw9v0FyNumt2Lizce32BGYdr5oREGDQJ7e8Sw2yqkprLcdUsf5dStFSuHF22SgTzsai5Y0kKuOhp7aAslbhca6UKDp0OphqzO9sghD3gljV1YqR8GpscINXb2COcqcRdKRsff/EMNf43G2j6yL3qOTwh7c8Q+FSnv/lGfwoPPPgHECuukjN1RslMTwVLFG7bkTwsMbVhPl0nWV/mW1jXTY6lXD/mH8pdTarzpmgq0rQNw6SCNwNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzhXKtC5evsqpdN2nVt0e5HkcNqHE8QGaogn/0Q94HY=;
 b=kxIinxKBjBRdhu5mnzCJyMVPHUkkVxuCr8+SyDa6NoaURN8DA2aPtWRkErpM8+Fq8DKaAw4ZmiWvF79JhYywG4tDZj3+DxjoalztMyHIkAnTTgnInXR/3nIOf4G8u7/hS5aSy2dXrW28f9SIY8LoP9bq1kiePjXpQgmZ0ecm3Ds=
Authentication-Results: menlosystems.com; dkim=none (message not signed)
 header.d=none;menlosystems.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB4195.eurprd04.prod.outlook.com
 (2603:10a6:208:5b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Fri, 13 Aug
 2021 08:06:25 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6%7]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 08:06:24 +0000
Date: Fri, 13 Aug 2021 10:05:52 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: o.mandel@menlosystems.com
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] kickstart: document which options accept units
Message-ID: <20210813080552.r4keiqjnf6sk7zky@fedora>
References: <20210812160133.22232-1-o.mandel@menlosystems.com>
In-Reply-To: <20210812160133.22232-1-o.mandel@menlosystems.com>
X-ClientProxiedBy: PR0P264CA0212.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::32) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR0P264CA0212.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Fri, 13 Aug 2021 08:06:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76baff3a-c10c-46bd-e6b8-08d95e313e7c
X-MS-TrafficTypeDiagnostic: AM0PR04MB4195:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB4195086F267D20E530272427C2FA9@AM0PR04MB4195.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A5yD7LiyfruRgAMUde+1kfPoJCFqHVNyk8HL9kb9uL0oXfFsJw556X2h4RNhXVw3Bw6q4PkFtIGy3JOqIy3Bv8+6TGM4RCPnTEJA71ZwZZ1RxtfknSYUd+irbUnNd0FqTA4zwiQ1BhSOv09NYuulRpePcjjb2H+y7lAolKgVXB4Zqx01CPWN3PymTi7Iq7PCssHRNopW/5jvtkj6X06ck1Mk/kyL4FtrbvOR7v15bav+6gJucZjgkW9PI2R+/4HYGbNE1RvrCcRsdB7grwqscDzXNUfmS8hmSNtBBGrNe8gpXu2O/oiI7Ppg4PmUdHZT2tCzON81P03za5+Q3aytN1SPYmgMx9S/Uh+hZnumW/4tzq+0nLABY2C3kkQ4rTgktKfMpROSjBX3iXkdEvQshwHJ1k6iSlBSALM5zTo2T0F8nyx20b90zINfRH9jnsc8TE6Z94pzPQ6/NPyQAV4q/jkb1wGukl+zLQvOFicB/eaV0KCv4KcCrjfkH35ke4jW1oxv2D7kvFk2MWfDMPTLyY+D/IiufYpPnP6wo42R9uTFGAkuGsaas+ieaqie4u2n4Ey7ygceQH9LiXDrB50Il1Aei3BT8TDqKPMQuVHVgFBmtyRYTjCacU3rZ9cjF/l1waYeo28jnCZW//ybx6COiq1s7FbSvvmKEfPvcV7hyaaiwASRVg60mgRDZwjEpio0lat6SfvV2qrTs/fPeWn4TA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38350700002)(26005)(38100700002)(5660300002)(55016002)(9576002)(33716001)(52116002)(86362001)(4326008)(6496006)(9686003)(186003)(2906002)(8676002)(8936002)(1076003)(66476007)(66556008)(6666004)(66946007)(956004)(6916009)(316002)(44832011)(508600001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WtgUsO+nuVgCcqmt9ENUlbq7a0mo0kRrFt9ZDvJG8zf4B1ox+Ux9w9b7MwDQ?=
 =?us-ascii?Q?BCkL5RvIfAtXeVySJb7cCLR7Y1QGCMJGzCZngBQVRZcOF7XYfnQS+QSYbXaR?=
 =?us-ascii?Q?unKuvBp1/7p6eY5OL2qSQp2IgAqHfXQKlDKF8M5q47pz8cfLG+/5R4fWihBt?=
 =?us-ascii?Q?moPHdLSJR6bH8zSQ5kJF6ZCOraypzxksGSKO+U3T/EhwbeaF+5oKVf4Ixw+s?=
 =?us-ascii?Q?gZZZQQpOfJ/NMgBjNRXfTFeY4/5TWkJqCSZiVgFUOE61Kc251EtDy4Z5KC0j?=
 =?us-ascii?Q?OhQCELD0ppXBHD4OEaNd8zga+2sA/J8CI+sduTHkEwsqPOWrabNbU8e/bAIi?=
 =?us-ascii?Q?W8YhzcHTrPC6uVrbJN89saJLZcotln3IYveytzyMgMBRIz1iqy19dTR0BJas?=
 =?us-ascii?Q?Vr97IWlfzxems0lDkh3/NYej51BQRE9prPNgZYaonj231Sqej0ZsojIsoNrb?=
 =?us-ascii?Q?53f84gK8NhWxfs2s1Q0anY/+JjS49yaxVfiBEL7EFTiJTGJ8DGnM2KaUub3P?=
 =?us-ascii?Q?PDui0kPyO+EI8Mnc9gzT6RXpPpKOjs4MhhNUfhWU0vHtWgLmIoQgUseS870V?=
 =?us-ascii?Q?0pjHKH4MJB51nvMhcZV7YMhOyfZeDOlbk39e0DEenXwwJTx7m7gPuVyGcsZT?=
 =?us-ascii?Q?gQ6Wbdm2CVDQhEyoecFb7xDkEGcnRhFiRzcpUl2nPUDjPiBoJ1+HCwzY5Kmu?=
 =?us-ascii?Q?jWWV44AcWobaOPwjRZoXkbijgaka/t1Q+J1EFsaeuMrH1UtLezSl3pTVoCG5?=
 =?us-ascii?Q?Rhc52+Q+tIUKL5e459hRHQU1g9fI/FImA0ck1w/pTC2jmu1wHeIN42GuKHYr?=
 =?us-ascii?Q?WmNQ/pnqFlpEYfz07B90WfYsjJCXbaAXcZxjnwHI8Gvw2wnR2C22k5+V/FZs?=
 =?us-ascii?Q?Ysix8dK1SXH3U/l59w+O7WqzfmnUvzf9+j0yaVS7T0lN0lw+Th+rv5UcsH48?=
 =?us-ascii?Q?AakG5W4NVHI5w77d35iFkDsdl6FSdthFjOa1/T4Gy4InRPq5X9yqEOOYKNK4?=
 =?us-ascii?Q?X6qIhmUpFRvocmLQ33GZuGr0w2AbZOyISYDiJNVu0nkoQEO+cApi/AjhHGsf?=
 =?us-ascii?Q?l3tsHEhSw/Yk9xHt1HMGo+Jxx0KKqHk7STUNJUaIbjQ02202ghl33LPxxNRJ?=
 =?us-ascii?Q?fnXV58gxki2myZ90l95fPSPGuSY3q0NL2qIEhcufOz0wUwyIWC5zUPKJAvwa?=
 =?us-ascii?Q?WmXlzDAR6f+FfVDs6/O07w1i90yrxfArOwd+93TDg/iZ1mY1vJGM5PE8yeCO?=
 =?us-ascii?Q?XRe/0b4U7zsE07EBVKY+FnUNnCTpkvJi0vJvvg1D49bStQRfZsH/eUrKp8oo?=
 =?us-ascii?Q?H1PjGneAfAXZOtKTKvE2r5kX?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76baff3a-c10c-46bd-e6b8-08d95e313e7c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 08:06:24.6925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9gArkfzbWDxvIQnyDBsjSR3KZHhwKGI0vA8aaJM0t9QwIZkEBmNRwflsczOsDE+0PNhSA8EuTBLganiluKOlrp2elkd8pdbHRBH3Vrgu8WsWNlhQavvaWXFRNtLgt7y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4195
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Olaf,

Thanks for the patch!

On Thu, Aug 12, 2021 at 04:01:33PM +0000, o.mandel@menlosystems.com wrote:
> Document which units are accepted as parameters for the four options
> that accept units. Also be pedantic about using binary instead of
> decimal prefixes so readers don't have to wonder.
> 
> Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
> ---
>  documentation/ref-manual/kickstart.rst | 31 +++++++++++++++++---------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
> index fc723ccbe..b5ffb2a4e 100644
> --- a/documentation/ref-manual/kickstart.rst
> +++ b/documentation/ref-manual/kickstart.rst
> @@ -65,13 +65,18 @@ Here is an example that uses "/" as the mountpoint. The command uses
>  Here is a list that describes other supported options you can use with
>  the ``part`` and ``partition`` commands:
>  
> --  ``--size``: The minimum partition size in MBytes. Specify an
> -   integer value such as 500. Do not append the number with "MB". You do
> -   not need this option if you use ``--source``.
> -
> --  ``--fixed-size``: The exact partition size in MBytes. You cannot
> -   specify with ``--size``. An error occurs when assembling the disk
> -   image if the partition data is larger than ``--fixed-size``.
> +-  ``--size (in MBytes)``: The minimum partition size. Specify as an

I'm not really fond of saying it's in MBytes here just to say a sentence
later that it can be something else. Especially since I would understand
35K to be 35000 MBytes and not 35 KiB.
The explanation is sufficient to me, it's less confusing IMO.

In any case, if we keep it, it should say MiBytes and not MBytes since
in the description you say it's mebibytes and not megabytes.

> +   integer value optionally followed by one of the units "k" / "K" for
> +   kibibyte, "M" for mebibyte and "G" for gibibyte. The default unit
> +   if none is given is "M". You do not need this option if you use
> +   ``--source``.
> +
> +-  ``--fixed-size (in MBytes)``: The exact partition size. Specify as an

Same remark.

> +   integer value optionally followed by one of the units "k" / "K" for
> +   kibibyte, "M" for mebibyte and "G" for gibibyte. The default unit
> +   if none is given is "M".  Cannot be specify together with ``--size``.
> +   An error occurs when assembling the disk image if the partition data
> +   is larger than ``--fixed-size``.
>  
>  -  ``--source``: This option is a Wic-specific option that names the
>     source of the data that populates the partition. The most common
> @@ -137,7 +142,10 @@ the ``part`` and ``partition`` commands:
>  -  ``--offset (in KBytes)``: This option is a Wic-specific option that
>     says to place a partition at exactly the specified offset. If the
>     partition cannot be placed at the specified offset, the image build
> -   will fail.
> +   will fail. Specify as an integer value optionally followed by one of
> +   the units "s" / "S" for 512Byte sector, "k" / "K" for kibibyte, "M"
> +   for mebibyte and "G" for gibibyte. The default unit if none is given
> +   is "k".
>  

Same remark.

>  -  ``--no-table``: This option is a Wic-specific option. Using the
>     option reserves space for the partition and causes it to become
> @@ -148,10 +156,13 @@ the ``part`` and ``partition`` commands:
>     excludes the given relative path from the resulting image. This
>     option is only effective with the rootfs source plugin.
>  
> --  ``--extra-space``: This option is a Wic-specific option that adds
> +-  ``--extra-space (in MBytes)``: This option is a Wic-specific option that adds

Same remark.

>     extra space after the space filled by the content of the partition.
>     The final size can exceed the size specified by the ``--size``
> -   option. The default value is 10 Mbytes.
> +   option. The default value is 10 Mbytes. Specify as an integer value

MiBytes instead of MBytes I assume.

Cheers,
Quentin
