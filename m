Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE356D0C84E
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:47:51 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56165.1768301258807197572
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 02:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=iygEMLXY;
 spf=pass (domain: cherry.de, ip: 40.107.159.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLfkSwjaVSTzX2HAkeMM6aGZsptIaFeaWHVPXhmiBrPZH+HojRtZtUCzNkT7MS2DrzMtRDgl0Dz6poYM83qSkLfoqk5sS0c0vAuAGUbPzCa5DT4wNrxZSZzKAsQ68yOpZoaKJ9U2miuvi4J1WaMi6HfO+qgIbPmYDGi/s86k//g8efuguspS2pQfAeoiMHZqhnxD25Hp8gDh23EHvx+X3f2Byv3soKjSk3EACav5C4nqxT9eu5e7JHWTEEX3YYamV3qoU5K7xml+4zPpq4jjgZQd5VK3YJQsBKhp21GWZec7ecaL/04mAcYhgfrBiVsNJP4BEy4KzkfdU2z3UI5iLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tGo1TOQ0vNqOyEZEj3oPz+pdBrt/zRUT323Um0TWPw=;
 b=u+jcpvKnOHDEPB8lqKbrUpSd/3tC7DcuUKH/mgRfSsFpMJjVFC2FQQ5Rcu/GmdLB+ZExQ7NbbPXANyMxzbkotZWLHNhgo5gidF+qQJ5x4KJZOH0uzdp4cgVxm+ia81VpcuWNYHy9Gy15fgfoGCPZtXzZpnz1DalEUT+95ln2vPZDSt/51s8vhfHRyl94sNS1r7GqXU5JhM4Z23CsoLYUA7zK7QnErWnT6cBecyN91sHJQz5iLoRaB9/1IoCe9zSqkCdwRuQ22Grb92/NCt+OAuXF6tRhRF+FOcreQN9qELxrr7shucFweMqYXbjVC6XZYiF2/wieQeXNqm9ZwQmUQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tGo1TOQ0vNqOyEZEj3oPz+pdBrt/zRUT323Um0TWPw=;
 b=iygEMLXYQaVwbfHG1nVs3byLArGrFEdKAr2ch6GQOx46uJo/bXo9Vn1vn5YaIYxqzyo+ITqkM9DIBOz1lvvMPu6tSh9LMsHWph7qK38YzipryvVrDmyEQPMxcg5jbVWnmFcblNdQ7kUDcIuadpTXwSaD8FJzknU7zCdgZEewlq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VE1PR04MB7488.eurprd04.prod.outlook.com (2603:10a6:800:1b0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 10:46:05 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 10:46:05 +0000
Message-ID: <81723c84-aecc-4b04-8bf0-2f7828b66a9b@cherry.de>
Date: Tue, 13 Jan 2026 11:46:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 02/53] dev-manual/start.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-2-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-2-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0286.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VE1PR04MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 5914c57a-c0f6-4781-6c32-08de5290f3de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?SStvam1EZDlrbG52d0NuSkRHaVZHNEVncVRpY2tMbTV5TkpMMFhrc1RVMC9O?=
 =?utf-8?B?ZFBlMzBySGowSFhiN0dPYmU0N2JTRjB5R2lDN0U5T1FFT0RqOFl6Njl1ZE9n?=
 =?utf-8?B?L0xNNW9KYlNHUGxVVGEvdU85WHZLRXByaHh4NE9FaFNvMlVGZFZpVVpHbGNV?=
 =?utf-8?B?YVRLUThjWDU2VHpDRGdWWmY1NTVtUXE4OFpLWGMrUFpYVytjQ0FOUGlQdTFQ?=
 =?utf-8?B?cU1YUDVRa3FSMFBMMkFDQVFXSVhPMmJaYWxMR2Z5RkpjUU5tNTZZQmpqWXJD?=
 =?utf-8?B?aTBwLzQ3UVFHSHZqUGxsdVJWVVZSRGl3N2hsU3ZUTnBKOTBwNndBTkszWGVB?=
 =?utf-8?B?UVNqZlY5dm9PZXRwdWZCNG9hSWVaT0o0b2swYjRHM3M1STdncW5oNjZMdFNq?=
 =?utf-8?B?WXgzcGZpU216bWhrekVPazJiYTM1Z1pWL3BCRFJrc0hzNEZNTDJWOGlOdWV2?=
 =?utf-8?B?ODluaDJQTWNwOVorNVVOdzgwYm5TK3d1ajU1djVLWVIwNmphVFNUWEVDTXda?=
 =?utf-8?B?ekdxRmFNVElicEw2NWtYeWxDdjhnckhEaVJvS1VTUFhEZnIxakJTc3EvYUc3?=
 =?utf-8?B?dVBPYVcxMjRQRVFvb2FieGN6cjczSk5XN2xJeG8yVURsYUNVeDN0d0xabEZa?=
 =?utf-8?B?ejN1MWEwZGI4UWkzMUswZGFUamY1aHc3bExpVVpVa21kekQ4TjdCb2d0U2VJ?=
 =?utf-8?B?azhnNEtJS2JtUGpPYVJlaWpXRGFSKy95blowUlBWVTdVWTlZL0YwOWdraVpO?=
 =?utf-8?B?M01FMm5NM3RTeDBLcm5wWmZOTHBzWnVvb2ZWaUZhQWpkUFBmYklDRWtycDdq?=
 =?utf-8?B?blJINUZUcjJxdWFJOXdUNXBocVpIQ1R5eUNMdnVkd3J2QlZJWDdrc05TVzhX?=
 =?utf-8?B?anloU0NWQStWR2tHcjFoTEVrRWN5L3d1Y0htdEJYVVdpTDZ2a3RSZUQvcm1R?=
 =?utf-8?B?dEdXS2o3aWhCTWhnSnlVUUpEZmxYZGFJR2QxcTNNRytHVENSWjhRSjJVcmVU?=
 =?utf-8?B?Qkl2SVNRY2k2UUc3aGpOeDI2M2xJR0RoVmd5emY5SW5QQkdwYXM2Q0pVS2Z0?=
 =?utf-8?B?elhWTi84TlB5aWhiaEcrQUdzUWt1Y2t1b2NTVkx6eWVsZzlnWFZtcEZtczgy?=
 =?utf-8?B?MjJqalNTeTFRYlkwYkRvc2hJekMwUU1VMldDQTg3SnowcnFtcDVSeTZJRWh4?=
 =?utf-8?B?UlUzV2d2eFozWlBRRjhRRFJvRmxlTURhK0dLcG9uS2RmYTBqWjkvV3Z2dmNH?=
 =?utf-8?B?YlJmSWxWLzkvaXZtalU0OEdaYzVaSk10YzNlajlYTENaSXRFNTYrdWtMbmZQ?=
 =?utf-8?B?YU5wckd0RVZpQjVnV2xEaWpiTjBPdVNNQWx4Qk83SUV5eWJDbWs3RjlkeVlX?=
 =?utf-8?B?RFJXRXpHVXVBcHJVbVhhNmZSNS9ocUdYTXVKWHl2aEJ3SHByNDM5ZTgwbVZ6?=
 =?utf-8?B?ekc5bGp6VTZJTEhUaVlzTk8rR25zUE5tRlQwNnpITnp1djFSSEZpVmlVczYy?=
 =?utf-8?B?VjVLSThJYTVvOEpwTlpDZVNkdzdQZmNtR3MzR2F0QVdiNk9HQU5PL0tVK3A1?=
 =?utf-8?B?bUxucEZUeDg2MjZmZFhITHdham92eis0Z1FNSm1EeTdpNjR5bS92L0htRml5?=
 =?utf-8?B?ZlNRSWJsaTM0RCt0aGZ0Yytqelo2cng4a0I0VVUzSEQ5dTRnZDRuQ2h6aVlm?=
 =?utf-8?B?UWNmcURHWGRVNU5kUnlIeDZPbkxqQ1VPOU53WmgvOFNTcW91RWRxbzh4Unp5?=
 =?utf-8?B?STh6eGJ4RllSWkVUd0RNOEJpbThNeWZEM1NHclhzNjhuNVZFcjVzVUJyUkZF?=
 =?utf-8?B?RW8zMy9QTkhLR2liMjQ2bS9BZDRHNW1LZWtlZ25XMFZLbDBLbGtYTEpjUlJT?=
 =?utf-8?B?SW1OZm1sVzVVU0tRT090dzkvSVplRXlmbUJmT3ArL0xwRTluZVZUMUlCNE1i?=
 =?utf-8?B?NXkxVFhTVEQrN0lRaEVkWjZOQ0QyaUJKeWdZNzlHNk9JQWpDL0IxMEMyMU9t?=
 =?utf-8?B?TzkzUTZpeitnPT0=?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?MENocWh2VGh3NnNzLzZCcEJtTEF6Z2FGWVR0US9kV3RQWEZFb3NyQzI4WkRp?=
 =?utf-8?B?QkI4b3N0ekNMMERYZlFuNU93MDBYRzE5a0dOWXI2aGtaTjhZQzl6WEhkVTF3?=
 =?utf-8?B?U0YrOE02eCswMHkxRm1KY09OUDI5MCtIRWRKUE1adWdnM3dBVHVPb3QxZzFr?=
 =?utf-8?B?V21jaTF2R3R6d1hiSjVUL09ta2ZIL2RScXBKcDR5OVVYSmxlU3ZUMFhqeFZx?=
 =?utf-8?B?bjJHQzFHeXR6ZjJhNmkvb0lhZkJ1TEM0VDVMVjFyYmZLdHY1U0ZCOVY5eVF5?=
 =?utf-8?B?M3VvTkxhK2VkWXRZQ08yU0Nvc1ZYTVRvaldNY3VEKy95UWdQdzVkWDJEdDF0?=
 =?utf-8?B?Wm9GeTIxOFNkY1ZTTHhtNzVnVjM3S2hSRi9jY2dabStPRlNhL2lSMStBTVJO?=
 =?utf-8?B?TTUwNUtRVFM4K3lZcEpHMFIzSHJWT1RiODlpTWl6aEVIaVV2Ry94WklBSHBX?=
 =?utf-8?B?T2ltUjZOSG8zWUxsRU10dVNUelNhSGNndllSRjB4SHp4Mm82TGdPMzhpQk9Q?=
 =?utf-8?B?U01qTU9sZ1FMVTQ3SnBnNDNCU2tiUmcrLzdaZkYycDdsQmVpdU0wdjlkMkJ6?=
 =?utf-8?B?aFdSMzV3WEFHVkFya2M4YkZXTjlxbTBWMFlsWkFtbGcrMGNwVzRSSURuNDV3?=
 =?utf-8?B?WW5zUDFUZ0JhSFdweHY2WFZxT0U5Wkk3V2lGNVU1NmZBTURXVER3Ykl6a0dC?=
 =?utf-8?B?TytPeDNiWjBGaFpGSWZQVzZCdUZvd3JDR0pKK2hKeTB1cGJTY1lHRFp4UlhC?=
 =?utf-8?B?K3hWNFFvMmFwSnh6STlKOHp5Vm1YZFg3eU1sSHcyTVQ2VWRzNnlTa1l3cllq?=
 =?utf-8?B?b1NYR2VQeHBUc0ZJSmF2eEIxb1A3ekxUVU5Ld1c5RDVHTTd3bnBoTm5wWnVY?=
 =?utf-8?B?bkdhNGlTbXh3cFA2bXB5bTZWd05pOU1yM0xxNXVDT1FSVjdXalpNMkFoYXdF?=
 =?utf-8?B?OFM4bDYweDd2OHlsbUQxUGpoTkk4VG5BeTB5WDFlMHlDYTZJQ2FablBrN0dr?=
 =?utf-8?B?R0k5T3RwSHNlNFBzTGVxZU5BUEg4KzRUUEtiVDNxakJLb0YvZC93MDBjVStx?=
 =?utf-8?B?TlMvRnMzbnlpTUxqeTVKVHRuTHgvM2phenNNVzM1cDFnTkNLczBBNTNUODdv?=
 =?utf-8?B?UnhrT1h6bFc3MGNEa3ZOMHorQS9WclZOcE5PWEZBZS9Wc2FxeEY4dnJCZW9q?=
 =?utf-8?B?RWpXZDQ2SDZIdlVITU1QMnVLY0kvMS9OdTBNQWFybHFBQUlQNWJ3SWV2NC9R?=
 =?utf-8?B?WEplaGdBalp6UStrSSt4Sm0rbHZoUHNhbTdJZW5nVE12d1Fka2g3TXdGYjRo?=
 =?utf-8?B?MjhxMmJFSFZLR3poMHdVZE5VbnJSOGRTY08zZ094L1BvdHJtelF4cSs2ckpT?=
 =?utf-8?B?dzVDQW4rYXV0WURUUGhGL3lYT2ZuOHIyYWZsdThPOE9YQmhjVmVHaTVqL3Nt?=
 =?utf-8?B?L2NPMzNmblExZUEwdUZrZGprR0RlUXpxRllWUlJaalpBWXNZYzFzSmx2MlVr?=
 =?utf-8?B?OFdialAxZmlBQmJ1OG1FSU02WjJ4VDlXV2Uxek40L2l4OEtVczZubWo4QXVk?=
 =?utf-8?B?Ny9DNFlrSTNvcW4yUkRuUW1SK3lndVVwbStFSnV6Nm1kQ05ITkk5MW1RWjZC?=
 =?utf-8?B?ZnplTG1KdndpaVdFNlc5UHpLNnVtRVhXZjczSXZNaExpbzBYUVZ0eDlNaUlt?=
 =?utf-8?B?TXc4UFYwOGxNOWFXMDkxU2swUTlpRkVaeFVHMDNYSGlMV28vOVpRVUVyZ3la?=
 =?utf-8?B?djhFS0xkMkU0Zmlvb3d1Y2lLQ0tvdDNMc0JEN0xlMFd5QVZWOG9wd3RVTjRO?=
 =?utf-8?B?SGhwVkJoL0hPY3hvSWtsR20rdUVHYnpOQmJ2M0svYU00ZTRLNUdjRENFeUJw?=
 =?utf-8?B?Ykp4azFCc0tVeHp3ZzhxSDJnYmJMcllZVkxsNmxNdkdsU0hMb1lYRUllSnFP?=
 =?utf-8?B?Q2JzWktKY0JiUkZUQW9KcmZkNG42b1hmYlBLMkIxUGxxendvaGJjNzJDcnpt?=
 =?utf-8?B?MG14WUJaWVlCdHFzT1ZtUUJLcHJnQmUyZnZsSUtYTjU4SzhzbUpKYWw2VHZp?=
 =?utf-8?B?WmR2N2U2ckFHLzIvK24zRmJrZkdZam1oRDROdk1vOXpMVmlQR1JuWGh3aS8r?=
 =?utf-8?B?Q2V0L0NudWR5dlBFTm9yMkt5MTZHQnU4NU5ZK2MyS0RWT29McFdvWkkvNEYy?=
 =?utf-8?B?cWtRcWc2OVovSW14ajFnQ1lQR204R1VIb1F2b2p0akhFOHNKQVlib3poRFQ0?=
 =?utf-8?B?RkUwY1VTM2V4N21hNzBMUGRYd0RsK3VlU212MWZ0bnJmTzcrTDdjQy9UVmd4?=
 =?utf-8?B?N3pPejl2b2FLMjVjb0U2TGpqd1BsM1VVMXZidXVnRXdvc3YrcU1BZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5914c57a-c0f6-4781-6c32-08de5290f3de
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 10:46:05.4336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaokiFfOUKsJzl7Zb3QUzPq/Gt/LNuw3ckRTb3CIpLAZTcgj7dvkb2gS9xTIt/ntVfqH4gk7bdYBe5acgdAiHr2Hu4glXF/lyLCoMLLW/ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7488
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 10:47:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8482

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The Poky repository has stopped being updated in favor of bitbake-setup
> or manual clones of the required repositories. Simplify the document by
> making references to these guides as well as removing sections that
> are covered in the references documents.
> 
> Keep a "Initializing the Build Environment" as this task is common and
> referenced in different places in the documentation.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/bsp-guide/bsp.rst                    |   5 +-
>   documentation/dev-manual/start.rst                 | 324 +++------------------
>   documentation/kernel-dev/common.rst                |  36 +--
>   .../overview-manual/development-environment.rst    |  21 +-
>   documentation/ref-manual/structure.rst             |   5 -
>   documentation/sdk-manual/appendix-obtain.rst       |  25 +-
>   6 files changed, 48 insertions(+), 368 deletions(-)
> 
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
> index a6444d9af..74912cdd6 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -204,10 +204,7 @@ section.
>         .. note::
>   
>            To see the available branch names in a cloned repository, use the ``git
> -         branch -a`` command. See the
> -         ":ref:`dev-manual/start:checking out by branch in poky`"
> -         section in the Yocto Project Development Tasks Manual for more
> -         information.
> +         branch -a`` command.
>   
>   #. *Optionally Set Up an Alternative BSP Layer:* If your hardware can be
>      more closely leveraged to an existing BSP not within the
> diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
> index b21cd4f0f..ca6753c94 100644
> --- a/documentation/dev-manual/start.rst
> +++ b/documentation/dev-manual/start.rst
> @@ -76,7 +76,7 @@ particular working environment and set of practices.
>       :term:`Metadata` (i.e. recipes,
>       configuration files, classes, and so forth) and any software you are
>       developing under the control of an SCM system that is compatible
> -    with the OpenEmbedded build system is advisable. Of all of the SCMs
> +    with the :term:`OpenEmbedded build system` is advisable. Of all of the SCMs
>       supported by BitBake, the Yocto Project team strongly recommends using
>       :ref:`overview-manual/development-environment:git`.
>       Git is a distributed system
> @@ -218,7 +218,7 @@ particular working environment and set of practices.
>          repositories. See the ":ref:`overview-manual/development-environment:yocto project source repositories`"
>          section in the Yocto Project Overview and Concepts Manual for
>          information on these repositories. See the
> -       ":ref:`dev-manual/start:locating yocto project source files`"
> +       ":doc:`/dev-manual/poky-manual-setup`"
>          section for information on how to set up local Git repositories
>          for related upstream Yocto Project Git repositories.
>   
> @@ -338,7 +338,7 @@ Project Build Host:
>   Once you have completed the previous steps, you are ready to continue
>   using a given development path on your native Linux machine. If you are
>   going to use BitBake, see the
> -":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
> +":ref:`dev-manual/start:preparing the poky reference distro`"
>   section. If you are going
>   to use the Extensible SDK, see the ":doc:`/sdk-manual/extensible`" Chapter in the Yocto
>   Project Application Development and the Extensible Software Development
> @@ -433,7 +433,7 @@ as your Yocto Project build host:
>   Once you have a container set up, everything is in place to develop just
>   as if you were running on a native Linux machine. If you are going to
>   use the Poky container, see the
> -":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
> +":ref:`dev-manual/start:preparing the Poky reference distro`"
>   section. If you are going to use the Extensible SDK container, see the
>   ":doc:`/sdk-manual/extensible`" Chapter in the Yocto
>   Project Application Development and the Extensible Software Development
> @@ -576,302 +576,60 @@ the `Yocto Project BitBake
>   <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__
>   extension accordingly.
>   
> -Locating Yocto Project Source Files
> -===================================
> +Preparing the Poky Reference Distro
> +-----------------------------------
>   
> -This section shows you how to locate, fetch, unpack, patch and configure the source
> -files you'll need to work with the Yocto Project.
> +Now that the :term:`Build Host` has been prepared to build images, the next step
> +can be to build the :term:`Poky` reference distro. There are two ways of setting
> +up the :term:`Poky` reference distro:
>   
> -.. note::
> -
> -   -  For concepts and introductory information about Git as it is used
> -      in the Yocto Project, see the ":ref:`overview-manual/development-environment:git`"
> -      section in the Yocto Project Overview and Concepts Manual.
> -
> -   -  For concepts on Yocto Project source repositories, see the
> -      ":ref:`overview-manual/development-environment:yocto project source repositories`"
> -      section in the Yocto Project Overview and Concepts Manual."
> -
> -Accessing Source Repositories
> ------------------------------
> -
> -Working from a copy of the upstream :ref:`dev-manual/start:accessing source repositories` is the
> -preferred method for obtaining and using a Yocto Project release. You
> -can view the Yocto Project Source Repositories at
> -:yocto_git:`/`. In particular, you can find the ``poky``
> -repository at :yocto_git:`/poky`.
> -
> -Use the following procedure to locate the latest upstream copy of the
> -``poky`` Git repository:
> -
> -#. *Access Repositories:* Open a browser and go to
> -   :yocto_git:`/` to access the GUI-based interface into the
> -   Yocto Project source repositories.
> +-  Using the ``bitbake-setup`` command-line utility from :term:`BitBake`.
> +   Follow:
>   
> -#. *Select the Repository:* Click on the repository in which you are
> -   interested (e.g. ``poky``).
> +   :doc:`Setting Up The Environment With bitbake-setup <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`
>   
> -#. *Find the URL Used to Clone the Repository:* At the bottom of the
> -   page, note the URL used to clone that repository
> -   (e.g. :yocto_git:`/poky`).
> +-  Manually cloning the required repositories. Follow:
>   
> -   .. note::
> +   :doc:`/dev-manual/poky-manual-setup`
>   
> -      For information on cloning a repository, see the
> -      ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`" section.
> +.. note::
>   
> -Accessing Source Archives
> --------------------------
> +   The :term:`Poky` distro is only a point that can be used to try the Yocto

I don't know what you wanted to convey with "a point" here, but I don't 
think it works?

What about something like

"""
The :term:`Poky` distro is a reference distro. It can be used to try the 
Yocto Project but should not be used in a production environment.
"""

> +   Project. It should not be used in production environments! Instead, it is
> +   recommended to create your own distro, see the
> +   :doc:`/dev-manual/custom-distribution` section of the Yocto Project
> +   Development Tasks Manual.
>   
> -The Yocto Project also provides source archives of its releases, which
> -are available on :yocto_dl:`/releases/yocto/`. Then, choose the subdirectory
> -containing the release you wish to use, for example
> -:yocto_dl:`&DISTRO_REL_LATEST_TAG; </releases/yocto/&DISTRO_REL_LATEST_TAG;/>`.
> +Initializing the Build Environment
> +----------------------------------
>   
> -You will find there source archives of individual components (if you wish
> -to use them individually), and of the corresponding Poky release bundling
> -a selection of these components.
> +Initializing the build environment is a common task, as it needs to be done for
> +each new instance of the shell where the :term:`Poky` reference was set up:
>   
> -.. note::
> +-  If ``bitbake-setup`` was used to setup the :term:`Poky` reference distro, you
> +   need to source the ``init-build-env`` file of the :term:`bitbake:Setup`
> +   directory that was created after the :ref:`bitbake:ref-bbsetup-command-init`
> +   command execution:
>   
> -   The recommended method for accessing Yocto Project components is to
> -   use Git to clone the upstream repository and work from within that
> -   locally cloned repository.
> -
> -Using the Downloads Page
> -------------------------
> -
> -The :yocto_home:`Yocto Project Website <>` uses a "RELEASES" page
> -from which you can locate and download tarballs of any Yocto Project
> -release. Rather than Git repositories, these files represent snapshot
> -tarballs similar to the tarballs located in the Index of Releases
> -described in the ":ref:`dev-manual/start:accessing source archives`" section.
> -
> -#. *Go to the Yocto Project Website:* Open The
> -   :yocto_home:`Yocto Project Website <>` in your browser.
> -
> -#. *Get to the Downloads Area:* Select the "RELEASES" item from the
> -   pull-down "DEVELOPMENT" tab menu near the top of the page.
> -
> -#. *Select a Yocto Project Release:* On the top of the "RELEASES" page, currently
> -   supported releases are displayed; further down, past supported Yocto Project
> -   releases are visible. The "Download" links in the rows of the table there
> -   will lead to the download tarballs for the release.
> -
> -   .. note::
> -
> -      For a "map" of Yocto Project releases to version numbers, see the
> -      :yocto_home:`Releases </development/releases/>` page.
> -
> -   You can use the "RELEASE ARCHIVE" link to reveal a menu of all Yocto
> -   Project releases.
> -
> -#. *Download Tools or Board Support Packages (BSPs):* Next to the tarballs you
> -   will find download tools or BSPs as well. Just select a Yocto Project
> -   release and look for what you need.
> -
> -Cloning and Checking Out Branches
> -=================================
> -
> -To use the Yocto Project for development, you need a release locally
> -installed on your development system. This locally installed set of
> -files is referred to as the :term:`Source Directory`
> -in the Yocto Project documentation.
> -
> -The preferred method of creating your Source Directory is by using
> -:ref:`overview-manual/development-environment:git` to clone a local copy of the upstream
> -``poky`` repository. Working from a cloned copy of the upstream
> -repository allows you to contribute back into the Yocto Project or to
> -simply work with the latest software on a development branch. Because
> -Git maintains and creates an upstream repository with a complete history
> -of changes and you are working with a local clone of that repository,
> -you have access to all the Yocto Project development branches and tag
> -names used in the upstream repository.
> -
> -Cloning the ``poky`` Repository
> --------------------------------
> -
> -Follow these steps to create a local version of the upstream
> -:term:`Poky` Git repository.
> -
> -#. *Set Your Directory:* Change your working directory to where you want
> -   to create your local copy of ``poky``.
> -
> -#. *Clone the Repository:* The following example command clones the
> -   ``poky`` repository and uses the default name "poky" for your local
> -   repository::
> -
> -      $ git clone git://git.yoctoproject.org/poky
> -      Cloning into 'poky'...
> -      remote: Counting objects: 432160, done.
> -      remote: Compressing objects: 100% (102056/102056), done.
> -      remote: Total 432160 (delta 323116), reused 432037 (delta 323000)
> -      Receiving objects: 100% (432160/432160), 153.81 MiB | 8.54 MiB/s, done.
> -      Resolving deltas: 100% (323116/323116), done.
> -      Checking connectivity... done.
> -
> -   Unless you
> -   specify a specific development branch or tag name, Git clones the
> -   "master" branch, which results in a snapshot of the latest
> -   development changes for "master". For information on how to check out
> -   a specific development branch or on how to check out a local branch
> -   based on a tag name, see the
> -   ":ref:`dev-manual/start:checking out by branch in poky`" and
> -   ":ref:`dev-manual/start:checking out by tag in poky`" sections, respectively.
> -
> -   Once the local repository is created, you can change to that
> -   directory and check its status. The ``master`` branch is checked out
> -   by default::
> -
> -      $ cd poky
> -      $ git status
> -      On branch master
> -      Your branch is up-to-date with 'origin/master'.
> -      nothing to commit, working directory clean
> -      $ git branch
> -      * master
> -
> -   Your local repository of poky is initially identical to the
> -   upstream poky repository from which it was cloned. As you
> -   work with the local branch, you can periodically use the
> -   ``git pull`` command to be sure you stay up-to-date
> -   with the upstream poky branch.
> -
> -Checking Out by Branch in Poky
> -------------------------------
> +   .. code-block:: console
>   
> -When you clone the upstream poky repository, you have access to all its
> -development branches. Each development branch in a repository is unique
> -as it forks off the "master" branch. To see and use the files of a
> -particular development branch locally, you need to know the branch name
> -and then specifically check out that development branch.
> +      $ source <setup-dir>/build/init-build-env
>   
> -.. note::
>   
> -   Checking out an active development branch by branch name gives you a
> -   snapshot of that particular branch at the time you check it out.
> -   Further development on top of the branch that occurs after check it
> -   out can occur.
> -
> -#. *Switch to the Poky Directory:* If you have a local poky Git
> -   repository, switch to that directory. If you do not have the local
> -   copy of poky, see the
> -   ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
> -   section.
> -
> -#. *Determine Existing Branch Names:*
> -   ::
> -
> -      $ git branch -a
> -      * master
> -      remotes/origin/1.1_M1
> -      remotes/origin/1.1_M2
> -      remotes/origin/1.1_M3
> -      remotes/origin/1.1_M4
> -      remotes/origin/1.2_M1
> -      remotes/origin/1.2_M2
> -      remotes/origin/1.2_M3
> -      . . .
> -      remotes/origin/thud
> -      remotes/origin/thud-next
> -      remotes/origin/warrior
> -      remotes/origin/warrior-next
> -      remotes/origin/zeus
> -      remotes/origin/zeus-next
> -      ... and so on ...
> -
> -#. *Check out the Branch:* Check out the development branch in which you
> -   want to work. For example, to access the files for the Yocto Project
> -   &DISTRO; Release (&DISTRO_NAME;), use the following command::
> -
> -      $ git checkout -b &DISTRO_NAME_NO_CAP; origin/&DISTRO_NAME_NO_CAP;
> -      Branch &DISTRO_NAME_NO_CAP; set up to track remote branch &DISTRO_NAME_NO_CAP; from origin.
> -      Switched to a new branch '&DISTRO_NAME_NO_CAP;'
> -
> -   The previous command checks out the "&DISTRO_NAME_NO_CAP;" development
> -   branch and reports that the branch is tracking the upstream
> -   "origin/&DISTRO_NAME_NO_CAP;" branch.
> -
> -   The following command displays the branches that are now part of your
> -   local poky repository. The asterisk character indicates the branch
> -   that is currently checked out for work::
> -
> -      $ git branch
> -        master
> -        * &DISTRO_NAME_NO_CAP;
> -
> -Checking Out by Tag in Poky
> ----------------------------
> -
> -Similar to branches, the upstream repository uses tags to mark specific
> -commits associated with significant points in a development branch (i.e.
> -a release point or stage of a release). You might want to set up a local
> -branch based on one of those points in the repository. The process is
> -similar to checking out by branch name except you use tag names.
> +-  If the :term:`Poky` distro was setup using manual clones of the layers, you
> +   need to source the ``oe-init-build-env`` script present in the
> +   :term:`OpenEmbedded-Core (OE-Core)` layer:
>   
> -.. note::
> +   .. code-block:: console
>   
> -   Checking out a branch based on a tag gives you a stable set of files
> -   not affected by development on the branch above the tag.
> -
> -#. *Switch to the Poky Directory:* If you have a local poky Git
> -   repository, switch to that directory. If you do not have the local
> -   copy of poky, see the
> -   ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
> -   section.
> -
> -#. *Fetch the Tag Names:* To checkout the branch based on a tag name,
> -   you need to fetch the upstream tags into your local repository::
> -
> -      $ git fetch --tags
> -      $
> -
> -#. *List the Tag Names:* You can list the tag names now::
> -
> -      $ git tag
> -      1.1_M1.final
> -      1.1_M1.rc1
> -      1.1_M1.rc2
> -      1.1_M2.final
> -      1.1_M2.rc1
> -         .
> -         .
> -         .
> -      yocto-2.5
> -      yocto-2.5.1
> -      yocto-2.5.2
> -      yocto-2.5.3
> -      yocto-2.6
> -      yocto-2.6.1
> -      yocto-2.6.2
> -      yocto-2.7
> -      yocto_1.5_M5.rc8
> -
> -
> -#. *Check out the Branch:*
> -   ::
> -
> -      $ git checkout tags/yocto-&DISTRO; -b my_yocto_&DISTRO;
> -      Switched to a new branch 'my_yocto_&DISTRO;'
> -      $ git branch
> -        master
> -      * my_yocto_&DISTRO;
> -
> -   The previous command creates and
> -   checks out a local branch named "my_yocto_&DISTRO;", which is based on
> -   the commit in the upstream poky repository that has the same tag. In
> -   this example, the files you have available locally as a result of the
> -   ``checkout`` command are a snapshot of the "&DISTRO_NAME_NO_CAP;"
> -   development branch at the point where Yocto Project &DISTRO; was
> -   released.
> +      $ source openembedded-core/oe-init-build-env
>   
> -Initializing the Build Environment
> -==================================
> +This will setup you current shell and change its current working directory to

s/you/your/

s/its/the/

> +the :term:`Build Directory`.
>   
> -Before you can use Yocto you need to setup the build environment.
> -From within the ``poky`` directory, source the :ref:`ref-manual/structure:``oe-init-build-env``` environment
> -setup script to define Yocto Project's build environment on your build host::
> +Where To Go From There

s/There/Here/ ?

More generally, I'm confused as to why we are removing mentions to the 
tarball setup as that still exists and is possible?

Cheers,
Quentin

