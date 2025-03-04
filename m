Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97E4C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 11:15:04 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.78])
 by mx.groups.io with SMTP id smtpd.web11.19601.1741086898408344547
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Mar 2025 03:14:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WAoYxleL;
 spf=pass (domain: cherry.de, ip: 40.107.21.78, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxg5meNPfK16NC7wzsmyP8Z6TW0tqMGXadrDqKXbPBPYaGnWDkYOIRXZ3di+fvlXcuU1vwVqHw6sfkeJwNsJvcHFMaGR6LW8vej3R5UvcCE9N70StJkBpQVxJ9BwGNi8cvQ/+HUeFNBYt2sQo0kfKvEYUkcMBhBAg5NWGHRl+9sIbdZ1fzp6V1SDylZO0hycd0+QC257E8a7m1nZXmKu/8EK5f1MyfuSq4E7Ro1iBVG7wXTvFGbsBcTZDWh4yzlFS5hQxcQwue9DTlhg6OgNmTjcgE+sudRD0EEgjhIm1cNooob3wkb4WiIyLIem4VGTy7YCXQNIWIrs2ipq8iwoHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPB/3WS+HugaKdR/rsqVZ8yZgTiDUYWNMa/J5dR0H4E=;
 b=gandV3j0wkAJVhLfAKnhiiFSAK+nExZk6kO5UNAtfiZ4qVSFLl4DVMeDPGK30rOiHoYReVXZCqBhZwaDn0mkwmLkD91AMTTIUZCNGXv6h4Fl6SS5MumaU+OlM6NzY8weObNnPZYXdKYVwACibVZHEEp+B8xyXZcnDOMU6mY4XZK/x8NeOQm9x7eNmX4x02DRTUJrWfF8rQppvDiaqEB5NVY2UrAHIIKZv5lan6mHIDsoJD31O2TQuObgAQ9uuKwmrrGOKUOx7eUW1Hb2o8rpV4fQ5pxU4Zx4MJDnsW60YIPl9OlBe4q5VKUOu80izLEcR9zsRcyUaGlbyPtczMgeAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPB/3WS+HugaKdR/rsqVZ8yZgTiDUYWNMa/J5dR0H4E=;
 b=WAoYxleL7aVicNmH0ZvH5HqDpOrEOqulLH6q8LqZ7JZx10Kb9oYmqm1zsLBIUTt9CeiJuInqLR9wugvT+AAuN5xv3n4XHn9GJnzReBg8vcfcMdXc1FH5mHKJ1ZUZ3jFyI6eIuLNKB0JqH3Zubh1yz2tjFuue/wvoQ7D0OM0Uc1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB11017.eurprd04.prod.outlook.com (2603:10a6:150:21c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 11:14:52 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 11:14:51 +0000
Message-ID: <7f554ca2-e7e8-443c-8e31-fbac896752b8@cherry.de>
Date: Tue, 4 Mar 2025 12:14:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 2/2] ref-manual: don't refer to poky-lsb
To: ross.burton@arm.com, docs@lists.yoctoproject.org
References: <20250303172022.775243-1-ross.burton@arm.com>
 <20250303172022.775243-2-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250303172022.775243-2-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB11017:EE_
X-MS-Office365-Filtering-Correlation-Id: de105cf6-16fb-4903-152e-08dd5b0dc8ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dmxaSmVXTVV0Y1YvcXdqTzgwQy9jZFRvd0p3OHZ4Nys3S2NvWDJHZEtIOWJG?=
 =?utf-8?B?cjNwZTBzTTdqcEpOSUYvWHFSZzJ3T1RPQytpRU5CRDdZbTd5TjNmLzVtY21P?=
 =?utf-8?B?ckszMFBOZjZFSjQ3aURqclMreXdERVVjNTI1SXRjaHdPN1R6REpWcWVTMVpD?=
 =?utf-8?B?TnRvcWVWNytXNldySmZ2NzRtSDI3ZXNEdkl6d1lLaWdTS2ozeUExMVNaN2hL?=
 =?utf-8?B?bGloYXpKQ0FDTFJoOGRDdHQyczBzWUo5TjBzUkxPK3lrdUxXTkJHdTNpOE52?=
 =?utf-8?B?bVU1VHFENUM3OExtelB5bVZSREcraDk0dU5aQTBFekNrWGR1UHVoWWtlMkkr?=
 =?utf-8?B?MTFKS3N4bWJJaVdLdjlZN1kzL1lScnc5cmNySXhNbjRLdjNzbVlJYkJPbHVY?=
 =?utf-8?B?QjhlaTByTTdjRzF2L05kT2xpSE5yYXI3RVhzVnNYOVh4SnhhQW5LWUVIRWox?=
 =?utf-8?B?Smwvd0R5VEREZ0FvNFdZTWxFdDF4YklJTFd1MXMrMFpTTlFZdW1TbCs3d2hI?=
 =?utf-8?B?a1RSZmdmOXBkWE0zSGRlSmNlOVVMcWdKQXJoVXFxNENDV3hETkluY1dWTkN0?=
 =?utf-8?B?a2dwZmZyWWgvdG1qekhZZm5ZZTZvYVhmRThMVmtBVnduR2VsREQ1b3RaTVdH?=
 =?utf-8?B?V2JKTXVRNWRIYnJ0ZVJYT25sUzc3UkNybmZENDRMMWVZYzY5QzhYbU5nc2lr?=
 =?utf-8?B?M3FLMnkwY1JWcDNreXcwbkR5L05UTmlNMi83TmgyZm9QU3BERnFWdUFjQ0hs?=
 =?utf-8?B?aFYzWjJPV2ErWFp3TEF4YWlQZjU0azl5bmxNc3U1YjlPNEFWK0NEcHVOMFIz?=
 =?utf-8?B?Z1c0MVBrRWlvSnVCYkJLaTdFTzl2QUVvODVCem85Tis4bk9YMnZpVTc4eTRt?=
 =?utf-8?B?TmJnd1FDejNMU3JNMEZEcGh0Mkd1TFJYa0lNclpMbU13c1NKRUkwUUlWNG9E?=
 =?utf-8?B?UVFraGJlODZMSGNJdTFTTWhYLzNXeHlnVFpwNHdBMW9LQVNNQytGLzhteHpl?=
 =?utf-8?B?Z2VkSXV0dHNXMlpxaEVncjl4WDV6bFE1c0MyYTVGb3REbkp1dmkzS0VwcFVu?=
 =?utf-8?B?TWNycUcxVXpjd3o0SVMwVHg5WStFRlZIaGF1enpVem1SbWVWNTBjOUswQ1l1?=
 =?utf-8?B?ZnpocWJKYmMwNUVvYkZJWVo3ZEVPQ1E1Z1lPa09GY1JsK29ZM0NxYkhpOWpI?=
 =?utf-8?B?SVFGeERmaGFOMW5OSVJPcU1GY0oraG5RczFpUUpBUytHemdoR21sS2EyRWJz?=
 =?utf-8?B?bXRoUWJJOVVhalpIVU9VUmNsZE5veHo3VUN5WlNwNWdiMmFud0JYNE9sbmpu?=
 =?utf-8?B?OTdITER6dytUQzlpMGRsQlVlWGpNS0l2RnJzL3M2bFROdHlYcE1vSDlGK1E5?=
 =?utf-8?B?Z1dVQmRYV2Z6VHh6SHhMNmUxRVZMbW1BazE1cTFoMmk1Y0dyMmo1b1k5UG9q?=
 =?utf-8?B?Y1hjU1JLQzByemVKOE1IaTF0VXorRTVWUDRPVXJMN1VYRXFaNW9nbkx5VFpU?=
 =?utf-8?B?dzk0Q1dnRUtmem92MUp5RENnZDRkbER2UXBZbUlYbkE5VitFWk1yR2RBbzR6?=
 =?utf-8?B?ZlpnMkhNUTFERWVzeEYzUlBqQlFzemszRDMvaG94ME5vK3pwUWdBeVZ3NXpm?=
 =?utf-8?B?eVo1dEVUSUwyM1dDUURXM0VMYjQyTkpNbmZtQzdqNFMwR3BCZXZFQW95SzhF?=
 =?utf-8?B?ODFXZVI1YTByekNGUDlaZG1kRmVmbUN3NUU0a3AvenN4K2U3NnhaZk8zYktO?=
 =?utf-8?B?MUp4bUU5WFJLM1dUTGZrZXRtM2kwRkVtcnJoQVlJTjFkODBVYldEUW00S21S?=
 =?utf-8?B?RHBXemI3ZzMyZFRHVngrZzU5SGhGVFZDaU9rdHIxOWI5cVlyTElUY3RZbCtO?=
 =?utf-8?Q?9unT7WmO0RmaR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZGNMK1I2RFBoWFNoZE83N2tWcjRwMHFIQ2tUV2d1cnBzOTFrZE9lc1RPblJy?=
 =?utf-8?B?SnR5b3MvcjNINTNlV2xpQzRHNWpaVVlBRVI5dCtYVSticzlFdWJ5ZUpwQTRO?=
 =?utf-8?B?NEUyNGZlOEFtWVRSdTFjay9YRTVISVpUWU9aUm9tZEVqb0NWYUl0TjhKM09h?=
 =?utf-8?B?OUZJcHRoQUF4ZVRnSGRKeldBOU5NeVk4b3Z0Qjc1czc5MC83cFRMTmk4YVlE?=
 =?utf-8?B?OTBIOXozVTZmUlpMNFlOeWM1SEpVa3Vqd0hTeGw0SDNJeWVaVFppTUhSOGZS?=
 =?utf-8?B?aTk2eWR1ZkRzdFh0cWRUTFpWbXVMeDl6Zy9kTVkvd2lrNG51cDFCRkN2QUhV?=
 =?utf-8?B?dEdyVGltQXgyYjBYb3FJNXpyVnZSTEdBQjdKTEZWbDhEVFJIdDhuT0hrb2FT?=
 =?utf-8?B?SmVsYTlqaWEyZmRxWSthYkJJYnhRdDM0dkNELzVibHlHMEtVMzN1cDEzRUJE?=
 =?utf-8?B?Vml1QW5mNkkySW9vYThuai9MdFlQdkpNNllEbm9QN2YvMkdUcWFyVCtlZ3lu?=
 =?utf-8?B?VUZuR1ZtSTdzK2lqMUJGOUNXcm5lRkswbG9RVW82dEVaNlBNMndLL2dIWFV6?=
 =?utf-8?B?dUs1Sm1DYm9tMzRvd1RILzYxa3p2dzU5bFowa1pqdGJaVHNMRTA4TjVPMWhp?=
 =?utf-8?B?dTJVK2h0MDlUWnFVRnFCdGozTTFFb0FqMW45NkpUMGswdjFuNFp1Wit0TTJL?=
 =?utf-8?B?M2lXdHZOOFpqM09VNGlROXRBRHdGUmJKL0lMOHAzVlF6ZkRkSDFpUTZYck91?=
 =?utf-8?B?a0VpRnR3ZW5aeU1PZWlSSjZobGozdTBzRWxNcFByUUxVOFdmeDJSbDhLNnBE?=
 =?utf-8?B?eGg0VzBsNk1iZ29ZcDhFWittRkNaeTRlVDlOYk9oamdpY3JkN0U1NFk4dUxp?=
 =?utf-8?B?eWtkR3R2REVtSVJGWnhwUWFjaWZ1Mm45ZTB0NkgwV1hXKzI3MFRMSUhkUFc1?=
 =?utf-8?B?bTlWVlpyOU1ldDhDWXlPb25XRHJMZ21VVnpUb2IwOUsvY3lxbVNkVUJ0dzVt?=
 =?utf-8?B?RUN2cDNDSWF0Y2ZyaHNoN1lRSjBiVHZkM0xMc1ZYb1U4ZFppNDNnUGtuVlUw?=
 =?utf-8?B?OW9OS0ZMM3Y2YUNuOUlXamgxcVR6SzFFWmtURVJueXhSa1Blb1h2azZKS1pE?=
 =?utf-8?B?Z3BiUm5LMTNldytMZEJab1hLTlNKbTgwTjdYWnpjTE9IYTVCSWtpY2NIS0Nq?=
 =?utf-8?B?cW14YmlLbVR1Wlk1VnZsck96WUVldFlISWxqZzlQRjBwejdiWWpoNWlVVHlQ?=
 =?utf-8?B?TGhYUlNDVTZITHdxcEVWQUJWc3h2ckd0WkpWWlhVYmtKeUhkMEk3ZVkvY1FZ?=
 =?utf-8?B?RWJrTmdqMGZsZEJMSmhMWVc1RWtwM2NsNm9Vd3B6dEdRWlRrdVJPNzFlYWE1?=
 =?utf-8?B?MGF4YVNhWitPRFFnYTJ0bTJ6OERUSW9XWlp1SFJNa01kT0NFL29pL2R3alpB?=
 =?utf-8?B?V3E0b3poWEVicXBxUVJUc21QU3d5Q3hFOHZMQ2xVRVJreVYvbzJUbWFDcW56?=
 =?utf-8?B?VTlXdGJzNmI4bTlJR2JiVStLTERyR3ZkTGh6MEdLamhnR0dQMmFBZHp3b2NM?=
 =?utf-8?B?d1hwdEMxRkM3a0tPTzZ6aG9qYkxpeDBXakhyQmVyTGtIN09GcGVGalBiMlZL?=
 =?utf-8?B?aGd0NnhReFlsbTU3WC9lRGw2M1NtcmZUd0xTNnF5S09rbHZOejhueFpoTFlB?=
 =?utf-8?B?MkFCTnFxV0VBM0pMZFJTSjBYQkhyQUtUYUVtNVZaS0w1YUxDSlh1SURZNEI2?=
 =?utf-8?B?ZzJML2FqMzQ2eHVia3pHN3l0ZjU0bjhYK1dNblJDTlRxN0tITGU0NzY4VzM5?=
 =?utf-8?B?MU9tSE5lcHRWTHVwNHR4a0d3SnhVMnV4dDlWengwa0IxQ3VyQVE4Y29xSkw2?=
 =?utf-8?B?QW1OMGtxOFAwN0RwcXFhYzYyUi9iMkxrWkhQNVlnRy9DWnB4L2xobnd4UUdm?=
 =?utf-8?B?NVVOcC9UT1FyWTd3WmxKYnJKWXluZEMzc2g2VHlRejB6VU0xRGJURFFrMGhU?=
 =?utf-8?B?ZnUrd0E2ZytvUzhBT3UwbXZyMEUzNkZVRk82MTdTMUtDUk81b3k4VXZwTUh4?=
 =?utf-8?B?V2xKS2dkUUhwUnY4bG5oSVYxTzBEWnY1N0t2ZEhwYmlWbTRHSlN5Y2QycVpZ?=
 =?utf-8?B?S0NhUGNvcis1alBUeTZ3T1FLKzZiMVRCZHpUTWRmVjM1VUZ6bURabDhLa2o4?=
 =?utf-8?B?WEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: de105cf6-16fb-4903-152e-08dd5b0dc8ca
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 11:14:51.9091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/9YIzeJyBcmuPXuHl1XMp7O25eyOeIwJszUh9kuOkg3NNv9qrFk6O+xHgO1kAi+dVRVucZcK7NvnpCNvld8swa5IsYuCSaHulVJWxpBvyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11017
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Mar 2025 11:15:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6495

Hi Ross,

On 3/3/25 6:20 PM, Ross Burton via lists.yoctoproject.org wrote:
> This was removed in 2019, so swap it for poky-altcfg.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

