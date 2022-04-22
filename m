Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698ABC49EA2
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.70])
 by mx.groups.io with SMTP id smtpd.web12.7287.1650626297974925167
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 04:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=lSbpLCJF;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.70,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHJBuTk0aT0itSN5HMNSq9riV4ZBEr2nIUK3EeZzTglC/wW5Og6Jp+KNNPcD+IEhWqiBRunn9wjRFcofoCqvYfk45WAH1wfbPeiQDkBb7t4+9BBwQFIW8fq+Cj5OULSmXBswjCFYBJEHJCNPeRe+jwW122X1tEZXCGp/8ZIU7pD5sONGzTYSyGJu/gFXWAN/SVvkUg+ChR5KqsSxnfBUt2ESv3AqIFe2/hmUkYqzdnyEztmrsPLSs2ibqmWX0VjO1T/0E9kXCTdUHwDNQtM+3sY/I81JHHEWNV1nH3joTD4HXW9Jh3UuDFZ3SmFqDuODj7Q1Ii7G46E9coqUtr8sow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfjP5HxSxjLk5iXbT3O9VLPHaVkfO/LbpjhQSylXNMQ=;
 b=Q5qWefw7Qy1MyLxTsS5m/BeaYLvmkZX4ucI3JOVHDIX+YV69UR+AYKvv9TQv4Cf8NWD551EWCb8HOiLrU6hZpHxWm9dhl+2I7XoA3k3R727W0f16fT41OsPNZnMdhiokOw9veC5beU7yiwhFzkan3Ui9ojQbUVHwSJVygVoQuMX+Zm4y2IVlNEHhFP1DqJPMpaxmz6iBThnlu7u6jrSQxpkJUOechzobUUSn46Okscmx0lMQWGInWuqzR1f0TMH0wTJw8unK0m5eIIo4LewO6UCuvl1vdsgwAhO3JJBMNGe5/wjUorPEX0DPRrgkd6igQ32U2OiNunEaiYQktU17kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfjP5HxSxjLk5iXbT3O9VLPHaVkfO/LbpjhQSylXNMQ=;
 b=lSbpLCJFDhdySl2EyxVXnn1z9M4VwiiiJD87V/Q4R4oFolWp40gMBpjy3suKrPe8zLzTJlXVDE5R9/yCRBAZ+bGk+mLywx0BkgAo0C2ZRKG26H4Ynn9m2m+n5AZfxcQe+dP0+GU/2QdD0rQs8lKGmYjsp0N9KgSUUhZZYz09U0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR04MB7021.eurprd04.prod.outlook.com (2603:10a6:800:127::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 11:18:14 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979%4]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 11:18:14 +0000
Message-ID: <882860eb-604c-786e-6694-f11b63c0f0a6@theobroma-systems.com>
Date: Fri, 22 Apr 2022 13:18:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] [PATCH 0/9] Release documentation for 4.0
Content-Language: en-US
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
 docs@lists.yoctoproject.org
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0053.eurprd03.prod.outlook.com
 (2603:10a6:803:50::24) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a39bfc9-1291-4b1e-863b-08da2451cb0a
X-MS-TrafficTypeDiagnostic: VI1PR04MB7021:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR04MB7021E6EBED4056DCF17539A3C2F79@VI1PR04MB7021.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	peH+W2xHcziG20JWrTmn57DmCmDZV8fiD2Z5azd6W26r++u59gFyBCW3aQ330r3mbv5O9/O0VHQhf4v6fx22Oesx2jJIFTLTnYYJ/Jm3HUsRB4xH+t7+yxpCxLBwm1pADJSrMhQ2WaQtSDvSy2/C+3rXECFjOQM+b1XKz1Wg0dEUhBkWlcEI6/qsQjQpgH7r22g+DKZgNpV4qd4v6zCwWYSacHVYjIi3BL0RxFBtmBSCfrRauiOn9JbxQNf4/fIeiMZx+eUwxOcmPZ7aqS3QAIuU4efe99DHknZKjCnotJIM2ZS349PgXi4nEqsP9VP+jt7axLmMT2tQ3iND6dYrpTWiRQllbc765UWw5nYrqP7ZSDNNEd3XoE+aXxSvqOagyDu4i1MRRVqB1jXuTg0l/47VBAZoHfVD8gX3zjV7HRxeSeIFH6spEkFJb7xDGBDZn8QPo2qIRmPIx6QcGExRdj0QwopL95HzH84st50kmaX6P2HQRXXRh1cpc2EsFwzu5SZtYY1DGnBiwMsA2RukXEKSqSFNgZ+IgOl1Xme6JXzdFU51jQ9nLLVBKtHHUtKEOXBCZCxqGgBPKCDUy6g56LW68uv+sSvrmwvuaZuTj38TSsw42r3B5nJtRJQLqvme+XJNy8mTH90rZ0r8zAgtl5EUY0WVZhRZczRQA+oF0SjApTTeC3J+jpc4rn5kMPk9qR43mdPBszcWMVQqUGoi2kYg04482eTUaM2/mEUWG80FKTebv2Uaz67P/6XCf4yQASTNvo4Zd8WNeUFUw8sE11gQW9tsQiK4sNaLFfJa6OFRgbV2A6umqbC70wV/Ijx0CQ9mW4PtySa4fjsa0x3isahZNO1oaVcF2JGGnZcvrAw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(86362001)(2906002)(966005)(31696002)(508600001)(8676002)(66946007)(66476007)(38100700002)(66556008)(44832011)(8936002)(316002)(5660300002)(6506007)(186003)(6512007)(83380400001)(53546011)(6666004)(2616005)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VmZCeVd6VlE3d2ozdTJ0N3VBU3puaHQvYWw4Z0s0dkIxaEg4d0pNdW5FSUlY?=
 =?utf-8?B?NlplNGhVd0xVRXBsNDAyZ1A5ZVhtSlcvWlhTd1M2K3dyOERPVENMUkc2TEV3?=
 =?utf-8?B?OXJXVHNZRURwaVk4ZTdwcXBROHdIUkZZNTJFRWVpOFVoeGZVR3pDZ3VpS3lW?=
 =?utf-8?B?ZkF1SDMwS1ptQk41MGVXdWNhZklPemtPQXA4MG8xRlMwQXNZeFh2SHdFUDVz?=
 =?utf-8?B?S2NObnFjMHlsSVo2ZW9tSEY2djBFZXVyZG0wcXByS0hBcWN1L2V2VGdNV2ZW?=
 =?utf-8?B?M1N6QVVsNnJRL3REWmdOdzVsRkhDc0RlakNGdDVpTnYvTnNZMCtuOWFoMHRu?=
 =?utf-8?B?TTdmSmxDbzNnOCtBOXNPK2U4NDhVbW1EOWdGSlJPRlNaQm1SNFhId2l4andR?=
 =?utf-8?B?QnhabS9QTjVwZ1ZzWGUxSVlueHU4bzdxK1AwV1JVKzYvV0tEdjNzQVNVcGxX?=
 =?utf-8?B?c0lyU0lYNnFvSmNuSGpkMWhVV1kwNGQ1TmFwMmJUS2dHWmZJUk03WWw1Y1J1?=
 =?utf-8?B?bnl0TThJNDNvTDRQUTJLM25ZZFhWOWtWanpIaENMUUJ3Qjh6NUxTblR3WHlj?=
 =?utf-8?B?bWdheXhPeFMvMXhpcm1sQzh3OTVXWC94ZHFtcm9VN2xxQ2o5Sk9keisvV1gw?=
 =?utf-8?B?Vkx1VnlxR2Q5RzJmV1B1cnhweUk0cENIa0dVRSsyTWxGczFuekhPNk9oa1da?=
 =?utf-8?B?YWJ2REFPSGhweHpFVlEzUU1RTXQyZGxjN09aOThBTTRUdnMyTWs1ZVpOdVEv?=
 =?utf-8?B?QjU0Vk42c0NYeUp1blFMZTdKS3V2U1hxR0JteFFkRHVxeGdNMisybVYvK0V6?=
 =?utf-8?B?YUhiMUFFNm5BNzhsUmF2QUQ5OHFIdnFpRExFZDhVK2tEQXl1T1Vva3JURUxy?=
 =?utf-8?B?M2pTeGRqc2lLVEh3Wk9DYXA2eC9Yd1Q0SFh6cmNRSDh6dHd5cUthUXBndUsv?=
 =?utf-8?B?MSs4Z3RGcjMxMGNrZXVDTjZtaGc0eXNtN3BId1NYVlBKeVM2UG9DaHE1bmp4?=
 =?utf-8?B?L01SMW42OHdHWHFjWEZzR3hobU5LUDlaNE5mQnZMeFZRdWlPUEF4VlJoaTVp?=
 =?utf-8?B?dmtCbWVzSkZnK2JIam5YakpwV2ZjYVpveCtuU2NRMUdpbU55Ly9SZCtCM0Zv?=
 =?utf-8?B?UFE4R0xpSTdFbkN2YkE1eXp2TzNyU3lYZzE0L1cxZ3NEM1NQdDlhcUpLU2RF?=
 =?utf-8?B?SnJFWjFVTG9Ba2FyMHM1RWkycjl2OWFQbXhFRnVjSGpSeisvZFRaakxzSThx?=
 =?utf-8?B?V2FDOVBLMWJhbjNuMVlBSTlaUE1xeUxOMEJ0ZVBWazRDdDRyZ01WdXR2a1Nm?=
 =?utf-8?B?Z0NHcUxPT3FpbjVaZ3RZcUZOWldsejRkVUd4K1hFRDdhSUJVTXhOZitFNTFE?=
 =?utf-8?B?Qjg3dldONzk0elBwOWM5cmJsaE5nWFAvdk9XcTRaeWdqVk1mMHAza3M1Y0kz?=
 =?utf-8?B?ZWs1RHBsZVk4MS9weEtaQ2doZnNndWNZMjFJczNpUzZ6anZiOTh6Yk5sVC9L?=
 =?utf-8?B?TXdpbi9zM2JTSVJnOU1JcFloMWxNM3pJak9Ld2RmendEb3lDRWYvWS83SXFK?=
 =?utf-8?B?WFdJb2JFWHBmbEYwcU00RmFkdzcvMXlxR3JORzlvZ0pMZEc0aVQ3enRqTGYv?=
 =?utf-8?B?ODhST2M2SkYyV3hzTjl3QnZZK3VXcTZpWERZUTh6enVWdSt5Q1ZiWTlJYWN1?=
 =?utf-8?B?NVBTeGxNbkRXd1ZLQS9FZE5GSFB1d2ltMjRudHE1RDZFQmVTZXZHdlNIZ2I4?=
 =?utf-8?B?RERqamc3N3B4MmNSK2N5ajRGOGJLRlo5djB5UFYrSytKUEJxS2V4eUp2c0Zu?=
 =?utf-8?B?Z2JsZE9QY0JHNU0yb1hVV0hwTXpyVmZOWWQ2TGsyWkMxT0JVVDV3YXJ2dnVG?=
 =?utf-8?B?WXJ0SWdQaWs3S1A3T1lycE14NmtDeDJSdzBRcnpRUDU3dEdvajM1bjVtKzBi?=
 =?utf-8?B?MUVwdHRwNmMwNHNrNGlsb29VV1hXMFA1dll5ZUh1SjBibDV6UkQ3bC9TK2hs?=
 =?utf-8?B?anhTTWtrWWRnYm9XNk40d3ZUNmViYm1GM2ZheXF0TFVvQVhXRUY0NGhzbW55?=
 =?utf-8?B?UVlEV2tXMG1HeHk0WkdsRlhWbUlzOFgvVTZOMzMzdXF3STJjMDBUczg4OFVl?=
 =?utf-8?B?Y05JOEVNYm5ycGtXaFFjbUZHcTBMUGVhcElmQUJQZE42Z0YzbzN3WUFDbXlU?=
 =?utf-8?B?ajEzWGVRdTcrNzlWTFErUFNnTWU5M1dJNXluRmMvSW9ya2NoUFNPaVVpVGhX?=
 =?utf-8?B?UVF0UmpWZTFWTE52ckE4QlhZWTV2Yk4rUzAvZ2U0eitjQTBKblNCa3dQQ1FQ?=
 =?utf-8?B?SjRnYXBORmRXbXQ0K0JYSnlyenhDWEdEaW95czhmVXRBUlFXQXFsREd2NXZx?=
 =?utf-8?Q?drXTG682tCFRocFGBdsOaPvWXdCw4r2KPFQDbs4Kgdhev?=
X-MS-Exchange-AntiSpam-MessageData-1: sRUtUo7rnKzcaTH6f9wnY0QCb6gaVHrSFek=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4a39bfc9-1291-4b1e-863b-08da2451cb0a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 11:18:14.4699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 feFntirpruk/EdF3wt9InORRPv98c6TET8iR/XLxKaHcPechtQDRavHlwXkc9laNc1v46OL+bzb8wmVnO+GEox4yj4MjdySUu/ZUFWiZYpOn3NbbA47Uyw+LtEtVwdQF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7021
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2840

Hi Paul,

I assume some of those patches can be backported to older releases too?

Cheers,
Quentin

On 4/22/22 03:40, Paul Eggleton wrote:
> Release notes, migration guide and related changes for the
> 4.0 release.
> 
> (Note that the "Repositories / Downloads" section of the release notes
> still needs to be filled in.)
> 
> 
> The following changes since commit 4755961bbb5f674a7532b91cca20ea44a1e22ae7:
> 
>    docs: sphinx-static: switchers.js.in: do not mark branches as outdated (2022-04-20 17:24:31 +0100)
> 
> are available in the git repository at:
> 
>    git://git.yoctoproject.org/poky-contrib paule/4.0-release
>    https://urldefense.proofpoint.com/v2/url?u=http-3A__git.yoctoproject.org_cgit.cgi_poky-2Dcontrib_log_-3Fh-3Dpaule_4.0-2Drelease&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=EqIoJ_y3tXq4uqljGtktLeB3Ce4KlZ7iOyvGO8zY-MH9jmvcGSTX9RH691L9XyrZ&s=jmO7ie5Ed_r5bswYDAHp8Eagp7v2v6WRkQbvsFjQh-Q&e=
> 
> Paul Eggleton (9):
>    migration-3.4: add missing entry on EXTRA_USERS_PARAMS
>    ref-manual: add a note about hard-coded passwords
>    ref-manual: mention wildcarding support in INCOMPATIBLE_LICENSE
>    ref-manual: add mention of vendor filtering to CVE_PRODUCT
>    ref-manual: add KERNEL_DEBUG_TIMESTAMPS
>    ref-manual: add XZ_THREADS and ZSTD_THREADS
>    ref-manual: add empty-dirs QA check and QA_EMPTY_DIRS*
>    migration-guides: complete migration guide for 4.0
>    migration-guides: add release notes for 4.0
> 
>   documentation/migration-guides/migration-3.4.rst   |   7 +
>   documentation/migration-guides/migration-4.0.rst   | 345 +++++---
>   .../migration-guides/release-notes-4.0.rst         | 864 +++++++++++++++++++++
>   documentation/ref-manual/classes.rst               |  12 +
>   documentation/ref-manual/qa-checks.rst             |  10 +-
>   documentation/ref-manual/variables.rst             |  48 +-
>   6 files changed, 1161 insertions(+), 125 deletions(-)
>   create mode 100644 documentation/migration-guides/release-notes-4.0.rst
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2822): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_2822&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=EqIoJ_y3tXq4uqljGtktLeB3Ce4KlZ7iOyvGO8zY-MH9jmvcGSTX9RH691L9XyrZ&s=J55Nz0TXFpYytNngHFC3pd65fTpEjZji0l5Mg1d9Qdk&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_90619754_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=EqIoJ_y3tXq4uqljGtktLeB3Ce4KlZ7iOyvGO8zY-MH9jmvcGSTX9RH691L9XyrZ&s=_eT6jo22vBbP9p7Y1I_vH1sXa9h1SMpErlXnr1lzopg&e=
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=EqIoJ_y3tXq4uqljGtktLeB3Ce4KlZ7iOyvGO8zY-MH9jmvcGSTX9RH691L9XyrZ&s=RTytxGd1r9IcSjWTNsu6-Gfw7N3gNMCI6Oj_f830xFo&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

