Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8D4C4743C
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.78])
 by mx.groups.io with SMTP id smtpd.web12.6929.1650623448050481705
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 03:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=VrrSMbzE;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.78,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tocvi+X9VokGEkoSnbbdaqSm2nC5ot0YWo8BFHQPqJCAQs4k3WW4wQ/YzEFlGRSgwM38zhN2Ux7N9650XjavcUyBGY2U5f3Yh4TeILwI1srB304Nmk2AOEopLHnBlCKYP4g766YKbtVPOX+xv3lBaMSwsYN8FsMcO6vT708IxyvSOmqmDj9L13oDJTF1K5wpxoiSlLHbuLQFJDEJAJWR+Ftp2/DbNjz+HWZ+espjK+U0Z7cpEYOb1quB94r6WEz2qXGll+bO9zHXfiqWZ6uNrzDijOhR7cqYh6AmBvyKF1DygcO0M7UpWDBxcKfE/hoH3psvX8NWN27TQa4PhM9sOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjwB5YyNgBlxJXS26O0fLX5K84VInRofQQeWW+NiAZg=;
 b=WmV37vdtdBFl82MWgRZBArZ5veV6rfLIDpE1teFIIQLvj+y6g7DJzOmBcFGeONJqYEfjJOM8HwRVki7H3OEFQ6N3RbXqHkfS7J+ttxitaLngf5QP06vGGINYeD/m3ialKntrtHxc4lTl2zN6n6J5kr0IHhWquoA9b175GvJTG4SBgEQeQqEE6Y5A2EJzTP/U/j8UQGJ/oDojkbqPSq3/Q9/CPU3wgJiJivDwammDjrso+puyUrkhgiqjSc5w5hmFq5UdqdFlLMfygdri7AGmv4W9buNY2x7eY4oQZett6AxUmmECSfYurV1H1fF2tf5W8QMfebm+Gx6eAFYKcio35g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjwB5YyNgBlxJXS26O0fLX5K84VInRofQQeWW+NiAZg=;
 b=VrrSMbzEmMN+AKmQ9wxQaH7js43ZBiBqUlI60fv/x6WfOVK3mwuRPbIVvro+3r7pFvV8z3ivkRIoIUnkJ5+EObFHMnUClXQSpl3VZLLEC++L6nV3qq6OcQxpppVmt3JNp+Vaimjwf5fWtVZcd5cbLmO1Siv4uwZrZhYO0vrwX6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM6PR04MB6616.eurprd04.prod.outlook.com (2603:10a6:20b:fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 10:30:44 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979%4]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 10:30:44 +0000
Message-ID: <4ed50a72-e184-a1aa-3ae0-6fad861bc273@theobroma-systems.com>
Date: Fri, 22 Apr 2022 12:30:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] [PATCH 1/9] migration-3.4: add missing entry on
 EXTRA_USERS_PARAMS
Content-Language: en-US
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
 docs@lists.yoctoproject.org
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
 <ba92472ebfa6fad1a0ca73327093afaa9e30374b.1650591341.git.paul.eggleton@linux.microsoft.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <ba92472ebfa6fad1a0ca73327093afaa9e30374b.1650591341.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0182.eurprd09.prod.outlook.com
 (2603:10a6:800:120::36) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b423e3f-af96-4748-51ce-08da244b2872
X-MS-TrafficTypeDiagnostic: AM6PR04MB6616:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR04MB66161298F889A974EB008B5EC2F79@AM6PR04MB6616.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tkmaLIS/TaWlWc4L1u4wtc6AmGbI1jlq1U5SqpLMLCfo03lqTy2Rbc5xItWsJijwxY4GgmVk2t9kMX3Jk5+vkUwghixnEUFyEXOWX/3tZQBT5Mu6NrjlXq5BjxAIfSiquk9vOiYwsUqpI8LZlzbbMeNs8rIGFsKflMlj9oxvb4R7do2jucMi28AFjH2pl/VmfxGbKQPcHhvt+uEuShCmSURdSH3qVq570w9LXDHexdoDwgWtvFhhWvFiJsT6ekf2KR1dAGOTe1yGyjXFRwilKmLydS5WbD/0Z0SKr443sO85Yo1Y3lse16rfQffyeFzy9X5cE3/30M8PmBwDuUN3q65MWLxzOMMAEteyc9e6QWcEL1cv20pPkSClHbB/EM1N5jWpHg4iuKmsOC9jf5Hrcm4OsPj8gg7K0TSAfuxDgfuOM23wRtusVLbGzz30fStFn/ZV3AOCRLvUKNYVefZOx23LqczW5uuFVhF9PUzb+6loKezz14Q9NBcnYLP0uskarGTn+vChHRoKT2STLPLWaPMzRhqzRs12fngy7B0R5osT7OcWiHB+h0mW21Et8ISrUpaxpG+D83//UNYvUJ5qvmBZw7jenffi0Q0bM5IWd3+dfVBX496NuHrtYspwGwkfxyD/rv5YVIgm6sL6I6KSd9XPAPreKEqVO7jpx0APhZ06vVitJPLBCkrBskazVRxF2rRVxVe1qmKAqQ6Thqi425XFKBm67Mz0YL3+AIQ3NP5K8d66VrpXbzDCFjPvOQcSCGr0j5fLGphiK3KQoFnGO+9QtwNAo+K4jAcGrwCDMP5grLA9auNdVfxkkNcgV159
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(66946007)(5660300002)(44832011)(6486002)(966005)(8936002)(45080400002)(31696002)(86362001)(316002)(6666004)(6506007)(6512007)(2616005)(66556008)(66476007)(186003)(83380400001)(53546011)(31686004)(38100700002)(508600001)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VDFBMkpabmFsMGpVRXNoVkg1VFdXVFNRV1FwWlRubDg5Z1RRdTl5a1BaaGlh?=
 =?utf-8?B?SUkwWW5zQXREaXlGTDdndFZ2UW5wMGpKOC9PVDNSYTltTTRlZmw4N3ZIZ3Jx?=
 =?utf-8?B?cHliS0dJRmJlTVBsV2tQc2tsdWczZDNtK0lkd0syRHptVzZtTXFtYVQ3czEv?=
 =?utf-8?B?U005a0I2c0U1dk5IeW9HbDZVYkVaVUpSSkdPbGtWenJaZXp5K1FhQUhXeHRa?=
 =?utf-8?B?N010MXpwZUJCS256V0ZodmJhRlR5QnZjQlBERzVLbHlvVzF1MXBGaWVRK2Jm?=
 =?utf-8?B?blh4OG5rYWxJYnlIMTgzVG8xQU0xdVVZdmc4Vldyek1GVFY2SkxHTk80K0tQ?=
 =?utf-8?B?dUQyenZYek9jR1pDT1ZDbHRReU9LYjF2cmc4SWlDTFk5dU5PRVJ5SEN2dGNN?=
 =?utf-8?B?MkxnWXVuSy9oaTNaZ3hGZUVmQzVuTEs1ekQvOXJCU1hXSDQrbHhlRTZyUFBL?=
 =?utf-8?B?NUlITElyZXJ1TE50c2I5TkFyMXFyRlJuWm9ZbE1XNGcyaWlsUnllTEFDMXRy?=
 =?utf-8?B?NURPVnUvZ2hXUFhGNmFub2VyTFdBRWZkSnJVNUVKV3ExdHJZYTZyWklwMk9B?=
 =?utf-8?B?dlNPVG5TVklvcUZoMW9RUkFCSGM4Zzc3VkNmVWFIbHhBSk12ZmYrREtOTlRJ?=
 =?utf-8?B?QXJDTW0zVit5OWZsUWJDSGFZSitodTR5UTRYejU1OVZ5a21JN2tHNE5pbjdj?=
 =?utf-8?B?dXY1ai9zOThxdEFYd0tzN3N6azJXSWJYTDkzRWxvNUc0aTk1R1BqWUlTbncy?=
 =?utf-8?B?Q1hnQ0pXakQ3UVdvWFJXYW53ZjZYR1IyenFFQmpHV09DbVliYStwTE5LVkxj?=
 =?utf-8?B?U2VSMWxFWnIxdmRSTEZ0bUY2Y3U1TDFyOUFyMzBxQitucVRFWWUxbGhUdzNI?=
 =?utf-8?B?Q3FSNmllNHRLWk1WMjM1UTVnSzhtUW5yQ003aWNlT2FhKzdUdnV4THVKWmJN?=
 =?utf-8?B?RFV6b2M4eDJyLzRvaU02MWZZdjRyRWdXcmpWcjV2eitBREVJaDJCcHhNMEdZ?=
 =?utf-8?B?cFI0aUpSTUUyeXk4LzNtQW9lalQyNFNnbVVGbXZqVFJ0NVl0eHJFRm40K1VL?=
 =?utf-8?B?WE1hODAyM3BzdE5hZWtUdm1QSVdRZ2NLWWFKeFBrVGU4bDFlQVJ6bk42emFJ?=
 =?utf-8?B?MWVrMTc2NmNIYTU3Zzd4T0pOZ05CYWQ2bjlWVG95bVBIN3FlM1VGMXF3WGM5?=
 =?utf-8?B?SC9DZGdVS3Y4dUo0SGp2VXFYRTZQckZhR0w3TzV4U1lpcUNKamNISHNjSVRF?=
 =?utf-8?B?OUhmczd1b1d6SHIwSDJUWk1PL1RqOWhSZG9Bcy8wMXZ5K0Zjc2h3YUZMb0I5?=
 =?utf-8?B?RzdQd3Q4U1BtbGMvSm8yZmM0V3JGeXE1ZHlKRGJCdmdwcENmQVVabC9rRnMw?=
 =?utf-8?B?V0hZeHJqUm15anEza2dQVk5qb1BYU1dKT29yMlIvWTEwU3UzMHVvZE8vK1Uz?=
 =?utf-8?B?R3FQc1c1RnRGUy9SOTJqSnExV3dIUVNST3VpMVhFRU1pZ1hybzZXOUZkdDBX?=
 =?utf-8?B?UzlsYXRxYUlaQk0rc2FnbkZXSnA2VWJMdk5uZzdBNXRsTnBaaUE4bytzck1t?=
 =?utf-8?B?U1dsYUxpTjYveVA4SlF2SHN5dnQzbUFwVWlITlVnQnhSOXN6bTc1c21RTjR5?=
 =?utf-8?B?QWZhYlN6cG5DRFJSRUR3WWNiazd6cnN2TVpxY1hXdzVHcXhKMEh2VXJERUxZ?=
 =?utf-8?B?VzE3a08vU1JhTDI3RFp0QkhNRVdZQUU2RmU5L1g5UTRia1lSS3VSWm0zWFpG?=
 =?utf-8?B?QzdUem5HcHFIUzlzMTEycU80MHhOWFhKYzBOclV5OCsxM3hnU1drYWFLdnFG?=
 =?utf-8?B?V3pxWUtNUU5kcGYxb3BKR2JFcm9SWkwxenJoK2IxNzhuODI2OWFGTWo5TC9o?=
 =?utf-8?B?TmpKQSttVGdFVUU3RUN5MzAxNFNKbVFwNkJSNXI3Y2RVMjJiVUtyMXlFNTQ3?=
 =?utf-8?B?N01aMHNEY3dzVWZ0R0tZbEFHeXF2WUJnd0w5eDVIc3pCdGpvSmNTcFdUSTZi?=
 =?utf-8?B?YkZSdFN4em1HTXZXU2xTM0pINGFHQ2lzREV4RS91c2tJN1NEK1Y5M2pneDl4?=
 =?utf-8?B?VnpzenkxenBVcE51VG03ZXZSUVZOS1c4NUZsWlVVTnJQaktpak1NUHFxUzlm?=
 =?utf-8?B?QjJGTWNyWkJ1N0xpU0ZWeWZzU2lvc1Q4N1FwTjcvMFd5clNodVNnZEtXeHhB?=
 =?utf-8?B?QjMxRUthc1RhaUN0T1lYV0g0ci9Ed2d2dVp6cXFhb0lrYXdYS29HYW1ndHE0?=
 =?utf-8?B?c0xjd01EcDhpelcydWN5emZLcThidUtxblk5WnE2QXdiSW4vZzBxcEE5TE5X?=
 =?utf-8?B?VUpFZFJ6NXhLWEMzOUVQUUJMblNxK3d1S3F6cmtsK1lvdXY2dVRjSzRVczFw?=
 =?utf-8?Q?TcJkHgx2MByugcSKpxCqRtyAKYiZ7gcvOFdgxuvgqeFGY?=
X-MS-Exchange-AntiSpam-MessageData-1: D2SwTTeCpZ0cdl6sBOpLYqtPMfVWExV2kNQ=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4b423e3f-af96-4748-51ce-08da244b2872
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 10:30:44.7636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TQwIMEt6jEqV0rRZVC9uiS7RH9cvq4h23hNVZnJnFVAhOYskVWlL6Uiz8pEKohvvW+0c1DrY/Zy2V++Tl97VLjoD/5xBT0NQ4SveUxiwsuzZ9sMzckLbc58bXzUgX9Kr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6616
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2834

Hi Paul,

On 4/22/22 03:40, Paul Eggleton wrote:
> We missed noting this in 3.4 but I noticed the documentation was
> recently updated, so note the removal.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>   documentation/migration-guides/migration-3.4.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
> index 139b2bf..dead6bc 100644
> --- a/documentation/migration-guides/migration-3.4.rst
> +++ b/documentation/migration-guides/migration-3.4.rst
> @@ -265,6 +265,13 @@ Miscellaneous
>     built-in override support in the fetcher or overrides in general
>     instead.
>   
> +- The ``-P`` (``--clear-password``) option can no longer be used with
> +  ``useradd`` and ``usermod`` entries in :term:`EXTRA_USERS_PARAMS`.
> +  It was being implemented using a custom patch to the ``shadow`` recipe
> +  which clashed with a ``-P`` option that was added upstream in
> +  ``shadow`` version 4.9, and in any case is fundamentally insecure.
> +

Nice catch!

I would say that only hashed passwords are supported now and point to 
the extrausers.bbclass doc here: 
https://docs.yoctoproject.org/ref-manual/classes.html#extrausers-bbclass 
which explains how to do it?

and maybe we should mention this in the EXTRA_USERS_PARAMS actually in 
addition to where it currently is located (extrausers.bbclass).

Cheers,
Quentin

