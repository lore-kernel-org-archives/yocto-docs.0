Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324FBC433F5
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 08:38:25 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.79])
 by mx.groups.io with SMTP id smtpd.web08.5700.1634891903272536448
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Oct 2021 01:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=XMz9RpAb;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.4.79,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8qS10VpByiNqmL+A1qKuvtRqGNAmEeord8q3lb3+VsGXi4olwo2DMcnMf4m327JgjkabszHB33oJcHx6NddDOaplUMxUEpPPpV++maE2Rr1kr5Nq+TXMvDMl8ThqXGfz7i/kUmwPVnSR8bx5gZ1coZWvwdUmLvZTFqI2hKC+gq216wVtHuMCrBaRgydWh+9DvS2GSQa3d4X2KqfVxeig1fBM86MtUIA6TtoPmWa264MwXxhIPYpVQH5h7pAlcTJ7dLRHxsGsPp3ZTq+aUJN3y4PAbWf4XTSx/vN6DK+pHjPklQ2oaQeGXq/qVd5ZvaVMlw9n2IiGa0g0fpWPLqLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUrYH6cfa5CBEZsV+Dq7XLQ1bVi7OG/MIdgbxAyt/PA=;
 b=hhzY1ODnsFlrTFkhW7kvx/QaSzI2S0b8qF5u0xsu3WXXHO5Ee9E06jXTiEVCEACV0PqDCJcNjwHeAI34394TAUU9+Yahbq2gf/pYJaiQkOZblmXPUn4aCNFp/2wN3uJTG49FjNjrFkB8xDtyxmJn5+iRwNXxjIfb4YKDpVw3TQUDdcJ0h71o60fjSAANSYRV0ifwNquRrj1LmxnHUAVNWFTaIfry0MnL7ZpcjYnLDw9fBIu7ilIES1MCxMgcZyle4BigCNJm7BXUmcLYIUTl2q5HEG5+oeOhrPLbrdZcK1aF8uavRj/XI118nt9cIIaAEXL5AmKbsRXcucL18+xsTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUrYH6cfa5CBEZsV+Dq7XLQ1bVi7OG/MIdgbxAyt/PA=;
 b=XMz9RpAb9crxEOn2ZPYYC2SrHQtV6NSxB9ms3XI9mZfbuSkDOELosoO7qHnEUhUYA/42u/VQMCHhI28XdbEBbAUR+8/1ef4sdkbqGZwZlW/XwrJmeStaaqAZpuuW2q4AVbSjttOv9oUo7f+IslyPh4CWE0e3EVk5OANhGjiWBt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6515.eurprd04.prod.outlook.com
 (2603:10a6:208:16f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Fri, 22 Oct
 2021 08:38:20 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4608.018; Fri, 22 Oct 2021
 08:38:20 +0000
Date: Fri, 22 Oct 2021 10:38:18 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org, michael.opdenacker@bootlin.com,
	nicolas.dechesne@linaro.org, mhalstead@linuxfoundation.org
Subject: Re: [PATCH] [yocto-3.3] conf: update for release 3.3
Message-ID: <20211022083818.o54tshvgiashqivd@fedora>
References: <20211001153924.93354-1-quentin.schulz@theobroma-systems.com>
 <20211021083834.k2rkz5robufkdkyn@fedora>
 <a22eb2f4ecea883343735481dfe42f28c17f1e38.camel@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <a22eb2f4ecea883343735481dfe42f28c17f1e38.camel@linuxfoundation.org>
X-ClientProxiedBy: AM5PR04CA0004.eurprd04.prod.outlook.com
 (2603:10a6:206:1::17) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AM5PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:206:1::17) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Fri, 22 Oct 2021 08:38:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61612530-d5a5-4dcb-0b9f-08d995374d1f
X-MS-TrafficTypeDiagnostic: AM0PR04MB6515:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB65151C26F40CA17C1879503EC2809@AM0PR04MB6515.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FY0+u6bETkwPWDPYUENSUHTibhh+LO7+n0/QYMyjFue+Oup95pUtpC4LxBEeXw0/g/dSda9ccasIvRrqkGIzqr3r0p3WYAxss+V2RG4DDR9mCCfw3Ka7HsHwinIXMUruaS7tTbUVsdKT6S8iK3wCQDpFqe52xSOP+MP1R5e1QVbZb5bylrN9xsg5l6mQPiBTzWq3XKVt02lRNE5sD1rksDr8OhFvSsT+4YBcNsbAK3WITI0SNIP6vWKvyD1su+/SeNJ4MNDV+eu8KvErEY90kuDq8dfyHfbgE/s+o45Wcbu2huOMoWZZhCmSE1sewfIV+EohlNiLhiqx+T1vEOYz0F0DGQVQssYX9Iq7vravC1OPtzdoG8JRsyCnbePFyX9MfQ2od11sY/XBQhXFQd1HmdW9AmWPWuo0h2cLOuKlEpUye48cKGx8cdykyVre8nNdDhhNcAZ9lH9SBVUCmwrNLb7P6ze3LhcqeivGTtU55LaooBUyIXVTMvc2TcIq0oNS/f7RVq/HepS1gYEWQgqh6JHwhnagOVYlSI5zqto10sT9xPeO3XVoVejUi8kIhPuiEYUMfu75fpcjr3fAgSw4Iudz0dGdcA5jZcu6YSi8/D4iwHwJQcI7CvVccMiDUhWXubFP3F+mJTtq/cbE1roxNeuUpH8KtglwspWVlpZ/jJkR6mAnCdGLTl3G/QHbvLG0YNQ0eotJXhJomJpDZIqytg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(9576002)(5660300002)(6496006)(66556008)(26005)(508600001)(8936002)(316002)(4001150100001)(15650500001)(52116002)(2906002)(9686003)(8676002)(1076003)(83380400001)(186003)(4326008)(33716001)(44832011)(55016002)(86362001)(38350700002)(956004)(66946007)(38100700002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H8QkM6Xf7EuCzqkynXR8Cw5ZTeekFjmfNwWiq0y4gDYvKwLKHb6sLzpmgnI0?=
 =?us-ascii?Q?bYAIUhApWkueJo4x4m6a/BFLFACzxt9pB+WascyLnexSRppziavaVrAPB1k7?=
 =?us-ascii?Q?UhtZBhvjuUvN59abv0EHJA1Ze66BshEQLoSXKfUUIENNYeLadYpqSY7/MSe/?=
 =?us-ascii?Q?ef+1h+6cDxvbp8ex+GQd5C8sUsV1hhHsb+sPXnStUOTMf3eaV7/dqSliL1FP?=
 =?us-ascii?Q?LGbEt9EHpl/GcC6EK5WKDLryisqgpEp/UHfB1IGNAzEksoUj9y1hdNopjTNJ?=
 =?us-ascii?Q?dLxqdj2M8Ib60motL9fzYagPmY4goNVkySg9egrTGgb/YoDyrFdpgc1sKRCH?=
 =?us-ascii?Q?0Rt4jwSm0MXpN3Y3LEVazKpGraN6+IDMzg4a0tSUtws9Jlcnos9F6bw7KYU2?=
 =?us-ascii?Q?5NrzEzQ5q+Yxar1tDVsLybor8uzVV4fsWJ8iv7jM1hOy9kKAsh6yIZa0/wJN?=
 =?us-ascii?Q?prZicavAfduD6VAzPQQQT6geTspLmyVzrQmVcmVeZu6J14hLqaMS07c1xkKa?=
 =?us-ascii?Q?FR9+zDCP7uIFfMct1aBhY7ule/wZvZ6jwvT2dzupKdIcbZzPC89MAkNOKkLi?=
 =?us-ascii?Q?m5/61fhQzvLaFDfbf673uTOUHf2OwBA/F9Beb/N/SFm7DaxOAvB9kY+6WiuJ?=
 =?us-ascii?Q?s66Jm1mKaDn44sVBFt/q5suQ7JGHq+UnVEa8qJ6dqzwF/AJq89pRTuQne8fm?=
 =?us-ascii?Q?RtC52wVEahAUQFNDRrIk2kQ5cWNCXA+8ChQNuEMuB3JaTalhX7jCKkIPBnBg?=
 =?us-ascii?Q?ZQ7fa7BrRh07AZ6oL/JCypbGdv/nbzp01LCPMjiNPawWzIxj2GnApEEMPGjN?=
 =?us-ascii?Q?fDCfAPKgiZwu34am3yJ95EkCas5o913a0vYgn5H3z46LEzkDq04Pqn0OZkzO?=
 =?us-ascii?Q?9LxQS79HIobUJ4XBerV4hqIWDqbpia9ri5lTloYuW4hKVCIKASOkKnisPcny?=
 =?us-ascii?Q?LpoUj7kxhd8/u8olljRbJJq4CwtMZM3u9CgxTbAwzbHaU/MPszen1qjDkF4D?=
 =?us-ascii?Q?xgr2p83DZrCSuBgzIiXxuNz23LW9S5uorekVuvAhT1uisToVLQG64i7OEKwl?=
 =?us-ascii?Q?RjVemrX2YGre4qVliDQE6NXNmUW8WWFoPnF1brZp2nl4zSpaPDsxJ6of1VCL?=
 =?us-ascii?Q?RmIXi4SqpjpR89nNiH9ugnkCdKu2OLznCUFjLzJOVaqc6DNfbsFalTPh3roX?=
 =?us-ascii?Q?RxfvozvDXRTJJKGujn7GqVedOpFnUdW1LScC4nn4QLGguqmTLWGlkCjk2Jrl?=
 =?us-ascii?Q?38dkWnIAF/70ZsakPetomIGaBdnJCw8tBRMcvbV22KeKXofA6NG2Mr9qjVXI?=
 =?us-ascii?Q?jfnzI41JZ10vGhhCoIqPpYI2cG4u50TKZVr+UFMtpRsqjm7JUMmoedamEYbc?=
 =?us-ascii?Q?uLYZh9070fgasS6IPp/nKmzkwZXqspUGXwM9qmMDwFcR41alZxFnyu2Oked6?=
 =?us-ascii?Q?1E2TFHJNTjK4IOS3f9QbLPJzJoF29NEa/sKPWBMvmfmiUhIvufq+ng=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 61612530-d5a5-4dcb-0b9f-08d995374d1f
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 08:38:20.1714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 quentin.schulz@theobroma-systems.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6515
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Oct 2021 08:38:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2038

Hi all,

On Thu, Oct 21, 2021 at 09:44:49AM +0100, Richard Purdie wrote:
> On Thu, 2021-10-21 at 10:38 +0200, Quentin Schulz wrote:
> > Hi all,
> > 
> > Gentle ping.
> 
> I think we're all a bit nervous of changing this since tags aren't meant to be
> changed and we're not sure we've thought through all the implications :/
> 

I can imagine. `git fetch --tags` should update the tags. If `git fetch`
or `git fetch --all` is used instead, the tag won't be updated. In the
worst case, it's not updated.

What I can offer instead is to apply a patch to yocto-3.3 tag source
code from the autobuilder. In
git://git.yoctoproject.org/yocto-autobuilder-helper, here would be the
changes (**NOT** tested):

"""
diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index b2828e3..c1ab404 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -7,6 +7,7 @@ ypdocs=$2/documentation/
 bbdocs=$3/doc/
 docs_buildtools=/srv/autobuilder/autobuilder.yoctoproject.org/pub/buildtools/x86_64-buildtools-docs-nativesdk-standalone-3.2+snapshot-20201105.sh
 outputdir=$builddir/output
+scriptdir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
 
 
 cd $builddir
@@ -84,6 +85,13 @@ for tag in $(git tag --list 'yocto-*'); do
     if [ "$first" = "$v_sphinx" ]; then
         cd $ypdocs
         git checkout $tag
+       # yocto-3.3 was tagged before the current_version in conf.py was changed
+       # resulting in sphinx believing this is a development branch which breaks
+       # all sorts of assumptions. Moving a tag isn't best practice so we just
+       # patch it here instead.
+       if [ "$tag" = "yocto-3.3" ]; then
+               git am "${scriptdir}/0001-conf-update-for-release-3.3.patch"
+       fi
         make clean
         make publish
         version=$(echo $tag | cut -c7-)
"""

Also, we'll probably need a similar mechanism once we have a separate
switchers.js for bitbake since bitbake conf.py current_version is also
never updated.

On a side note, switchers.js is not up-to-date on docs.yoctoproject.org.
It should be showing dev (3.4) instead of dev (3.3).

Cheers,
Quentin

