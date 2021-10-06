Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E15C433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 08:20:08 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.66])
 by mx.groups.io with SMTP id smtpd.web11.9074.1633508406198385270
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 01:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=BPeyE2iT;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.66,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A18zVbrK4fxf8vH9hFhAzlRGWCki29J8d69adsby4FuOEKU0+2zuiTmnbJaYqXt3buBG36EjS4HKtBJuSdoeML/POnTUSHv0numZHTHtGYPJodd8yrB+j69gs/kmGVE27824oJhwUGARu+SjODBvyhffCWzNtXS/1CV0pAG9Nyq0onhn8MJXj7yiH2UjDo3PUx4Yo0litCBhCgwncq1hR3xLsK9QOVSRNpTzWRK26YOaMWt+FUILp0hz/Xm6D5saD60mQl6QTR8V8uN6oUuLHR8SFOlC+3LmLovt6+1rbUFsu7Vb5syvWWzB4Jk7ZMPMpTIo7kDKc/YKjxBZ5NCoxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YD7rzGHI3KNOkUBL34yoG+KBePfkTnHofVhrs1fF1Tc=;
 b=BwxzZFYOFVkPNALR1/hjamGSr5BUllOoppbkuSfTbC+17dzAOklYk4FWyJ9MRkqHPfUf9v+eZ/ZM8XwMJjd8MOIl8TrTvY83O+mX4dVYexFiO+LQuU/6HCGBYZ8/2fMY8MblcINAp/yqwawBIypq01rDFTD38KcSE9C9Z+Xd6NpHx0rweN3B2INlwfs2D/DRyx3KKbNNY+4yxJcDkT3Zw6Tg5i5ErxX62ugKplzob5jRMeEtzuRFp0Ou8vJQT02RE128ZvBcXoHpwb4Ek7NpQx9ugtx5bkt+DQ/KFK/oWUvNG7JfWXZjuPMEPysDK22GjBHIK0XFYCtWc34sfN9oNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YD7rzGHI3KNOkUBL34yoG+KBePfkTnHofVhrs1fF1Tc=;
 b=BPeyE2iTbKIm+riL3jKRA++LUrJ2pwptyOI6NaaNuEe6+qaxx0G7gIGeT9qtLrEaL6Dfb3JNHrHXkpQ8urH1KMfjyLFC3rt0UCoRz1ei2oqaWzUGdC4/JNOotbsDcTGFgYO66Cp7kCE+GZAU+eWPU/XM2/bA0XjMk1iqiN+6/Wc=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR0402MB3524.eurprd04.prod.outlook.com
 (2603:10a6:208:1f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Wed, 6 Oct
 2021 08:20:03 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 08:20:03 +0000
Date: Wed, 6 Oct 2021 10:20:01 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: correct NO_GENERIC_LICENSE section
 title
Message-ID: <20211006082001.rgqhbh6kwpu2ybnk@fedora>
References: <20211006081525.952523-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006081525.952523-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: AS8PR04CA0170.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::25) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AS8PR04CA0170.eurprd04.prod.outlook.com (2603:10a6:20b:331::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 08:20:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11e4cb55-20a6-4129-a5f5-08d988a218e1
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3524:
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB35240E30DE90A19B12779134C2B09@AM0PR0402MB3524.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pGDrbGT+614NQtY9y0fF52xqky+SvjlpgRkxQVDL0H+tXUh9xRzORda9LF/P0iP+TKecybR+qeTlvamjMV8Dzg2J6rsYmZoWrtfSebhhNMGIAXINqIFLPCJKUA54D6llbIQdA6v18hjHNcznVPo70Y013ouiqZ6dwrjGDjof/H6l25Vk0wxt7jeAtlAHEfqv8atphQrjD6EHLU1UIhhrlvY2NImV7YUSbuFxk/f0SUJ0D1KXtFdpwcGdP/SQCJmYepPzXWNAqZ+RlUR1xQnRvIkqwrEkC4IyKdJPtJJGGG3euLF0r11zIq5D1EmpbGXTyf2ljqVcwj0r0XVDwrqhnovrHWQf1vdEBzpEobymkyVy3oZ+LHWlNkHK9YHjZeaMx2NMBzSzJYFgJniG3/BP/OuLwgHh6aQ/oqNGnNGEUpUeRnleUk+6s1kqWvumY0m6Ra2NOhZIHi0HCD8z8+uIn0BqlKchmlNtMF5Oguwx9Q0d9kN1x23hfH24ECbRkFl1uAk83SVwrBFUQcgspIolGs/+6JO2yJ68VLC0qd+D/i/O/7pZR8ZoqqqYZuCMOQCixZ+nwPsAoNXLxOuqSWTxn7X+wYUpV3sRzKygi+7+0F64kdS2lHfegCq5CU/eRixuUqRIW2oJ028rrWBUb1Ub69r9RBxarfCsukXmOXw2K3GEWSRAy141qtiF6r+y+0t9v6zxb5wHbEtzkYgrPYDnwjKzlGups/WpPQ+vIRYzIUw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(4326008)(44832011)(186003)(9686003)(26005)(956004)(66946007)(5660300002)(66476007)(66556008)(6916009)(508600001)(316002)(6496006)(83380400001)(1076003)(52116002)(55016002)(38350700002)(38100700002)(2906002)(8936002)(8676002)(86362001)(9576002)(33716001)(41533002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JCHmrAj4J/V5HtfT4XU1ahYDQoDYe+BEKj45vQc1XoBTWtzUvTGTheuZ9Hhj?=
 =?us-ascii?Q?pp1iFNJfoAIQcCv3at9PPkwdNNFN3blqxD/coduk4Mc1cCoSBX+VWOS+lV0B?=
 =?us-ascii?Q?9ugr4qN+sPX5my5WHEnAXejCZNsljb9QJisQSTpHZZX2DN7EiAVi7ht0Bc6D?=
 =?us-ascii?Q?hMA7VCh5I2X4ZC7SqAmU1iFO3Le/+aUwJP3xMsqSAOaW8sptubhGJfjLQstc?=
 =?us-ascii?Q?I0wbs0mKiPS5w6hJIL0PjzDOwBGnzH2vCNq865J5TPz1ACn8KC/TwQddzJe3?=
 =?us-ascii?Q?aNWIyj0ttnEaZIq2kPfkm8LLlQ84PeXdGqSccbLA6iklpTqYSEzlZVe+bV71?=
 =?us-ascii?Q?LArNJWQW05gp1Gy/Kt77dIT3mocqHXJ3yB03ReOScApD+Chq87MxPjF5IGIo?=
 =?us-ascii?Q?VZOLDmpFP5c5OkQva2L04nLZcKuCjooeh7wDynu9STYU/DrNOdw9u9yHFa/O?=
 =?us-ascii?Q?UwKqzQcoBErmE59pfLdzgovxr/8Qdcpuoh+z7RE8BHPq1d5TmQQ7Bo/9a9Zv?=
 =?us-ascii?Q?y88dcQBIXK5uV59ZZiKKEj7TmO3TtiKK5qtwvXyPXyy8zItlEeA3d2jF6U/F?=
 =?us-ascii?Q?7iYaABZH8fIO3F3TKmmm6Z7To8CGNft+hgzO/zAskhXZojryLml8tdtTashf?=
 =?us-ascii?Q?ZDLIDutVb8JS9O1taXirU2uT50rVTjmUQKMvowVkpllOSJerGAECs7fLG7vh?=
 =?us-ascii?Q?abyp8UsfuOF1kGj+uBvvyfZ8YuE/BmDgoHq+aWfwMtFyZJ8TIWIw1fFULvJN?=
 =?us-ascii?Q?20vYMetRTlzxWuwctPSzrqUw02TJtXUfY8wb46zFWHHxXK0zIS4oqw48gAM0?=
 =?us-ascii?Q?36ylWSeG6gQUH2xY35fg7/Tbn5DT/xe7y088tbtdiAHNeifHone9U2RhhT6T?=
 =?us-ascii?Q?pLMJsVCao+pohCLPLJR9/f1zMrlw+rsUln1RMFj1vLXyS8IyFIp+IjWx/DfI?=
 =?us-ascii?Q?aZwZEzkxs17F1jYiSkVwIb6So2WCMxiIMciErUXhM54IWbThWlZ/Hfl+NPNn?=
 =?us-ascii?Q?R8D1ZEt/pYPUmbpYSO51sh5vL4yc0SRoegyDakck3bAWOLi9n11aALBE+imq?=
 =?us-ascii?Q?eazVzOwIgL1QMhuEKrgA2+c62jHvxvqXBzqc2REe4k611c6jvmsTusD9W9J+?=
 =?us-ascii?Q?XaxpqYoFIqoCaFHVX70M23kZne966+RKysITGIvlbSPThIUF7Lfip21+9r73?=
 =?us-ascii?Q?+K/tBtEMEyIV4HaNr3U59xcLH0B/bBK0kitkzxkHBMUOH4LEjcFQAWuobym6?=
 =?us-ascii?Q?wEXKrSXu0z4yCHBfXHBm+DWa2FwOeDHbZq0SMIVJmeSFEl1Foh5ZhtoiNCpq?=
 =?us-ascii?Q?/sJbF7keXVB9yoEe2aEnC2fe?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 11e4cb55-20a6-4129-a5f5-08d988a218e1
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 08:20:03.5195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Nff0AMbLtg0eL/28WQGX4DbaI+n9WXeiuLkLDwTVt0JNQQfOsBSS3/ET5yolGc02MzycxkFY1Ast9U4qjML0E/sivbDg5zo2D7OST3uyuTmXbPU80UAdK4Rz9M6FCHot
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3524
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Oct 2021 08:20:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1921

Hi Michael,

On Wed, Oct 06, 2021 at 10:15:25AM +0200, Michael Opdenacker wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index b81f51bf83..bcc8d056c0 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -11159,8 +11159,8 @@ For more usage information refer to :yocto_git:`the meta-spdxscanner repository
>  </meta-spdxscanner/>`.
>  
>  
> -Copying Licenses that Do Not Exist
> -----------------------------------
> +Copying Non Standard Licenses
> +-----------------------------
>  

Provided this is not linked to from anywhere else (in which case we need
to change the ref link there too),

Reviewed-By: Quentin Schulz <foss@0leil.net>

Thanks,
Quentin

