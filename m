Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9B1C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 08:17:22 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.72])
 by mx.groups.io with SMTP id smtpd.web12.4062.1641284237389188650
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 00:17:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=eRrgdk/S;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.72,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLlmXXgEc4NgBgUVDmuDhBK67C66QnkCN16iOspeRAT7+gtOeN7yMwM9rx4UtN6De1gnj5oqGwNRLfniSBhMB0UdOTxzsHvfAfG/9KdjlE5i+7dyDvF+kxvBhUpKbR7XGISfr89pgr9NHA4XscPu5aOn9GfPJL/h44FWNyx9oMhc4dzD/nowH9JqJFLxaSJDvoQktZrryxLnKyoABefBKtsSEzCOLSxbbTUoHn6j+n1AbXA6YP6Pq4EyZcHTtOwcTPyxTmNOsOrSV0zRwo3m1sni4SWGr6QOwZYfjwHB88GxajN+GzI6pGsWTha4CQGTVFBJUB1XLHOgmJXKqV+U8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvJKGOow/VDTRyC6fgYmCrzLAVJnBMclsG5f5P1taks=;
 b=RB0UGtOHqewVba42twyLdUpNvoQgZ0ECZTqDZKg8UJ8xyas3fS2iBtzGdIFlZqA+bhuc3bEVpRfVAR1WqpbCwyt7+N88v/zY7G1QX/xg3PyvMmVG5vgkqjyuXwA4cp2XlDA+WOOfMPQ2xfkE9Ypitnrd/SzhpnmZ5eE2ZLcniUVtzAE2GMjsdSSzbDfbwZrMhrsdXkrzkUOSCPqCfVmLhTpY53TUQcF0YeIM6JM7rUOC8QzKVqxaofpy97TFvjAHHhrzNdhXkj34GvC4mtvNIVJYS4l1gGnisCAcOMa7UKPscll3Q/SZOsfiyRajw4Hd7wkZ2oMVjy7tgUsi4hkDgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvJKGOow/VDTRyC6fgYmCrzLAVJnBMclsG5f5P1taks=;
 b=eRrgdk/SABMUrJtuvMcXnJAYfaQn8rM4KCJXI88wwJjDSgYCJp4sMYzYeqQaphIU9Gf9NHjg5yHgtA16QjbFwqYFW8Paf673qgAJ9i7adwaMBf2us5XJ51UXL0RSxAtNpV9HnRo+qgf1UXa0IjKtguTxGY0qTjxFs5t4/XOmPzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by PAXPR04MB8560.eurprd04.prod.outlook.com (2603:10a6:102:217::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Tue, 4 Jan
 2022 08:17:13 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93%5]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 08:17:13 +0000
Message-ID: <2930a616-a1d7-0dfc-01ee-e6bb50ec5beb@theobroma-systems.com>
Date: Tue, 4 Jan 2022 09:17:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] ref-manual: fix patch documentation
Content-Language: en-US
To: Max Krummenacher <max.oss.09@gmail.com>, docs@lists.yoctoproject.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
References: <20220103195050.466-1-max.krummenacher@toradex.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220103195050.466-1-max.krummenacher@toradex.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0401CA0011.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::21) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70ba63d7-25ed-4cad-4a8a-08d9cf5a9c8f
X-MS-TrafficTypeDiagnostic: PAXPR04MB8560:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR04MB8560233BFC32AD79EA34F442C24A9@PAXPR04MB8560.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jyS+VCpyjMjo4GC1ZJvtQAJcsBcNBPkJ9yj3Bp4Ku91LCuGBfRPmR9hKlqCoL36X6/OFsaQC0joRA/fcoX2FdQ5k6rgQEQdjw4y4xOOWcqDUG5APKw2VuKmps1Dh9eulHlot7+c8ywFQ48p/w6iyO3FLDEzw/h2ZBHiPxCNdY0mTZw9Eox9fhvCkNnWVOH6hSPdZ0Cve71WXKXp9skApbOcwHgX+umDJBC0Vriglpzchp8QYy0+sk1BFyFt70O76HGeOoD1IYeSMOo5/SRIphJImJgZmKEVh90zFLI00pQgEoNG9nvJ6baa8noTOS0hBPYOBAXB/19OxdIQsYoL5tq+dIdF39RiO9PxM0D4B0Cv8wa1QA/BxPU2kVD+4lUJX3CqrF/WfaAyhBb/w7fIqkkuNTfnVfQNDypGgzwubemwidR1NtmrQqmb8tarRGxFSgJlESU7st0AFiL/jQpRAe+AFz4m54C+ZxVC/7Vj37f55aEr77OmyQ/8KDqCH+JFxqeh0luRo2lDOM5WEtpFloiRjQMagxsAA+S8ZftgTClil18mB4kTkHp139YVrsImP0oXnmqH/0TpubpXqw/PjDmFxwIl+b1Hh61cQA17LBORYDQYDI913/NEq2K+l5WKMAyY4zT5rgKbbzo1TsBvuQ+9s+R5RCMfIWFhQ6RFZJ4WkQogKg2I1XnIqbO3Vn72/6QiotaXcStj5q8OyqrQAzL+pI6fnn+YV1KWEJE9HvHk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(4744005)(38100700002)(8676002)(8936002)(66476007)(5660300002)(53546011)(66556008)(2906002)(6506007)(508600001)(66946007)(186003)(4326008)(316002)(44832011)(31696002)(6512007)(2616005)(36756003)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3FadnJodktINEFncHlQZGJMQjF0dEh5anA1M1dCQkpNVHhJem9CWk9qQUNh?=
 =?utf-8?B?eUIvQXpsUE1Gd1FnMDNuelJxdDVHdWlTYk5zOHdDSHZtYld1SDVieGk5L3Jy?=
 =?utf-8?B?VXl1aDdndnk5NE1IQmtpQU9xUVFWUVpXZHkvUWNLV01MOVg5SmRhalFwM2pq?=
 =?utf-8?B?cSsrdjdiSjJnN0IrdnNmQ3dMeUZjaHl4b3ZUdDhDNEJ3RGQvSUltb1NDWkRh?=
 =?utf-8?B?ZnZtZ1orZWJMTHdyVzFaSEZ0SEEvd1lNV0xUMk8zcWJpcCsxc1lpWnRHS0tH?=
 =?utf-8?B?R0s0MytmemsrTEFPK2puOUN1T1QxSkpqUHUwdEdTcWs3VG9CSjg3NjZ1bG9P?=
 =?utf-8?B?WURDZlo4bFFWaWtoZVp3bUN2VHVURk5ZVzdqdlhBSXY5MEdwUXhieWEzSVlo?=
 =?utf-8?B?K1Qza3kyUWxuV1N3c2xYUVlWWmxpWkNzMU5CSW13Mm9iUG1tWHZ0ekZJVElI?=
 =?utf-8?B?NUVpdzZxUW4wS3o5cDdXbzZ6NUh5RlpuK1JjYzVoY0FVOWxLczdhZUtLUUw2?=
 =?utf-8?B?anRibStmZmR0aG8yZ3lYU203OVowQ3g0VTlJV2Y1NXRVVlhuMjBSc2FOcWFS?=
 =?utf-8?B?aFVJcG5kZnVWK0hYQVIzRC85cUIyMis4MmR1b0ZFU0hMazhmc1U0cTVhNWs5?=
 =?utf-8?B?N1RYbU5BK3V6VkVqTDBpVHpyY2luUGl2Z3EvUEEzZnYzeUhFblJnZlFETFcy?=
 =?utf-8?B?cEIyZWlSa3VtcmFaQmNJUGRzeUpmVjc2eVpWY1YvN2FLREhGYjJoVFlmMHBK?=
 =?utf-8?B?V052Y1Fnbm9ncVpwSkRmL2FYMDR4WjVxVVhIa25SWHdHOHBkLzV0Sm43Zjhu?=
 =?utf-8?B?Q0FtNjAwb0pzSGZhaVFKbUJRaXh5dnFPS3M4MHpIVjRoR0JaT0JBSjgwbldw?=
 =?utf-8?B?ZWd2MS91WGpwZkdKc1hBZEhWUmpueUpramd1SnJlcDNraHg4WktpMWc0bFFa?=
 =?utf-8?B?bW9hZnBkQmhqYjNmNEtGNG9USzViQTB4ZXRMWkxBSzZ3S0VJVkNQUkV3ZXRN?=
 =?utf-8?B?TDAvU1Jha2huVUpXc2hHR2xYWVM0Q2dkbjJLRmJxZkdLRWVjUFpNL1dFUUlG?=
 =?utf-8?B?RDZyWi9paTdWQzNwQXZ2QzhVTXhMRWRaaEFXemx0Mm5nMmxkZXppc2t0RkJK?=
 =?utf-8?B?STN2TlBicE1lZFc3bDRRRGF5NjNXeUpZRERuaTFXNVVQZFcreDg5bkFQaFND?=
 =?utf-8?B?ZDFyM3hIT2tqMEVBeXN0NGx6RFN1eDNSeklaejdpYjlJN3BrQ3dSUnAvdXBl?=
 =?utf-8?B?bkw4anhaTUMzNzkwUEd5b0JwbUxtUnVtUHFSU1VPT2dmSmhrdU5qMnBSdk02?=
 =?utf-8?B?THg0QlRHa2pYTmpRd3JTbHMxMTlwMnFnRUNDUjh3WDJ1SzFkL1phKzgrZ0hp?=
 =?utf-8?B?emprVTA4eEl5TWx3MnMvMTA2V3hKMytEYU5NK2FnTWpUcmhxQittNE5hTUps?=
 =?utf-8?B?Y1VOZ1JMT0NCMGVmYVAxN0FwUkkzSWpzNHp6QmpoRUMrd1NvOXBiRW9BWWdE?=
 =?utf-8?B?QnpvVEcwUjdvSFpqblQvcG1NZ2tRMWUvbjNQbk9tUW1HbWE5L2VRbzkvbVpY?=
 =?utf-8?B?eDhnSUEwMk1odFNnWE5SR3NyODc5Z005a3lUUXJyblpQZTdDSkpBd3NJWXo1?=
 =?utf-8?B?MDNYRlJPd1VHV0tJU1JGMkpDQjh6T0EvVFhlQ292UFdCUng1cDhhdFhIeWo2?=
 =?utf-8?B?NlR1M1Z0am4xZ1J6VWF4SUFmN2Qvam1nK2g0Zm1CSERLZjBjdmxzUElmZ0VT?=
 =?utf-8?B?NFNmUUVFSDdqTmgrSkg1a2tPclJuaVZwN2U0ZEMyZDNmNTNGa1Jvdmx6emNC?=
 =?utf-8?B?SWN2MW11QVptckxXQXlpTGIrMFN3TEhqZ1BkK2RVS0FqeHpET1I5UStzZlVl?=
 =?utf-8?B?Z3FNOUU3cGVNZlJFRkRHYWdnNmNNM09sK0puQ2szeDdQdWE3Mlg1b2lBTkRR?=
 =?utf-8?B?N3ZrOVlDYXJXOHljdDVqS0hGby9KTmxaYVN3QnRTYk04U0FZanhYVUZ3eDJz?=
 =?utf-8?B?WTJkTEYrQzRFWmxxYlFRYkFINDJ5OEM3bE5FbmJSVXloRU9nRmEwSTcwUHRl?=
 =?utf-8?B?MDY1aWdMUmZLQlFENHRUQVJUVituczV0MHJYcFlvN2VyS2ZZTERXWC9wVWZS?=
 =?utf-8?B?OGV6QVVHeVU4OTZmRnFaeGtJUEszU2NtelA0WmdVbzlxY3Z1eTJrRFB4emhz?=
 =?utf-8?B?N1ZCSlpoV0RyalZUMkd3UmxwWnBZTGc3L3o3cmhmTjl4SnBqaWd6ZVhGTC9t?=
 =?utf-8?B?cjE3alowZThxUlB2dnBSVXZKOXU2NXgyVHdlcUxVWEpMQTgzT3RnWThDajcy?=
 =?utf-8?B?OWJMQXJCUmVIZE1XQ0JjUE1LcVpRakUwVkFhY0hZdlRVOWNaajFnSWZqTGVy?=
 =?utf-8?Q?8qcrXP1vVOS+DCw4=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 70ba63d7-25ed-4cad-4a8a-08d9cf5a9c8f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 08:17:13.2153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 a0z31TRyaQtwKU3Eq1/BDE9Q2mBBQDAFdm54DVvQTSpnnCQGHGi+mXWOg83sjjBnFffqUkVz1LOgvouj4CKJtvnuZPLWxKjvOBFNvyBtscHfMVuzye4EETsyD1LoEL16
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8560
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Jan 2022 08:17:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2340

Hi Max,

On 1/3/22 20:50, Max Krummenacher wrote:
> The do_patch implementation does not apply patches from an entry in
> SRC_URI pointing to a directory.
> Remove the claim that this is implemented.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

As a side note, this patch is a candidate for backports to currently 
maintained releases.

Thanks!
Quentin

