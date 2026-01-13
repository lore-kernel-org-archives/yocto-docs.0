Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013FCD0C84D
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:52:31 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56443.1768301550289413057
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 02:52:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KZYzeKAp;
 spf=pass (domain: cherry.de, ip: 52.101.69.29, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGFUFxmDpYIs/YlR45Kju7W7eRRPsgpnWsnAN6GypdAwZqk3JvZ/KiuzFTrstriLoHq+dw9GuOkRTh6tne6qg02JXULtUqb6uAglXMEJX3q9ZhmhyuvERvR9y1M05wvNp5Utua/EzUPNX2zpvM9ZaOxpPjnCeuZSQ+S1+a5ntQHRNorJNtcj5nM6rvvw2XOByZc7V9GuZtHZFl3X6Fh0io/w8NoFGcFEoAMCXfx+Xa1wPOFyJ6WPPrQfeEbF3IpI5YmhCy1/t+/KstEcUS92Y67AEBAixxgMi1mX3PnTgMZ5RjFLD4C8ztTZMKGiod2Kfxb8RfUJogMNIl2d+KJu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syGm/qRhQq29vn5qRRjVItnTrr8T7jXNCkWkcttsVR0=;
 b=tc/PHztQ/l5ayNH742jpoTRFneEefDgO6LDAEd1T2h642m7oQE4PDkPdMzF6CwgMYAhfzUzYHo7mCg7Qdz9bHwifX13ACh5Hz1TfH2iuPhM3dHAsv78Fl+mXL26amsk3eXaC8pxUUTTOJXaEN5AT1P0+k9i5QHrqTJxyNoWeu6R07m0nUpEDKAOFVZ9999RbvvmOMZV9Da0wDCUKDZ4wDGZCNg9/I6sU0vE9DrQnxgwWzAaZE/lLVzJmjqdXQpQXkO3NeJIzds15AH2jTMLt+3KcYCwg9vTOVDhkwS7jJZe+684ULnGRBFWPXqcg3NCu5GxDhmgFvVZbSWk1yd9mxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syGm/qRhQq29vn5qRRjVItnTrr8T7jXNCkWkcttsVR0=;
 b=KZYzeKApyX60FLTpL/AwrKur47YVwDjshUjVqL/cAaMuYkoCTSTAqEKmuRABjMOK8mK9HgWMRQ0GyqXXANLu9rka5bYyk4J6xQ1lW0rONnzab6xcc0mDn5izZFvaNcgLGFOAqCxlEL55R6aO8xDXchVvE53eqK/p/7hjsFmcMJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBBPR04MB7900.eurprd04.prod.outlook.com (2603:10a6:10:1e8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 10:52:26 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 10:52:26 +0000
Message-ID: <95745751-e301-431b-bf7a-a926d586f057@cherry.de>
Date: Tue, 13 Jan 2026 11:52:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 03/53] dev-manual/poky-manual-setup.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-3-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-3-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::11) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBBPR04MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9ef53a-e9c8-414f-8b98-08de5291d6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d3hMSTBISU5IaWlDYUNidFBhZWxNUGt6Z0I4VmhhTmdYcW9LYXduS2N0RzFj?=
 =?utf-8?B?dlBhVHd3WTNvSVMwci9DZkZxV0todU1teCtYR2QrMzBKRzFyS3VmM1M2T3U3?=
 =?utf-8?B?Z0ZUYTF3TWlvZ3RUNnlFb2NueTUyb1I5MzAvMDBlUS9nS1AxMTBBRnA5YnZV?=
 =?utf-8?B?dGVJRjRIS3lyQjY5SzJkWkppNTBTejhkY0l2Yk80WFY4aTFKYzgrTUM0MEFx?=
 =?utf-8?B?NlRJK1FSbkpMc2ZJSVVNcklLVkdWT2ZvU29oeGw1bjNTNkR2VUhLcER4NFhr?=
 =?utf-8?B?S1IrR0loMTM1NnZUZUk1bXJZaGIrcTJZRTNPc0JDT0FKZFlIbmJRQ3ZkMGhQ?=
 =?utf-8?B?MThPT2FieTNHSmVKaERCUVRLeTNOckFtbVZNVWpsRUpDejVzdXEveDJtb0d5?=
 =?utf-8?B?TUN3dktxdFQ0Y0tEaFAyK2RiUzZ3RHlFcU1SaG1wbTRIdkZ0YUQwYXd1MnNt?=
 =?utf-8?B?bkR3TUNSVFA3MDhFSG9yL1lSU0o0NjBTL2JObHNjQy95L0xCSkI4cjZJR0JH?=
 =?utf-8?B?eW5ZMlRCSGxqaGFsS29TUUtTb042K2tYOVJpOFplL1kwTlFnSXRveUxya05h?=
 =?utf-8?B?VXVKb0NvZXI0Z0VQc1hrUXcwR2dEOHV4RVVTbWJlVXVaR0s5QTU3elVURmF4?=
 =?utf-8?B?RHhpYys4WTZPejVTYlFSUGVzV3RiWWpybjFtR0c1UmNOZHhXN0tMdFJCaCtt?=
 =?utf-8?B?dDhBYUhsRGdmaDhRV0Q0SHlvNitubC9aVVFxalk2QmJGcGZ6MEhIQmRieDlz?=
 =?utf-8?B?Z3VtVWdDOFQyajVHaDhBbnVJVkEvNXIzMHBRMjZFdDkwa0J4ZDh5SG1OSmxB?=
 =?utf-8?B?YzBLR0xzMkJlYVdCb1VjcllHT240djJFV2NZcmNWQThJRDZqTnVWWldFUmRy?=
 =?utf-8?B?dnpzenl4Q2RCbWlGMzZwdzlzaXRXVERyMjZ2NlhOOGtYd2dRRUtUQmt3dEJK?=
 =?utf-8?B?eWlEMENZWGxONEdjN2ZaSTExNkVZbW1RTnRnSENqVVJJdm4zYlRqM3VqbjU0?=
 =?utf-8?B?T254aFNPMjRQcS9PMlE5WFBIaHpjd25POUtDSW1Oa01SNFJTQ0FOQmM1b090?=
 =?utf-8?B?VkVvRDBUTEtuSVhhdjlVcnF1L2M1SlVidEdMM0t0ckNYUEZHU1VCZ3JHOVps?=
 =?utf-8?B?aXNkUGJhbGlYY0NNdkZHSk9wblR6SjNYaXRQaXMzakRUcEhUZzNzaEo3QmlP?=
 =?utf-8?B?bFB5aXpyNWZ3akxFaStTVmZWUnREUzQwb2FxWHVCVTgwanh2L2xXVkFhNHVh?=
 =?utf-8?B?VFdEa0t2UTJDQ3hpSWNkRTVWYzhkVE9QUkR1blVCY2RyWkxPQnNNMWlKdUp0?=
 =?utf-8?B?d2UwZWNlN05naEFiUlpPL0lEdjdUTWU2c3E4S3ZZSHZkN1VHLzdBcExqNVpE?=
 =?utf-8?B?M2NjeThGR1JSRkp6SlRBU0VTWFRRNXlmdzEyUmxmYURLVVl0bmpIWjQxL1BU?=
 =?utf-8?B?UjluTnl5UThCS0RyQlNuSHFLd010dmQwdHRRYjM3ZHhPS3lCR1RlcXBHak5R?=
 =?utf-8?B?NUZnbTFqRHZzTGMyVTRBcXhDNzAvTUFXSFYwc1I4YkdHbGV1T3cwMytob0hB?=
 =?utf-8?B?bE1zUjIrcUp1RVVUUHhMeW9KN1Nrd0NCM2E5UWFnVWJvNXIvQUlXSUlpbXpD?=
 =?utf-8?B?VFlZK2YrbEhPdGc3aXRVdWtPY203ZVpIRnpVTU5vV0NQWW12d0V3Ulo4WTM3?=
 =?utf-8?B?bFFlRVcrRHRXa1NRSHhzYS9QTUhjdlErdFA5RGxIcW96NTJnU0pybXVGQnRv?=
 =?utf-8?B?b2xlNFhsR2szZmtWUU5VNVBzMzJMQVN6dHBuNGhRQWdYRER1TGN5VlZjSnFh?=
 =?utf-8?B?MXl5UC9NMzVpNzZieTJiTzhuNFVTOFRlaThmRUs2NEhFdTBaaVgvcDNDd3NT?=
 =?utf-8?B?a094NnNJZm5NUHVxeG84MG4zS3Jvbmd5RVE2TTlTRmxJdFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NC9CZVF3UjRhL2NuS2NJTlo1UGxkZXhZZWtJdDBBUzV5RFlIUDg2V1dEWmZ6?=
 =?utf-8?B?ZktWYktLWWZ3YkU2aFpnZU54bWJrMGh4WVVHa3ZNT3kza0dqaGVRcmphQXRC?=
 =?utf-8?B?L2MydTlHd1FibHpxelNaSEFKN1BCdnFCdW9wU0VUMVlDNmVTNGN0V0NXbngz?=
 =?utf-8?B?LzlJV2gxWUEraDNSNkJYYURHK3FYejd1a2dQYnFvZHNWbzdYVGhhd1JpYzE1?=
 =?utf-8?B?RGJCempzSHlXb0JYUzdtZ0RHMS93TFBRcGJlV1RuSExLaDBXeHZPNlBKVG5p?=
 =?utf-8?B?ZytPUFMxS0psbEZPb0xUanFnZTdhQ2lpMnZqYXBLY25hbGFBK2NFUkVZbkF3?=
 =?utf-8?B?TDZJYUJBaU1QbWp0SEpqY2hseWpBK3Zpc2lhVlFBVWR4bkZQYnlwOTRnTW96?=
 =?utf-8?B?b3MyWHBzVzUxcStlTWVSRXIzN0pRRStTdS91dWlBSGxTYVlDVkk0Z29obXdh?=
 =?utf-8?B?c3I0Nk5IR1VkMkE5ZmIwajZqa21jNDNhVUloZDZjUTRCYTNXKzd2Y0NESk1W?=
 =?utf-8?B?OWlxYk4zTmhERWVNdnh0Zkd1YUtZa1h6ekVHWXNaa2NrZE1Ha085Z1g4TlRu?=
 =?utf-8?B?UlY4THJBbkVnUmtSZzhQSFp0SkVoeEsySjF0c1NDNy9VT1ZLeXRBZUN2QzU0?=
 =?utf-8?B?UmkvK0ZsTWcvaHJsSEdrTktnbEJTMUtnaUVtbGZPYWkvbnVLeFFvSmZzdGQ2?=
 =?utf-8?B?RDl3elhnN2VlUTlxcmJYNGNXVlBtemNxTHQxd0MwWGhmZ3VON2czYk1uRTFh?=
 =?utf-8?B?dWIwTXIvY3REL3BqazFmeDRWdTRlSHJZYkhtekRUUnBMSEdmK1RUeVRKc1Mw?=
 =?utf-8?B?MlV1b1dQTjczNFFQOWkrNkJFeFdWaGhTV2pWTXhydWtlUzdCdStDK3BzTXow?=
 =?utf-8?B?VFNMOHg3ZFN4M3BydjhNQkZ0RnZhcitHWTNXYXROMVY5R3JPeWEvdVAzRm5v?=
 =?utf-8?B?SWNWVXMzTGdmd1hMNkx2S0VRWWhodW9wa1JkRHloK2RMQ2xXRW1Yejc3ZWox?=
 =?utf-8?B?WHZCSGRtNjE3bXFFeU4xdk9lQ3BTNFRIeXdXOHg1elRZMzlQYmZ1Tzh1QUI1?=
 =?utf-8?B?RHViV1BZdkRrV1Z5VThLRjdhd250VWgyS1FHM2JqTGlTeUxZNzF6Z3BwN1BT?=
 =?utf-8?B?WDkwZFd2clVxbitsZ3J3bStsak5jNWlzblFoQ1luaVd1Ry80Z0pWNEhwRzUw?=
 =?utf-8?B?bk9pcmRkV1R5UXphdStxaVl0ZTV1ZEUyekp6bnhaRXFKTG1ISHlBd2lSck9p?=
 =?utf-8?B?UC9DRTQvMEpEQTlOMllNRElFeVBQSFZ4N0hhMGFjV0g2RVVQcW1uUnVRU0o3?=
 =?utf-8?B?ZFVmaHI2VS9UTkdacEszR3R6YUtMem1rKy9Ta2pSWTl6dFgyaHVYOHdnWVE0?=
 =?utf-8?B?MXNPTi9Bd3pNUEo5b0JkM3ZtaFU0OUhxQmV3V1c5T2hCTGpPZW03TEJoU3I5?=
 =?utf-8?B?MWFDZHpPWTJ0MzhwY3NGZXZnMTlXdVlYWWF5NjQvcktaVDRGMzRwZU1DRnc5?=
 =?utf-8?B?QTBndHZFbXJ6dnAyYllDbmtVRnlCNU5UaU1peTd3dXpzdCtLQ0dVaXllMVYw?=
 =?utf-8?B?Z0V0N2NhYjNvYUpCT1dDTGNWUFJEMDdDM1FWVklQdWhzRUZCcVFyK2RTODV5?=
 =?utf-8?B?KzhTMWNHazVISkQ1alIrWUVEdXREeTBQWnBvWTFneVVkeTByTWs0ZHBqdm5J?=
 =?utf-8?B?SFFqWXl2Zmt3SnBDamV3c0ZtZnNnWXk3Tk1vZklML2xweEM5RDJhWmgxZVl2?=
 =?utf-8?B?THhFN2ZzcUdEdTVTSU5IWlJDSFZMSVQ3eFRaRWVhZnVWMFZiOGdVVjdYYWtk?=
 =?utf-8?B?Q2c3dHNyZjR2TkZ4V0J5RFJlVnVFdU9tM2l4Z3FKNXgyUGFQckxRQ0NZZit5?=
 =?utf-8?B?YlVUU3RZcFNoVjFMazhKMmpoUzB6Wjk1ZUVMVSsyM01xNWdTNDdLUWhnR2VH?=
 =?utf-8?B?MnNVeDRtSG5IeEpQbFcwWkEyanh1UDdTbWJFdVVPZGtvbTVJall0VGphQWkv?=
 =?utf-8?B?S2YrZ3NaQWFxenNrcDMwaWhzV2IrWFFnUkpZc2lLNlNqOWE2NU5WQ2dkcGRG?=
 =?utf-8?B?cUwwMEU0YnRITHpJVzVFc0tyQXlqb2hqRGV2VTljVXZWV1RBSUlqeHpTS1lB?=
 =?utf-8?B?ZXNwLy9rNjFPUzVPN3M3R0RRbFVzVGVNbHBHOXZKQTY0V1RMYWJZYzdlVXpI?=
 =?utf-8?B?SEs2dzBvMW5QbXIzVTJDYWo5TThXbnVVZ1UxcEhYdEZJZ2V4UjNPZmp6TUdU?=
 =?utf-8?B?YXBRbVVkR0dFQUxKTlhRNzZ0Z0FHeTFRbGkvbGw0VGhNTXpyWFdFMUtyL09Z?=
 =?utf-8?B?NDAzaWF1S0ZyWXpnRWM1WXFLdDJIWW9TcGhtd1BMbU83RWNJZW1jUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9ef53a-e9c8-414f-8b98-08de5291d6b1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 10:52:25.9890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Zl5zwOkSl9+pApKK8GH+0VWlelNUdqxPP0h7dsM5dD0YkCMfiVPQwE+BwbmirsH6DnK4ZEOcbiAPuPm7KbaU8w8mgbeT6+01c0RK6sIP7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7900
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 10:52:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8483

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The commit "dev-manual/start.rst: simplify the document after poky
> obsolescence" removed some of the information related to source archives
> published on downloads.yoctoproject.org. Mention it in this document as
> it makes sense to use those when manually setting up a Poky build.
> 

Do the opposite? Have this commit before we remove the important parts 
in the commit you mention? So that no information is temporarily lost?

> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/poky-manual-setup.rst | 28 +++++++++++++++++++++++++-
>   1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentation/dev-manual/poky-manual-setup.rst
> index 7ee084007..c4e36ce8b 100644
> --- a/documentation/dev-manual/poky-manual-setup.rst
> +++ b/documentation/dev-manual/poky-manual-setup.rst
> @@ -13,8 +13,15 @@ document guides through this setup step-by-step.
>      :doc:`/brief-yoctoprojectqs/index`, which shows how to setup :term:`Poky`
>      with ``bitbake-setup``.
>   
> +Obtaining The Source Repositories
> +=================================
> +
> +You can obtain the source repositories required to build the Poky reference
> +distro in two ways described below: cloning the repositories with Git, or
> +downloading the released archives.
> +

suggestion: Use cross-reference links for both (linking to "Use Git to 
Clone the Layers and Using the Source Archives).

>   Use Git to Clone The Layers
> -===========================
> +---------------------------
>   
>   Go to the :yocto_home:`Releases </development/releases/>` page, and choose a release
>   (such as ``&DISTRO_REL_LATEST_TAG;``), corresponding to either the latest stable
> @@ -41,6 +48,25 @@ following commands:
>      $ git clone -b &DISTRO_REL_LATEST_TAG; https://git.openembedded.org/openembedded-core ./layers/openembedded-core
>      $ git clone -b &DISTRO_REL_LATEST_TAG; https://git.yoctoproject.org/meta-yocto ./layers/meta-yocto
>   
> +
> +Using the Source Archives
> +-------------------------
> +
> +The Yocto Project also provides source archives of its releases, which
> +are available on :yocto_dl:`/releases/yocto/`. Then, choose the subdirectory

s/on/at/ ?

> +containing the release you wish to use, for example
> +:yocto_dl:`&DISTRO_REL_LATEST_TAG; </releases/yocto/&DISTRO_REL_LATEST_TAG;/>`.
> +
> +You will find there source archives of individual components (if you wish
> +to use them individually), and of the corresponding Poky release bundling
> +a selection of these components.
> +

Where it this poky bundle, I cannot find it here: 
https://downloads.yoctoproject.org/releases/yocto/yocto-5.3/

> +.. note::
> +
> +   The recommended method for accessing Yocto Project components is to
> +   use Git to clone the upstream repository and work from within that

suggestion: Use a cross-reference link pointing at the section above 
this one.

> +   locally cloned repository.
> +

s/that locally cloned repository/the locally cloned repositories/

(no combo layer anymore!).

Cheers,
Quentin

