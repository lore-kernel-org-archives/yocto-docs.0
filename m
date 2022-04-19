Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819BCC3527D
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.76])
 by mx.groups.io with SMTP id smtpd.web12.2061.1650358868355408710
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 02:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=mS4alYVV;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.5.76,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lli4XA42O6+jQNHTfVxXD5EBM4RYU32Oay7c06c7WjkgM9IJndh3H6movp326F9xavdLMWdHVUwv2p7nkayjWNZnNLJJHOGzRGglrrxHR0op2tc0tCDMS3OAAxPuAhYPebRoG3FJD/cCxv7rEYuzbwh60P5XWNwCsZ4Aimq9J3hVFciN1LEx4zEdoFZ4l4uH7e8txASoqHBOa6usY7ArgopDC5PVlzJQUKXjZLInfrfiWJCzGxsxYLe22jPziQ6zSfIdzOiu0vcl0xZiTI+HkQq93P4ZJHFbNO2+Prf9u6R3kNYn7e/+8xPF4xzuLzCWnZI8q2hdG+IUCY3AZ0JEXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZJVLNitYQ1vy4UtcdY+ap3qfjL2KmurJ8ShqmQ3Q2w=;
 b=YJNg8AT4dx0hPA/kKU4SmKsJ+UJLpA9yq3ryD4CRikTVZrKEK+f0hmlgAtds0EXGxxV2Yf+FSoFACvHmaQRlbGIgJYou9USfor3oFD5/g+8COYVyh8IhyglGNVunXq50UHiJlttq1y3maw1MZmMQLBvZ+v8+PNC1tGgkI3cDbPjzKPh0RrHI+QJWxfZ64sGMzwCZX8BRc22x5o/EkuscuRLHl3IQMlVxinhD7DrExA+EWjZDsJnXiU/Z39nJKFzc2aiLpIfHgOaeH/WtL4IdlYLQu0zlKQNN7OL2bmQBT2MStsWol8c8d9qyA7WdhD/kTIQYv9gRst/dMTeQa3+Irw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZJVLNitYQ1vy4UtcdY+ap3qfjL2KmurJ8ShqmQ3Q2w=;
 b=mS4alYVVXt7o5QMCJou8CJux9GLRcJwYIaLPv6JYDE9Qc3FJf6SvmpF7JdqAjMc6KyTQ28c5StSLlvASYNbEvSxwxtNTfE1uKI/2Z0qhPMauvqgqeWvJZ1KhnxjOzVsPqBdErCt0OOOrFXR7HLf7Lelae/Z/MIRnKjJ/RFHwbsU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM8PR04MB7361.eurprd04.prod.outlook.com (2603:10a6:20b:1d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 09:01:04 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d58:89cc:5b41:f13f]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d58:89cc:5b41:f13f%2]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 09:01:04 +0000
Message-ID: <845c45a9-35d2-cb3b-b978-eb5c12b2911b@theobroma-systems.com>
Date: Tue, 19 Apr 2022 11:01:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] [PATCH] yocto-docs: profile manual, added banner at the
 top for direction to most recent website for version 3.1.3
Content-Language: en-US
To: Abongwa Amahnui Bonalais <abongwabonalais@gmail.com>,
 docs@lists.yoctoproject.org
References: <780350cf-fb98-e73d-ebaf-a52bd059fd70@theobroma-systems.com>
 <19595.1649946998868590268@lists.yoctoproject.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <19595.1649946998868590268@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0237.eurprd07.prod.outlook.com
 (2603:10a6:802:58::40) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecfc4372-69de-4a7d-7ff0-08da21e3224b
X-MS-TrafficTypeDiagnostic: AM8PR04MB7361:EE_
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB736129270DA4A67195EC73BDC2F29@AM8PR04MB7361.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hs8pBbMnGKFOfr3tut6YwDh34aaBioaK4E6MNO3f1P22dp/ZOtlt8cRZe/kBpG4Dk8sYJUv4estUo4A5jUrX0kbBBKIi7O8Bc7zDXPgJK2bVGlrl9wvr4OWQflXGwyZ2pLh0twOqKQJzj01fAPzJ0ie57iGawr0I1MmR+1StliARRCtaPQmt5VPZAgXrTAvMlGmgNFkkyi+MuueRTmO8YD0NJhLR2OMLVz3XPcfgC+JEZGP/UBq4anhBmE/6ZmjIweLFRKeTvPyFQTEnejCO+VLPicCRLCyMNKOqx2j6hk3eOTqUKJWUmhlUuyBXxicv8FoEUQB7iA8ZWhlHuJUVUQSVLy5jw0ofqEkokflF7P3gVvork4VgHhibDHUuGAUbqKOQTYyGdbRsR8b6C8CEIbIN8ebB/Z9SKX/beig1J4I5qY3kCWMdgBA3rCQGDm8N2uER29iyEGMgf4qf+EwHC0wi+NtLLMFYmsSiZCqZFG/oK8SIjWIGyg0fa5FVghso8fyrzoQTdMRPV68MuUy+M4u+enE1e8uL2criEU2lgvs0ztSuRrLg/p/7h00Q6rKQ7U2DJpABoH35o6NXMvoU6BQeOScmrM7n9JivxPqLyJ4WYftfWj0GhtQWocg1ObCRtPmDpxvJIWZTdageV6fP3C8nFq/vpArclJ1URThbOUoavWfxUEKWIP/tZPNxTrgJ4GBPh1jUT/pazHCYVOiZOJ2bUQCMmlcoYeGYX3QxMDEdKbTJ5cTc7ve+2u6HE00E/uwDG8JeaKwDEDcj2qSkEOqbohy7mUQ9OdoqRw2q89oieBxNhlAh42/JqUDh+QK5IdbKnePnwoF/roykT6RQcF8asyF6KHlg4i3DDqvtWtRrQ+CmJr8XYCmSZpQtwnGV98jgjMIpMne2zUV1GRszEw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(186003)(966005)(6486002)(2616005)(86362001)(6506007)(6666004)(31696002)(53546011)(2906002)(8936002)(83380400001)(44832011)(5660300002)(6512007)(36756003)(316002)(38100700002)(66946007)(8676002)(31686004)(66556008)(66476007)(66000200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bW15Y3ZvNkNtV01QWXpVdnVKUTV0QkQ2TnEzWDBwVXBmMDRlektnMGh5V200?=
 =?utf-8?B?NC92OGNPbENGQVJzVWtmTjdYcVBFY0R6ampNNFgxeDFFYzB4KytEdnB5M1RP?=
 =?utf-8?B?Mk9ZdTh0NytRd2F5N1NOVk1EKzJhYVRzYk4ybm11bXFuZ3NXaHRaSktmR0Fr?=
 =?utf-8?B?cDNMY2RYbjJ4N1ptdm42eDB2RmJINXp6R3RZOFlyVWVuNjFJbFpZWVJqcnR4?=
 =?utf-8?B?Qkt4TXdkeEJLczN6bW5vV2tERzFjN1VUZWEwSk9VRjMvRStOMUVwa1dDYXg3?=
 =?utf-8?B?TzZqWkJpZ0ZjMTlDZ2tib0tBaXE0U2ZLNkY2UVVDTDZDMTZVZHNmdnd4bmxB?=
 =?utf-8?B?OW1ETFU2WHl6RzN2Z0VzVmprbDhibnd3OHF0VmFtaWRrVHZVNTNxTkZnOURE?=
 =?utf-8?B?VWNVVVEvMUQ0VFFIWUhEY25zNmFCU1E1L0RKNVZwTmM3SmR5Kzl4WkVmOXJC?=
 =?utf-8?B?QnRML3JCdXdVaW5aQTlEbk1KaERZajZZK2gzZmpadjBXUWh5eC9PNXFYMjM4?=
 =?utf-8?B?S2c1ekpYVk42WkxzdkY0Y3JvYUwzakNqeEt6VG5icHFLdElGblFrUmdvb3ht?=
 =?utf-8?B?YzVITStHMEUzRS83YjZMRHR5VzFPSUxoYy84SU5tMzhuQXk0TG9JSUJJQXE1?=
 =?utf-8?B?aVN4UTd0NGlrcktMVWs5SUxZbDg5U0c2YytRNFEwaFlmOTFLZE9NbTcvb3Yw?=
 =?utf-8?B?T0JBdWJhdk1jZDVXUWMrdHczK1RSblg2bmFUdFB3U2xHaGYyUXU3K3JoYWZX?=
 =?utf-8?B?V2tZektpeUxIU1NVYXdUMWx5c1ZyMGpTUWF4eFd3OVZ2WlFQRkJuekFoQzhJ?=
 =?utf-8?B?ckNMUG5jVTZkdXhxalpITjJZcUJLYkVqUk9CUVErWm51VWFGWnhwUGpxbXRZ?=
 =?utf-8?B?TGNiVjJqV0ZJUnZRcFFzakxZVFlZU3NmYloxN2M1MExlb2hjNy9rUjhKbTZG?=
 =?utf-8?B?b0R4Tm5EUDFpdTFNMlo3SlQwV282NmphVGtqeVQ2RGFaOVhRdCtIeC8yM09n?=
 =?utf-8?B?T2pLYWo0dUhnckRVejkyTWVNcndBUDhTd1dxVmJPUVpaL0VXVkRVa3dWZ3pU?=
 =?utf-8?B?bU9tamNWUWRoVDc0UDF0L3YrSkU1cXdvSHNTR0dsUXJpYjhMVXM5clpLMkdi?=
 =?utf-8?B?Wm5PZk94WUVjREQ1ZUN4SGwyM3dYVlJNTFd5czdGek90VFVCOHlXQVk5T0Rt?=
 =?utf-8?B?amRBSHMwUVZLbHc0K3dDdmZCQVlLM2tib3lSaE0zWVliU3FwMVdCc1doOUl0?=
 =?utf-8?B?OHhKK3JOY3Q4T0Jpd0lTZVljTDI3OVVzZndKQ2xSVENmUnVpM2loSDZUbll1?=
 =?utf-8?B?Z2s1ZUhlaWV4SndPbUxOd3hIME80NDZRTmdNN0QvZDJJRTRZUDdSMDhDMG0w?=
 =?utf-8?B?bGF3Q2xtNnBUYkJsYnE5ZGVjbDNWOTNwTUszcnY4R1kvMFVzTmtSNktEaysw?=
 =?utf-8?B?L1UybjdBZnhnbno3OWFXRmd0V1Yzbm50KzE2QU1RRFpZaVB2ZldWQlRQK0Nk?=
 =?utf-8?B?YnYrbFFtblFJVFBrS21xdVo1bHBrYkRQaTJhbGdPVlZDTjkyZXRzMUdvYmVN?=
 =?utf-8?B?em4wTGQzREZZeHF2eUFJcEs0VU05MjYza0ZtWWVFV2dvUlVMVm56REpGTjlR?=
 =?utf-8?B?Rzl4bDZUVkR6YXA3TFhxVGhmTkFnMFd5UHBJNnRJK0N6V0J4R0xyY0FYbGRu?=
 =?utf-8?B?dForM1BwSUNJcG9pNEYzM1VwM2kyWTd1NzFFYlZOR001YlZ3L2UxRVFleEQ4?=
 =?utf-8?B?RFZhS3lTajBuaHVTeElsZWRFVVlRS09KV0dSMFdETWZPemVhUkpIeVJqbE9Z?=
 =?utf-8?B?akNwWEx4UDVSQ0ZRZjZwRmpML0kvZ1JnMWlzRHBsc0lBbEZMZlRUV0IrNE9Z?=
 =?utf-8?B?SXN0T1AxMmduZGRKSGw5dStZSG5IWDc3UThuSDNITS80VFdmc0dkeG1qU01F?=
 =?utf-8?B?VTBtcEhjK3pHcW93ODRxQmY3b3B0TlZrTnUvbVgwZ1FkUnVxbzgyV3VKcG5T?=
 =?utf-8?B?QUY0bnVXaEM2bCtSYTRBYUFDRFRiRlJvQ2Z2MlJLbUxoNExvbjhETkFhUHlK?=
 =?utf-8?B?WldmWTB0TnVybVBHZ01KOTlNc3ZnclBhMnFWdTVjM0ZseHVvMmlabzJVYXcz?=
 =?utf-8?B?TWcyWCtDUU1sSGNJRHJtZDhoKy9iZzNhWTU4aTYzTGN0aG5LUXNDajJXbmtp?=
 =?utf-8?B?WEJEdHk0YkJpU0p3NVBPQnU3NDVPV1B5V0tqUDU5dS9WeE8rUXE5U2ZueS94?=
 =?utf-8?B?SE1GbktwbjFlZGFaSHVkVW5rQlloWk9FNGZuMXRqcitsYUY0cUVPSWJDUzhK?=
 =?utf-8?B?cnVQdFBrc1hvOUlpZGNLMHBoNDFLNXU0V1NjN29LVmdvdE1vWUowcVNUbGxE?=
 =?utf-8?Q?SvFXiD13oaLjPRZQaIpp+va8fZ7oic3pbFFKoarHG3pFd?=
X-MS-Exchange-AntiSpam-MessageData-1: WkJ6EbXmGH3/PYJ0zv2JL+sUN63bz1BVe1k=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ecfc4372-69de-4a7d-7ff0-08da21e3224b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 09:01:04.3949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 F8QluoMLEZra0F4bevQRilkyN0FHReuHDJxh5PfANOu5c7FfSFLSfTvgT3KjjoBoOFkBRZb1ep2fyVb7lZlmS5Zpkuj/g3yowFZgVriY2IDY9Ty/dIJQ5OveAV6WBUsS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7361
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2785

Hi Amahnui,

Just as a side note, most of your mails are directly going to my spam 
folder for some reason...

On 4/14/22 16:36, Abongwa Amahnui Bonalais wrote:
> Hi Quentin,
> Thanks for the review,
> I did the changes and will send an updated patch for it.
> How do I generate the docs using https://urldefense.proofpoint.com/v2/url?u=https-3A__git.yoctoproject.org_yocto-2Dautobuilder-2Dhelper_tree_scripts_run-2Ddocs-2Dbuild-23n30&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=r_YYPHwgWQWonlQ4R0-hCuxHUSxfOMH0MldT-b6vCal6sYhWkZtrMHDuFKkzyLJV&s=x4IXi0wCgjGiVHOMdgkOzlb3-KTA0afHRTsTfnXF1xo&e=
> I'm confused on how to use it to generate the docs
> 

The arguments to give to the script are listed in the header of the script.

What I usually do is:

git clone https://git.yoctoproject.org/yocto-autobuilder-helper
cd yocto-autobuilder-helper/scripts/

Here you want to modify docs_buildtools variable to point to the 
buildtools script (don't know where to get it to be honest, I know 
https://autobuilder.yocto.io/pub/non-release/20220413-28/buildtools/x86_64-buildtools-docs-nativesdk-standalone-4.0.sh 
should be one way to get a non-released one though). You also want to 
modify docbookarchive variable to point to the location of the 
docbook-mirror tarball you downloaded.

Then you want to comment out the rsync calls and that should be about 
it. Then run the following:

mkdir build
git clone https://git.yoctoproject.org/yocto-docs
git clone https://git.openembedded.org/bitbake/
./run-docs-build "$PWD/build" "$PWD/yocto-docs" "$PWD/bitbake"

Hope this helps,
Quentin

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2771): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_2771&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=r_YYPHwgWQWonlQ4R0-hCuxHUSxfOMH0MldT-b6vCal6sYhWkZtrMHDuFKkzyLJV&s=0afxvmvNcCQ_6_IOebB22n-aCzzHXcJskFVkW6s22H0&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_90461516_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=r_YYPHwgWQWonlQ4R0-hCuxHUSxfOMH0MldT-b6vCal6sYhWkZtrMHDuFKkzyLJV&s=SJ5fXNVS5HXKdMpCFc-lmcJqcKoGG06p2YFCK9NQXuk&e=
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=r_YYPHwgWQWonlQ4R0-hCuxHUSxfOMH0MldT-b6vCal6sYhWkZtrMHDuFKkzyLJV&s=cTG27GeTv--8el0lwC1Q6Yrb_etZ5g-scrCOo1E8loQ&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

