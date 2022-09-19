Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7466C54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 15:37:41 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.84])
 by mx.groups.io with SMTP id smtpd.web09.529.1663601855062672534
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Sep 2022 08:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=CQhiGzGU;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.84,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEKoZLJGB8w3jVZs5C1rptCBw5Hk/M42auW1g6wQd3aRbrSJA9fUgp/WjfhpRUDVtR0w7rV5dTBcaxyyXJJcqo1e5R53W3vjndQDen5QCAh7UuWgrrJLpDXpHJ3U1jioGsIBwIrvJWoCy+UY7+Es0ls6iEjX6huiIRDslqICSNzURc0SHVardsuVpJrgFljpZ/t5QdqkZvBDaYaiIiGnSftVxOmeEOfvvChzlUJPsyP/Nq9RcRQLUwJtuCuSQrxUQ/FNoCoaQ+wF6mGZeexuxIEx4f7xuSgfduwsIqfJqbM1KBgdh6q54bwYpGkThOUxLVVd/i30bnD51yqxZPnSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKu9XqYDr/eZ9fnyd9OXNz47j1zJXvx7K5IfZdiduP0=;
 b=QCdNn0sgegGQOKeE+XNaDadjoJRvzqcVTIsNPqRzOFgl0aYJ6YIyXU0SeVCgVE+UsM3vjh9sByQBwAPfnjL681X7NqU0CpS/3jJOIVP9DZQpgUYNQv71+Bm2SD9NWIu9F0NUdMeYVPGz8fCxq3zXQ5F7+/QEQjjoKF4ZXAZAal9reZsK58JGUCiw88TBDTtTjTxuh3S/7KAOUwtpYEU2g2oLh/3hOd/q1wK3jFc+szu67j6L7JQQWWdqJaGD/2R/ToWaNgtJ6dXlfD0TC5pZRUlHfdFVhSI8Utob5A69yb1gJQtCqttyW4dSVlqHqn4a1atOgpWg9Q3sGWT0EEZ+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKu9XqYDr/eZ9fnyd9OXNz47j1zJXvx7K5IfZdiduP0=;
 b=CQhiGzGU5l867ICBN4OojQVOZRTKFqPFBtlMdpQz1NnAr3xcxu63j/KG1Iqr2vxbzzdxDiq7C3E7nHnYZXIC0f2aKqrziDp+ESxNMfww9OVvoNRPuDF17oSu1N20R9LvYUj82GByGr2felWxmkyNYUNZ5cExPEQ8ZTZsDB3li7XNNROjzrTuvFMmm6PctuHXKP78RN5tYtCuettkLm38to+rrjoPNech9EhMyD9ekoUtao7TKO2Ww441HGSrPVHYNHYB/T2WNzKcsTecMkjy39mHPwz7m55cfuB6q6a5PGbtMEkrXrSGB+P3fzarEeNmQqHXjZcIT9+WAcUtoSDk7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB8255.eurprd04.prod.outlook.com (2603:10a6:102:1ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 15:37:31 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 15:37:31 +0000
Message-ID: <18ed6fac-5054-5542-9d60-8e833cfce162@theobroma-systems.com>
Date: Mon, 19 Sep 2022 17:37:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [docs] [PATCH 4/5] common-tasks.rst: describe the layer setup
 tooling
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>, docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220911172608.2542076-1-alex@linutronix.de>
 <20220911172608.2542076-4-alex@linutronix.de>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220911172608.2542076-4-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::13) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: daad9e0f-d182-44f6-f3b1-08da9a54dd7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/y7G972rgM/v3MABmkFoOaInM95iTQA5+a3w7PVB7oDrwbTtTDaBLztEHXgVYFB+ga/SsadtU800WCWHYIbh/vHG4s/F8OZbEf9qAcaPQ4wito89ZNJ6oE2hHNbeUNe5IdxofnrqMCECXJulQ2V6N2ULq2JOlzzOfvDQQ5CzUAmDs780dsor4ZJDgOiqPlDRmQZ9q9x+3MGUT+XwZQqVmv7NRltXKDrKmzVPiikm6suA/XYuauJYThaFVNFKiVlm05gw4fgYy+9iE54nP8djsDaojY4vhTAM5HRW7SKmVF9cdTc7Agn6ClP+b58jWT1QMV7lyUTW7lG/yOIEY4nKmBIjHjEpgN8Ugw1nLp9Iy998W2ghSrHc45L4+j8ww61BTiDhZOqW/LhUrlN1x1PXMx49wFddArFx3GPVnExPJF3zXoO7XjJx+3ndSkemtKatQOoVgrkHn7kYeibahbC9aVh5MdF85XPumSTpqXKXS8vJOTrhs7LjTCno6eBN6GcESxqTyI5KZ3PbOPf7G8xmJ0mfbtjHJP+hUhU+BriXe0F15eqfzSfviMNxfVdrfRD8Kgknm6mF4J+LHtARVYET/dtvF0OsRI6HUJ+0yZ4fAmdTr+mWKbqnkS/7c2R+0Utyw00g2e9LQ0l6MV+jvdDe3hx7h1UE/2CWEuIVdZYey2ZuYeMlB3NdtO5VYTuqAkB7MSC4ds82FJbRd/Tw3+Qq1MNhX8nAiTj8FeAKZMbhIsuPtgUUw+MRmYfY604LocA1whl/kdmlgndeDHEaSrZBY4ZrHPfyDkCc5R46qpn0RwM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39850400004)(396003)(346002)(366004)(451199015)(66946007)(4326008)(5660300002)(8676002)(66556008)(66476007)(31696002)(86362001)(8936002)(316002)(38100700002)(83380400001)(53546011)(41300700001)(6486002)(6506007)(478600001)(2616005)(186003)(26005)(6512007)(31686004)(44832011)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1VnT0p6NWdFVzlZcTFDd1NjNFA0RzhxeGE4a2o4YU5LWHMyeDNqVjh2N3c3?=
 =?utf-8?B?WTNveVJmUVFWUG4xTFh0bEYya3RTY0k4dGk5aTNEL1U4T3hmU1NFUUl5emVD?=
 =?utf-8?B?L3hlY2dlUmlzTlJRVDFMWUx1aHdZVnJuNENNbUFPZWpFZng2OXJjWjdlTkNw?=
 =?utf-8?B?QnhGbXBRNmNCZ3VNcXdEbWdieUVkQ2txaWF1N2hHZW1EQUxkQkRVQzJnTHUz?=
 =?utf-8?B?bHlsVjZaaDc1Z1pULzNJcjZBeWwyKy9qRUVUSGpPRis4Q1dpa0cwQkxTQ3lv?=
 =?utf-8?B?TUlsSmU2ODJibkdyRlI3WVVNWVpDUXdrVkpNY0F1dDk1a2JkV2dDN0NtT0Fl?=
 =?utf-8?B?d21tTWd6aCtZMHBiVVJjTFpXd25jaHNkK2lPb3NyMG9HUlR2c05VUlg0eTBw?=
 =?utf-8?B?NDI5Z1N2RXJ2ZGxZcEdSRFdiMXhOUzRpSWgwNFlOR2szUzdQbkVlUmhlUHEw?=
 =?utf-8?B?VG1UQmt5VzZ6WENUSUROaE44WGFQUDJiWDFva0xpSUhyUDlMSnRZb2xPVFpH?=
 =?utf-8?B?ZEFTaDhWZzZmUmM1c2dkSzFTbHlrRjlNOG1mRE9lQnlIbGdkL2VkMUtsUEwx?=
 =?utf-8?B?Y3cwY0ZXNXgrcWE3UEpaRTVCRmlzZWZmdXl5S2ZEYXJsUnVaVUUxZ05OQ3pO?=
 =?utf-8?B?dXhZOS83cnQvWDFnSlJRdmxwOFc0Zmd2RDVRVnEwRzh6TFQreFhtZUs5dWVX?=
 =?utf-8?B?dTRQdkxnTHYyVFRGcHkxbE9yRlphSWhweUZFWTJkRGg4RWY3MlZlNFMvUzl6?=
 =?utf-8?B?Yll4bkVNc1RWeURQcFNtTFppaXZCeVRZa3pFbGNxNVpWWmFFbTBDNzExMUdV?=
 =?utf-8?B?ZVdsS1RvaVVYMjdJZHdnTHcyZlVXaCtuZ2pFbGZxdURsdTU4b0R3eVlja0Jk?=
 =?utf-8?B?RWRIeDVUbU5xY3NjY1Zhb0Nkam9VTkx2QmxsOTI2amE1N0J3a0RHenU5MUVY?=
 =?utf-8?B?V0xqL1FMZ1A2N01oZjYyL3RhWjgwNUJVZ2NHcy9CTXBuZTZ2ZjNZQ0xEWXB1?=
 =?utf-8?B?Tk84eThVWHpKMUlxU0JockZYMDJReHQva1E1MnBZa21RRG10Y3p5enp3Z0hZ?=
 =?utf-8?B?TmdwbjB4R0ZtVkdteFBwMUE1aEtJZjFoUVl5NDdhTFhkUk9EZW9JeXlKOGYw?=
 =?utf-8?B?Q29nMUZxU1lFVDNvSU1CMHM4QzFBSU9QdXJMVjlEcEFGV2NyNDh1bDdkK082?=
 =?utf-8?B?eHdqOFdFQmVVZmx5MDhTdXhjUDJ3MWJxeWxEMnQ3Yk8zaFJSc2JCeFJQd3Rw?=
 =?utf-8?B?WkdqQWFjT1VaVzNFMTJXaDdkRHdYNllMRWFPWUVicGYydm4vKzVJSURtbE5q?=
 =?utf-8?B?dE5BSWs4WE9pazZVR2svaU5hbUs4N2xBTERBR1VDa0wrVmdrVXlDZHNIc3Rr?=
 =?utf-8?B?OG56aVpwNVkyblFQWHJSNEN0RFJRanpCZUJobmdDUFRXMEZic3FCUFdSczR5?=
 =?utf-8?B?dkpKZTZZQnU3aTJBblNZMjN4ZXM3MkoyWWlkc2VnaWdveW94elF6U3RpVXl1?=
 =?utf-8?B?VEVlMHUzZWJiM3k0SDE0RGM0aU01MEo4ZkU4UTZINWNocU80amd2YW1iVm11?=
 =?utf-8?B?M09JeGNiOTJBNWNxdkNCRDBmM1JQM1VuRVVJS2pTSS9WUjRRS28wemkwTEFO?=
 =?utf-8?B?U29jc0xQTzNiYTUrcEtETUgyQmFFU0dxQWdBQ3VlMmR0S2xXK24reTJST0Z0?=
 =?utf-8?B?ZnJ2OXhPVUU3RmRXWkFOZ0RGWkFCSGRyMTNkQk1rR016QXF2WU9HdGU3Y3NB?=
 =?utf-8?B?K1NoeGZ0b1BGSU5kTmVxcDJwK0tmbzFJTmNNR283aGVxcTRoRmMvZVQ5R1JI?=
 =?utf-8?B?bGwvOG43M0wyUkltN0VjbEdtaldzL1ZuQUtQbDNQdU10SnZYVlVmL0JhYlZs?=
 =?utf-8?B?anJ5UUM0c3FnT0NOczdHdDdzcktxK3c1WjIxL0ZFdFFmZnpqU3NDZnFIMDJw?=
 =?utf-8?B?OHA0QU1aem9XQWhOVzdxUUt2NTVVaXd3TUdBNUdmZ2tvaHFHTENzRWVoMEtN?=
 =?utf-8?B?eldiR2pJa2k2N2JDcHBNSUQ2Y2NvVGtZL2ZlR2xsYUNtS0REaW01ZjZlRE5q?=
 =?utf-8?B?YnllSFl6cGhzT1c4RlJFOCtuckNwRHduZm1JNFZvVmVjUXVZelo2ZlhhUTBs?=
 =?utf-8?B?aWkrRGJ5VWt0ZTBxZ3M1N1QyU2x3T1oyOWl3VHMzYi9SQ2R6VXFMdG5oZHlT?=
 =?utf-8?Q?0vPBoIHRX3P2mWtyBoGgQDw=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 daad9e0f-d182-44f6-f3b1-08da9a54dd7a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 15:37:31.1349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xszo2k4n/YAeQMWoECBfybDjwX4Q6Ur1k0ofc6WmxIUHLMQDJCqTIo1LvasHS2S107MhEVP24DbuZdhlyfD/ZcOcui0Xu7MVgLHQDw9iUE9oRNEDEDcgCVlsqQMV8Gh5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8255
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 Sep 2022 15:37:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3175



On 9/11/22 19:26, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   documentation/dev-manual/common-tasks.rst | 54 +++++++++++++++++++++++
>   1 file changed, 54 insertions(+)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 4d19bd921..6c2df9aa6 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -858,6 +858,60 @@ enables the build system to locate the layer during the build.
>      During a build, the OpenEmbedded build system looks in the layers
>      from the top of the list down to the bottom in that order.
>   
> +Saving and restoring the layers setup
> +-------------------------------------
> +
> +Once you have a working build with the correct set of layers, it is beneficial
> +to capture the layer setup - what they are, which repositories they come from
> +and which SCM revisions they're at - into a configuration file, so that this
> +setup can be easily replicated later, perhaps on a different machine. Here's
> +how to do this:
> +

Double colon here to start a code-block.

> +   $ bitbake-layers create-layers-setup /srv/work/alex/meta-alex/
> +   NOTE: Starting bitbake server...
> +   NOTE: Created /srv/work/alex/meta-alex/setup-layers.json
> +   NOTE: Created /srv/work/alex/meta-alex/setup-layers
> +
> +The tool needs a single argument which tells where to place the output, consisting
> +of a json formatted layer configuration, and a 'setup-layers' script that can use that configuration

Replace single quotes with double-tick quotes to highlight.

> +to restore the layers in a different location, or on a different host machine. The argument
> +can point to a custom layer (which is then deemed a 'bootstrap' layer that needs to be

s/'bootstrap'/"bootstrap"/ ?

> +checked out first), or into a completely independent location.
> +
> +The replication of the layers is performed by running the setup-layer script provided
> +above:
> +

``setup-layer`` script

Sorry for the second mail, missed a few things.

Cheers,
Quentin

