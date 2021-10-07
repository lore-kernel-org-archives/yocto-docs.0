Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB49C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 12:43:01 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.73])
 by mx.groups.io with SMTP id smtpd.web11.11259.1633610578842300970
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Oct 2021 05:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Yxrr/OOX;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.1.73,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ej+YuF89M2FEBOJl7B9+Sle+ArgBd3noR0tlzECrqjD85EG4IwnQ4j0k74yB6DpGX6UsZNzJE1mVss9naXQYrurHD+7kDPJxWujZt/LBD/LFRZY2cyZBOeafeVMB2Argx0oVD6G2L++HtKiQdL7TQYH0s83RLIzLkFDPr2wPCkUNSWVg6SrMQRkI1BV9FEIV3qGfSK75rUN7hOkx1bzfuRASUndLvq9PPDJmACjAhDafNi4F1erNt2y0nTjF15+oZ8s7c/n8GcpX8CNfd8wP6ThKfXj6zisRcH/2jBiQWLYzFA2CnRus6QYYR7UNBYWRiPZX1Y9noaRpp8Vn4O/dLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUTZ7td364QCExfbeaManKL8E2iW4GTbFlKNB3WRxEU=;
 b=U3VhelF1nIdkqt6ZdA1O3HE+g2rKFwTQrZ/WJoXw5gffHvCev67HUdFLBdYDEZtFDgVVl888C7R6YPbUI2ETzdj063M/eWX8cHzdbo5kD3/mtsC6BaEIXBMoQZIdrUqBxvZjEtQICMXBkYIBuzGJzoPvgV5ehjij7CHC0JvX8sQi3DHbGoL3ln2RJ2X2MSPOX94JrtBn2zwfHLtcZHfUKfNB140sKf4XqbAweu0OB+w/fa3bK14TVWj2Ltq5EIyczydMrgyqv+6dbR1AatwIjC8hKCe0Hh6dcXlQQiGDZXhgoxdo8tiwVur/T1OUT5zErlB0cCDSn7cnqrTMg2/EUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUTZ7td364QCExfbeaManKL8E2iW4GTbFlKNB3WRxEU=;
 b=Yxrr/OOXy7u+G+KG5h5OvCAblPLOOLA22uhr+4HtOsqxwbsokcmLpsK0D3Z44sXNqPZlqOwtzNrp9BZoa5OYirmjr0PhW9IsKJcuW3YJjAi481W5xmcK6cZqjEhbsQxIgsGY0zZukAkTgOv9xC9O3z67vjEp2G+BmYEAfBy+O/U=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR0402MB3683.eurprd04.prod.outlook.com
 (2603:10a6:208:d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 12:42:55 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 12:42:55 +0000
Date: Thu, 7 Oct 2021 14:42:53 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/4] overview-manual: SVG diagram for the git
 workflow
Message-ID: <20211007124253.jx6pgewhaiwako7q@fedora>
References: <16834414503E8A25.21857@lists.yoctoproject.org>
 <20211006122238.959343-1-michael.opdenacker@bootlin.com>
 <20211006122238.959343-3-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006122238.959343-3-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: AS8PR04CA0032.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::7) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AS8PR04CA0032.eurprd04.prod.outlook.com (2603:10a6:20b:312::7) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 12:42:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0538d570-bb04-424d-68de-08d9898ffbe8
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3683:
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB36838BACC9D88F0DC94D9632C2B19@AM0PR0402MB3683.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I537s5/BFtddtHZaZNBrNgbfIA6sX4d8N2j7jsWca7Oxw1fzyd1q3uXod7VL7v12Ihy3Y6ju0wOUbwTTMSkoSF8Oj+AsvmJ7Vqi4aHwAuavebmbaPNId6F3LFXMydvy8hPukSgMh86lhffcIcLhWRruygKn1IlSGoK+4M0L/sQ2H2RkeeGpseHZWqLZUmihcJkgquAjgns/MRomjngPmo0hElMTwtZHAxGN8+x4WnI/HLYDWLJBs7QQe/AG6URqncQZKCvDC8Ph/PrwnqjwckdOjudrv8RHO9NvQsYPxothmNQPt8aOQ76FammrSZ8rdv/9brHECfsmPLl5HZLjqb5NgPDRm6ZlGyGyOmJDLARpbRVL5yPBDwylva+SRtzG3HfSU2EwYDv5IT1gYH70FfDOFRpca13pr2A34ltM5mvFqfpehkDLfiqBTRYZ7kXpYwp+Q/SJUfY6A1U8p1poP+Zjz4NrekeBjUP+qs74DTzv84dOk0dB1h8a5VhWkcZtvZ1Ed3+nB+ikT+/Dhjo0FiynUhOQDUzPsdso9OacbwQV256OgBJTgx7WJ6otbJCoQ6Re+7UQgXd9mfZe2LMbqwv2CLLo6ktlMTjEG9G+0zCaYdMjwM7+NcCoejE70Ml0J1pAbwvudOIq60bffULSt+TiFfelkBagr7PmywaFahLzz2JHGhMJneBsBSmWJUtfbpsAwsV2MaY4dq5gBO4FMCA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(33716001)(6916009)(9576002)(8676002)(86362001)(8936002)(66476007)(66556008)(1076003)(5660300002)(316002)(38100700002)(186003)(26005)(9686003)(66946007)(44832011)(38350700002)(956004)(83380400001)(508600001)(2906002)(4326008)(52116002)(55016002)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VmczWZio/ElAFdaBR1CoFNdIir0XKYMnpQnjg3KZdON0ljjQMtKW3r0TAPIp?=
 =?us-ascii?Q?gO9+1/iME4XcN38X9HUbjnXKzFMLH74TNAkxyNIk4uTfp9v4dd9a2cQWa+56?=
 =?us-ascii?Q?Zuq91iYIaWFSxZ/t9RoxfIpgoOHexTG/3JRvI3kaVrGlWy5C6rtFiOjAE2Pc?=
 =?us-ascii?Q?wgBA0+dPFusF/DVOpy8ELa9QNdGvkJ/p5I1o63JGeUfGohVy/EYocrjjQapE?=
 =?us-ascii?Q?rJja4PAfR/Q10y++tXMByiCThDOdZK0v6KrukhkVs+OV4tTZf5H9o6m9/JHP?=
 =?us-ascii?Q?w8Ks6sWavSvTqx7OXTS8mQk7kdUA8PKtX0p5+y4VM21dLZb15JF4YJwDf9yc?=
 =?us-ascii?Q?MhysRDyE7DVdNflJUuO6ipslCTnKQfSjhmabRWg+mmcUZrSzOprAcelJ1ik+?=
 =?us-ascii?Q?1HFrdMcMU0oSz1PvMepGG0ThUxmO6CC8A60DaspRCAKYEgdv6x7+FZzNP12I?=
 =?us-ascii?Q?X9P0IVTm4ENz7eVrhLJ6pkBC9/wN37Ojnp1pfQ0Da7GvFq+eSYz6RoWGuK/C?=
 =?us-ascii?Q?N5Bs5o5uKkL0QT0rBJ3Ek0/E7kg2gWLcP4lHG/mDwHJJdH3wJI2sfuJAnlrs?=
 =?us-ascii?Q?Ssz3JA+Mbppa843AgPVUXFBkjKWkMtBoHO5Nv8YAstBGDeoG6lvm1A2tZWt0?=
 =?us-ascii?Q?WrvGnhVmH47MKy8tByLnzIl+1MDplwHL/OezIjq9yHGZ7h2B8voSIhTxQk+t?=
 =?us-ascii?Q?5ug0f7gSn/+ajupYq7sQBK5srCC718ag3XMi0xCgrReYSRqX4mADAhkzoXSV?=
 =?us-ascii?Q?j9kWYllS9GqWbp0vUCKf/SPuUWvy9u/uMR5GSlJ7px2wvATfTc1/vd/DSqzt?=
 =?us-ascii?Q?sTdghTehZUqHqLcXzsLI57+LhWYUgTIFqiqHpOIVd0bBOvlAtONuYWxaHSTz?=
 =?us-ascii?Q?LQMVFGj5Zm0XaQkNwR3T8OQ4F1B4MuJpgp4uf3kA/APOM3JXUx1VBdknRRNi?=
 =?us-ascii?Q?zXcPePettfVTKdL1JRLcvHau4wgkrHufnpSDofuBVuaV411nJKPzGZLcJpde?=
 =?us-ascii?Q?7ZdMI6Cl8LhOzmHY2cB+6aaoxCjZT47gaDJP8IruBixhNycGkLf4UF+o2kh+?=
 =?us-ascii?Q?Xd4KZhBkI+q89ZgJfScLfI2z0Pq/c/h+tOLqupmg7iOyiOn1jPDBSyk2UTa0?=
 =?us-ascii?Q?/1g6CZh8/JQjKMXRRW7G65lQZsMWzEXfCVBuzJsc2/RriYiF//WfUTj6a5mZ?=
 =?us-ascii?Q?p100tsw9yNJ67ScjeWsOQrXv5oVSF1ZO53EEPzn7NT3yaocLg3j86uqgjsXq?=
 =?us-ascii?Q?tk2JigkKIAuDj0kI6+3QIKJimxB0oGfJqfzPqa2d1FwxNnVZIedqs6jqjqS6?=
 =?us-ascii?Q?J4mz3NSYeu1GlZjNpEov1L2m?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0538d570-bb04-424d-68de-08d9898ffbe8
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 12:42:55.0446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 88PxOvo6aAM1APZ6zng7veI2XrMyUOXU+LoQZ4NbsKAtCfxrkjvqxILHk1nLc1h8p47H4hJMhqfcxx4T4Siz91qsgX88c9/MjBi5A09udchKYd2bjkXjrxXtzZEZxYWh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3683
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Oct 2021 12:43:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1948

Hi Michael,

Found your patch in my Spam folder :)

On Wed, Oct 06, 2021 at 02:22:37PM +0200, Michael Opdenacker wrote:
> Set in full-width mode to make it ready in PDF
> and EPUB outputs.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  .../development-environment.rst               |    4 +-
>  .../overview-manual/figures/git-workflow.png  |  Bin 26586 -> 0 bytes
>  .../overview-manual/svg/git-workflow.svg      | 1205 +++++++++++++++++
>  3 files changed, 1207 insertions(+), 2 deletions(-)
>  delete mode 100644 documentation/overview-manual/figures/git-workflow.png
>  create mode 100644 documentation/overview-manual/svg/git-workflow.svg
> 
> diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
> index ab155dc3b0..d719ba69eb 100644
> --- a/documentation/overview-manual/development-environment.rst
> +++ b/documentation/overview-manual/development-environment.rst
> @@ -286,8 +286,8 @@ develop, test, and submit changes to "contrib" areas for the maintainer
>  to examine. The maintainer then chooses which changes are going to
>  become a permanent part of the project.
>  
> -.. image:: figures/git-workflow.png
> -   :align: center
> +.. image:: svg/git-workflow.*

I guess this is due to HTML rendering including SVG but epub using a png
created by inkscape?

We could add a comment for this maybe?

Does this work well if you do the following:

$ make latexpdf
$ make html

for the html to use the svg and not the png created by inkscape?

Otherwise not much to add :)

Thanks,
Quentin

