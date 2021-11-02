Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F278FC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 09:56:12 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.52])
 by mx.groups.io with SMTP id smtpd.web10.7125.1635846970686404569
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Nov 2021 02:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Rpj2zIwS;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.52,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDtuKUSxR8abq01lK/g1sqrOd7mIveO7a9c51gdRXp5tjNCyjYN3lUWjcWhgcMh6QHj4PsjrAuuqxXva9Cu7xJrk57aBqLq8Obd2+hmJnxb3teSIAbROAnBTIsr8P3dZ78kWoZEyrfeyJDUtOpS/DBdnvgmYbnhZl5n9qdgCoA3uy2okVLqnWBW2Bfr5G3loYHW4grdN3++mNhmu0NYshPffjV7LdgJtrvAYPTBVLppGgjLbQJD/Vc0xMF6ShHTlENnuZ/9D0D7bmZ6rgTJf/HlupKBKwiRVUR8oMpNWNQi1WFnylE+YH9pZmVvJmo6hYPUKg1ldrrcmdbA/gegK5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu+9Gvas6UAgQ7bAzgwj1hRGAoG+U5Jm6t0Fwx6kALM=;
 b=StyQxZDzSPqh/h3RAfiUwPAe6isxGmKOyViK5UEF+VqU5nF998wVj+m0RiSF4jSTeAHCqgsH7F0LbCwwf30t+aRRFLEqInnIX86lEWknZsUdcKpTTRekzGaZa0zyFmH0SgJZnC/R0eFaQCd627eo7TqDCNQgCEr8Jn2wjIbJJM6Zt8H+m0hke/sFNGC9ZokP+1CrmZ8Ee436JwjMcBug7I3IJFEQngCcpmsdPrq8kTtwiUvXMC2BfS1Ov6OW2+oGQVv3u9iS5aNRmP7AbBW7FT+2QmlJEZt4xjBubRQ6A2KuPeU1GJK+KjrUPQLj4HcdECbkdeiCcsoWATdjV4xqjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu+9Gvas6UAgQ7bAzgwj1hRGAoG+U5Jm6t0Fwx6kALM=;
 b=Rpj2zIwSZxsFsPM74N/PNBuAaF/d1I2HWeu15M/pvF4Tg4oHQ4JV2R4sW7bjRwiY+J4jJ2sy1p/0UMkm362cEWYcSOXbm8At/7caNw0exGv9wML/KvK3EEsl6Jq+iGYs4dGA38b6RXOler5fK0/mrKrDFi4V/RiQ3WJhtq3kPjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7908.eurprd04.prod.outlook.com
 (2603:10a6:20b:24c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 09:56:07 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 09:56:07 +0000
Date: Tue, 2 Nov 2021 10:56:05 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: update overlayfs class
Message-ID: <20211102095605.euikkwlg643a77ph@fedora>
References: <20211101115842.17956-1-uvv.mail@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101115842.17956-1-uvv.mail@gmail.com>
X-ClientProxiedBy: AS9PR06CA0035.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::11) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AS9PR06CA0035.eurprd06.prod.outlook.com (2603:10a6:20b:463::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 09:56:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd968a4e-b1b7-495e-d064-08d99de6fd94
X-MS-TrafficTypeDiagnostic: AM8PR04MB7908:
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB7908133DCC57575F51A6BB4EC28B9@AM8PR04MB7908.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WGuQNU6QyktKqCtBd7TAARIX/cYebRFTnH5ucOHknUoUnpRdr/0C+ko5MfX+HyZBQeggG9W5GxD2IaLo9IvF1lyCO+FHuBqNPh0MacwT4WmuGzO1nIdQYuOR8z7p3DfIxZLOWdRizLUFFzWjF/0zt35czf1Gfo0Q2j7oWrBdEGUOSKYMZS5gbufwcEAa0hfx6KNaN4jGMrOfhTphOV7yKY0WkIYW+Bpho/MGEoIQTRFX5ydd+eXwFX6yPE65ZVfvbFOCasBGr45teHRDGDgyb4Sc8CW0VJrtF4kZW/S3ubwwhvraLine7WWmry1qlJx2WBpSCkxGTjkY8o2IgGKDC6zuzeRTIQljAxxfM3W+tHww2P26vWW39/wlQhZfmFk9rYi2ECQRKVG9643SJqGtgtR4QYu5Ej5wzyXdX0+B5d/RS1nCWFIEuaRSXSdsywdGvEwChzMG7OpLI1+xGvQS4pw0FCa/Vf8/cgbTHGze48FP9o9yitxe0z8oPr3sBD/pPTBqIOO5gwAZISeh/Z5n6l5lBikzvbBcBdWNm7hcW6wR4gG7TGZYUCqDm7hKT0gCjx5FIMpW3qyYBRERLJtII1SmhnGYuRIzcSjfwChx981I9xqGrgmVPT4APYwTde5HZBa3E7vTkRP8b/a5bCiNLJ51TNDah9rXyTovcXhFA0MBhUK8Ovo3ySFHZZDXGMPsLrk109DZEjQ3A1Ap3W5ZUw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(508600001)(9576002)(1076003)(6496006)(186003)(8676002)(8936002)(6916009)(5660300002)(2906002)(956004)(83380400001)(55016002)(52116002)(66556008)(66476007)(44832011)(26005)(9686003)(4326008)(38350700002)(38100700002)(33716001)(66946007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kP+yS6b01uAhK/U28vOHvSmzyDtMhQI1C+khHqkYWVWYFMZcIHqGD8qrtiNX?=
 =?us-ascii?Q?OShl+zhc3IyZOASdpls1PHFx3ADtUYDNV+BZQWFAVyHjj3U6Dy/osvgQ7apf?=
 =?us-ascii?Q?9HGALomBzQkjU97nY3UAxb043eHq8Qr+jmFct583QYa7BBelGAMgW9Ofsn+8?=
 =?us-ascii?Q?MbU3aBJhYIavKH3eXuf3G74ufk7N+y/WUU2OMPEdCMAhRH8aqod7+NvgQ4GG?=
 =?us-ascii?Q?zxwfskxosTfbU/3dnJ+IjtvypKcFhkVofbDcjnUAsWSQ4ayGhHM52hDUorfD?=
 =?us-ascii?Q?ypKGDfIEi0D1WKNLOXmrQI+GMio5A2yiEm3Oq96FgvwswZWLNVohvbJVNxys?=
 =?us-ascii?Q?RwWJWkDzfat21dUE1EJz+r0fxcN9i1RO8Z0Sm9tkMk/b+rOEb5VEtfGUBA/T?=
 =?us-ascii?Q?113LxJPHqk5FJuJOga93gCHWl8Q4Df3YTekKtkouxLuqFHLFjjGdghL+XJ1X?=
 =?us-ascii?Q?BJjEsearoysndQsm6cDApZFAUd/PLFBP21QLRR2vzdMvaIpsbNYVHetyQXUe?=
 =?us-ascii?Q?5rzc8KS1yBxdNmJh13TQy0FQIiNnb7KCxrhlmOI5XrQ9SmEFggP0oSU+Slll?=
 =?us-ascii?Q?bJIGYkU/u+3fDu27MLXHohc3ybsSvqz3yCvn6yhnJiHVG0hkgCL6BpDPLjIy?=
 =?us-ascii?Q?ZFt1FjoC6srEwFkResNMY6YpNonT8XQpyik4t/rcC1sGLJo1CxV+iJvbc/SR?=
 =?us-ascii?Q?f4NvtQxl+F7ZokZ2ZrRNs9ovzXb3c9mGXQcMaYVK9mgiFuNMf3qQMb6e8evS?=
 =?us-ascii?Q?aShB8QexGl77YGsk3G7UG6r/CDoBl/zwBBLCqnTWwhhRX84TuFRzvRR635Ep?=
 =?us-ascii?Q?v8fSkAFhJRkFU/+Sg6jFGf6so/PSM5aItIc8Y1BRleCDlgaJVHu86A46MEOF?=
 =?us-ascii?Q?4GqXv3NvMrKwt6rizWlAIWPqLHX3imzNQ0DtJ4VFgUc6fk5x17pq3hyFJQHc?=
 =?us-ascii?Q?WVrxDNNcCdcDDRaP69RX9AdRcxvfsAsohDKCKdXKdMqRHaedF2zeUgkGQeh7?=
 =?us-ascii?Q?AZjWYIRV4a6mD1Fkg7HlW1oM2AgpIaCBNu1QiZJol0y4Est6jhHynr4Q8L2k?=
 =?us-ascii?Q?ovNN31K4eU6YYqhwWH52tRl/H11f0I3nufP7OzJ3kI70MLfQmdg+CUIS+Lkl?=
 =?us-ascii?Q?RJgqZkuAJxLPD9SX1Hnzz/7pSji5F6ICebEgAfZScUp6Lt2tS33hV0cN7+oZ?=
 =?us-ascii?Q?vR9TtNo16+ZGd5jB5s1V/69KhpOOZIp61SVuV1oOoVNOO9Yq/Ir1+GdmxxRZ?=
 =?us-ascii?Q?AiPL9RzEC6AAXwkC34F03bWwWMK8mFha72qvBddatuc7EjljW1HG6plxi71D?=
 =?us-ascii?Q?yl8o/j5dxzPmPaQygHolK5C42DyBebYJjZWAFTdVI0GWfOKMk/WjXG/A7cQ2?=
 =?us-ascii?Q?ggPp3XMJOYvAFVRANQ3lPTNp3i8DMn+TTiFwPQqrLGUlXMBXlv/u51YMqSnS?=
 =?us-ascii?Q?ovtGK8ruHlFr6Zezi6qOw29WmqRpb1XXM/HaJNye1nYD0YQUSndiTzFDzeEH?=
 =?us-ascii?Q?C3MTCbi63/QDQ67++WLp8ZiTAFx39xNmGeGGdUOoBDwUICiek8T0+y4q9FqV?=
 =?us-ascii?Q?SZSzYblhGhRBKIhADxofVy3VIN2KTpn940pa0NwCvgPwBfTFZT83CPW8P85s?=
 =?us-ascii?Q?SGg7u3QK3zrNjg3LVCaoN/1125A0PNIVM79/23ARWZh9wvrW09Zt0ydCl5lc?=
 =?us-ascii?Q?5HXzGJjYZ1FYnATfCmexBWDrAKJXh387PjNTbA8sO+ghxq9+uVlmdCVirpAr?=
 =?us-ascii?Q?Na9lD4hjpQ=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fd968a4e-b1b7-495e-d064-08d99de6fd94
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 09:56:07.3382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6ABznXWyB6vod6IpzG/n3J+E8k1eJo1n3BR9awU3zb76PUakn2WGogkWABGWKeqX3HLmkf+J/H1N/P+0D2Y1Z1Jd1ijBSEuWFn0372TDoNrhPAfja4Ip+pTIlGJotEG7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7908
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Nov 2021 09:56:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2062

Hi Vyacheslav,

On Mon, Nov 01, 2021 at 12:58:42PM +0100, Vyacheslav Yurkov wrote:
> Describe how to use a generated helper service to set up a proper
> systemd dependency chain.
> 
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  documentation/ref-manual/classes.rst | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 9b1ead66b..1638f6ea0 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1742,7 +1742,8 @@ Then you can specify writable directories on a recipe basis (e.g. in my-applicat
>  
>  To support several mount points you can use a different variable flag. Assuming we
>  want to have a writable location on the file system, but do not need that the data
> -survives a reboot, then we could have a ``mnt-overlay.mount`` unit for a ``tmpfs`` file system.
> +survives a reboot, then we could have a ``mnt-overlay.mount`` unit for a ``tmpfs`` 
> +file system.
>  
>  In your machine configuration::
>  
> @@ -1752,6 +1753,22 @@ and then in your recipe::
>  
>    OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
>  
> +On a practical note, your application recipe might use several mount points,
> +therefore you'd like your application to start only when all overlays are mounted
> +otherwise you might end up in a situation when application would write to an actual
> +underlying file system (if it allows it) or could't write at all (for RO file systems).

If I may suggest:

"""
On a practical note, your application recipe might require multiple
overlays to be mounted before running to avoid writing to the underlying
file system (which can be forbidden in case of read-only file system).
"""

> +To achieve that :ref:`overlayfs <ref-classes-overlayfs>` provides another helper 
> +service, which you can use to set dependencies on. The systemd dependency chain makes
> +sure the service start only when all ``overlayfs`` mount points used in the recipe 
> +are mounted. File name is fixed to ``${PN}-overlays.service``, so you can depend only 
> +on this service in your application service file. E.g. if you have a recipe 
> +``application.bb`` and a corresponding start-up service ``application.service``, you 
> +can add dependencies as follows::
> +

If I may suggest:

"""
[...] provides a ``systemd`` helper service for mounting overlays. This helper
service is named ``${PN}-overlays.service`` and can be depended on in your
application recipe (named ``application`` in the following example) ``systemd``
unit by adding to the unit the following::
"""

> +  [Unit]
> +  After=application-overlays.service
> +  Requires=application-overlays.service
> +

I'm suggesting those to make the paragraph a bit easier to read and
strip it from explanations I'm not sure we care to have in classes.rst
since they are implementation details?

Thanks for the patch!
Quentin

