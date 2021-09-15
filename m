Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.80])
 by mx.groups.io with SMTP id smtpd.web11.6362.1631706277541086065
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 04:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=pUe7t7vC;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.80, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haGL8nrasKWxvDLwt6RB/xjrwAfvBxK7bh2mWYK48xnR/qG2zCvo0GjFeYuqmMicvZ362Z2sNLPQJ2hyXcA3+ZJKY3Ni7Mgt5gbwtbm3zUCfuJJh7yNfHFm7MhPFIu1iK/tQbJmJlK5QtGfNr9g+hAFhFyd+OQ51WpyBL+6qHWRJsKzkX3XYj8IT2Y4SnFyQ7dMdtHU5LRiCW606fZiYk9Frz9a5Sho1cvbWJYmJfzsbQ+IjoWNxdJYHeJjgchjs9TrPqZYoaloG1whaaZcaFufshdxghxqWMc92PxRzCCpdPpfrsGSxRcfJcH2gyTQ6/TB5B9rlSFCNPB3ksiGy9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=aSIwo4ybfeFXUO0FdKv9y3+UMukwICkgkggZCdWp3hc=;
 b=FX8TcAUSuy267gTn2SQCXHYA46zPEFIfxCm8XQ1nBYmP1HWhDq4m3BXTr9P5Tx0llJYoM9r64IoLQuFQ+M3pruCmhwuf9f9yROVtZf5LAb1zmLGEJul+AhV/2RmXhbfNuJs+DM/kaCvZ7sfd97hvGW/ELGCNRKDv0VBYTUmGZeVr3FL9sl+qoMd1ZXzOzqWVKtOnUJFPWEC1EM5XsoGTOyIOx1XcNImRcv6ShNpou0vsTcMcsNx7QsjsPBv7muQFdACVAq+jgl/dcub5GECZwyxbkPq9CMU5FLlfITDh8PfSFe+q5kS7odk61E1AxfQWVycDmmZ5AlIWxnUmOqkTiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSIwo4ybfeFXUO0FdKv9y3+UMukwICkgkggZCdWp3hc=;
 b=pUe7t7vC91dybDmfG0FVgXTXHZYuTurdpkxW9vRIcIDV61foDFp+bgx6idJuCdGMPZUmRe4b606IhhNog+QfBuaJ7MEraDJKVpCChT97aP/KX6nxfOJ1BdRZhmsNQMyr/myKCQ8QXnNe2aM9hJwG3/nyiaejG7il1nU6HrUYSi8=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5458.eurprd04.prod.outlook.com
 (2603:10a6:208:110::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 11:44:35 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64%7]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 11:44:35 +0000
Date: Wed, 15 Sep 2021 13:44:33 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/4] ref-manual: improve "devtool check-upgrade-status" details
Message-ID: <20210915114433.xdynepq2bzxydfwd@fedora>
References: <20210915101219.2198566-1-michael.opdenacker@bootlin.com>
 <20210915101219.2198566-2-michael.opdenacker@bootlin.com>
In-Reply-To: <20210915101219.2198566-2-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: AM4PR0101CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::16) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM4PR0101CA0048.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 11:44:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 577d5f43-9385-4475-ad0b-08d9783e30bb
X-MS-TrafficTypeDiagnostic: AM0PR04MB5458:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB5458FEB0E754C7B3AAA4C3CEC2DB9@AM0PR04MB5458.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XOAzvwiZSKWPpCUaKQqwgDj+zmH3GhfqBs6rABPG9acCjVC0GC0xhVsh9nXw+RN935PhGrBGplWRnfdbWukvdHW4Rcctk69/TzQfuLPvrmP5Sk5mqd+3eCqZSrj4cEd1mAVe367Vh+vOkFq+B8xV9uJCdVY9rQ4+x1m8rchmF++w6XfSqd2Hl0l85RcFQNvSonoy1rwTH0JEE3XwCfFOSoq4NTwr/GDH16dE0CuF0ryNTRn5mbAhXOfVrOREpXQ9cJQKSXwapzfOrNzCZs5quAFLJ0wVZ9iFb/XI9xqnAdoGeE9LDTsh4aGv5qlZ4zOLZptVi1ibeHjvcyKi8JjkA6NaWicIc/m3FUSGliVczSpVN0VchDwauUBSP7TGg5ZgqyDEA4q+ScnFHNPTAH01uFKXRFSk4OB25Cs0f9AWN0t98g3VHGJNtcO/CsG3drNmg0i0FHfwNkFfIjbnsOw3MI7+Vf6x5buDy8/4VBe+O8nwyTLPTYdJniqqcASRyyiftKDNmt2+rl8CvHjybpI6mJOLeIOg5AifJLYuN2lNNrnv4qPxMGNNcJ25Ie4wQn6+x7HGWHhftBcLatKAWxp0vyfNxkeqsTSmSHSdpo2b9AMVpnYH368I4NUozHUw+o8vhT4Vz0lMVBkdpHivhnO4+XZhXNYBLYCZtZ8iJEmOcTIrdLRG37M6OwIf9RkHntj8L0LbpFUNVpTopXFaGiZVBw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39850400004)(396003)(376002)(136003)(366004)(4326008)(8936002)(55016002)(9686003)(83380400001)(33716001)(86362001)(44832011)(478600001)(316002)(2906002)(956004)(9576002)(66556008)(1076003)(26005)(66946007)(66476007)(52116002)(8676002)(186003)(6496006)(38350700002)(5660300002)(38100700002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6k5PNurMNOpmdCfPqHsXZcAW1JMhQ3iJbcrCR5WreNwmyE6mJhCy2yKNR9OI?=
 =?us-ascii?Q?suvEwM6v9pMjZIhIrnJT10H/Hx5NPMIDMUVR1d9f9Nv7H4/RYJSQzgq9iu0v?=
 =?us-ascii?Q?JJf5eWpJHDVn+r6bQ2WX4cLu5oWzYZUEXuYzGs2/08z8TiqOG/BCgJEMdDrc?=
 =?us-ascii?Q?AoFo7CHj0VqnVcJ/RYvo4JORGldaXuVT5uA/a6CbzLJ3lOcEsNS+LR7Oo4Jx?=
 =?us-ascii?Q?BY55ze4olR0JOfn9o9SRjpmI+Oo2aZxFP3TEtbGtBIIoyd9OsQM23E+OK4E1?=
 =?us-ascii?Q?KhKIp0uCP5Xxz+WbYp8+VnkJ25A3+3Okiu3R2y0Ms27yjfKa7o5uQBWVQTml?=
 =?us-ascii?Q?2k/TPEQDcV+pv7Tg0jyCRtskfCvQAM+qa5hvtqWmm2/FE+8tyJdpc1a5W3on?=
 =?us-ascii?Q?Zs8uuCZHziYRcNyYUkPBTPJoIaAf2bRHalg2I0WvomPzSsaLYp9/+W1/qbk+?=
 =?us-ascii?Q?8IjwE0VrBUQxc+oxahRGOAFhBI/QverM87TetLSeVPrPY88g+BNb04K+fZUN?=
 =?us-ascii?Q?XwJsCjUqDmOYA6HajLxIfs3zvMwsVuZtMK7Yr26H7TEMvRPWNKfAiN9j4JPk?=
 =?us-ascii?Q?XGmitcwWMOVcy70Osg3JS+/OU6CFrpSwZ5hGuotgGyFXzg0vPJcpmDn0fPRM?=
 =?us-ascii?Q?Y+sMoAyZdbZwV0dl8OZdCy7w06hxgBMch9cULyTSOZVM7xnlmgem+Cj6opfS?=
 =?us-ascii?Q?Q5wCBLOHa8fUuBQfOjmw6W4NNBhJjJefMR/Sv76t6CQP/Tqn4oy7477pylQW?=
 =?us-ascii?Q?PbbTq2HwZPMkTmKYHUr+gRBZ7W5cW8hyiWp8bHefdAuRsXMzyuTBxcNEvBJz?=
 =?us-ascii?Q?RF7tYBdDMzGGW9sAEAIma4IvjLC7vyEq2mIx97Uytaz3XCsAFHGbm874/ysR?=
 =?us-ascii?Q?jNp46E16ft0gAPYAF7aY9IASmXujZlxHQudC8DkE3YWs5g4j+ED5pvjO+6sS?=
 =?us-ascii?Q?iZlQzMK+OgtIpYwXGaJjE/afrJhqame83iwtOWt5WYbTAdnDvg8/zJRaepa7?=
 =?us-ascii?Q?TH2e/0Xtw4zRNLgEwgpsPhplrc5mFY1JjPZ5ag24zuI85JRfMl9hr6cEKZy8?=
 =?us-ascii?Q?j4AL5a+2ri9eMHE6YVRgTR/SQRbqsRaXwi3VdQL1/jQM4hqjReZzxNU1HRCn?=
 =?us-ascii?Q?lWH4avvf5Om7Y2NUFLcQfRbC3/CHgLy38Sfvi+j2C7SDqO7PvULwEpbsucI+?=
 =?us-ascii?Q?2rnxs7xBrtjDhowb7vJ1bYbDf6cQbnV85VGpEEsap+WtUB8tUu2frOcMr4zH?=
 =?us-ascii?Q?+Q0RVcKW/UMUVNacnUS/gh/vsSmJiTtsVrHz49MUVuVPYQtq2AWTySrqo7CH?=
 =?us-ascii?Q?CeQ6dKCdi1v61rVVvvWE5FRB?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 577d5f43-9385-4475-ad0b-08d9783e30bb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 11:44:35.1246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RRtC4Dqhkpvu1XCTvaRwqaRi3eWGuny7LxcZEWS/nTGcijuLPKo96iB+NhkTU4N01qcoJX1l5wKCxWyqiISuJdezjcMfTMvniUYMAlj3WP3Ft8RuRELBzA1UR+wV9FX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5458
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Wed, Sep 15, 2021 at 12:12:17PM +0200, Michael Opdenacker wrote:
> - Mention "devtool latest-version recipe" to process a single version
> - Explain that the mechanism is controlled by the UPSTREAM_CHECK*
>   variables, which are not referred to anywhere else in the manuals,
>   except in the variable index.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/ref-manual/devtool-reference.rst | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
> index 5fd51569a3..5a0d6c25ae 100644
> --- a/documentation/ref-manual/devtool-reference.rst
> +++ b/documentation/ref-manual/devtool-reference.rst
> @@ -328,12 +328,18 @@ Checking on the Upgrade Status of a Recipe
>  Upstream recipes change over time. Consequently, you might find that you
>  need to determine if you can upgrade a recipe to a newer version.
>  
> -To check on the upgrade status of a recipe, use the
> -``devtool check-upgrade-status`` command. The command displays a table
> -of your current recipe versions, the latest upstream versions, the email
> -address of the recipe's maintainer, and any additional information such
> -as commit hash strings and reasons you might not be able to upgrade a
> -particular recipe.
> +To check on the upgrade status of a recipe, you can use the
> +``devtool latest-version recipe`` command, which quickly shows the current
> +version and the latest version available upstream. To get such information
> +for all available recipes,  use the ``devtool check-upgrade-status`` command.

Spurious space before `use` here.

> +The command displays a table of your current recipe versions, the latest
> +upstream versions, the email address of the recipe's maintainer, and any
> +additional information such as commit hash strings and reasons you might
> +not be able to upgrade a particular recipe.
> +
> +This upgrade checking mechanism relies on the :term:`UPSTREAM_CHECK_URI`,
> +:term:`UPSTREAM_CHECK_REGEX` and :term:`UPSTREAM_CHECK_GITTAGREGEX` variables
> +which can be defined in each recipe.
>  

I think the "can be defined in each recipe" might generate confusion and
tell people it can be defined elsewhere.

What about:

"""
This upgrade checking mechanism relies on the optional[...] variables
which are defined in package recipes.
"""

What do you think?

Cheers,
Quentin
