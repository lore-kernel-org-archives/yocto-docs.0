Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C505E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 10:10:54 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.37])
 by mx.groups.io with SMTP id smtpd.web11.41550.1736849446794984484
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 02:10:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NHh61CBW;
 spf=pass (domain: cherry.de, ip: 40.107.162.37, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pn/pMy8NWycHvDep1nAbSUNS3sDCiWDH7FmJTo5xwp1dpnoegfy4MXUZw7YXRvKAUpwzR/KH9Gbf21TO8R3N2xCn3HJLRu6LYK5UqWJ8nqY2k/Vj4GKp0q7XNrpNVg9GOnMBGfi6wFDQMua15b0L4NXxeSPnXTBhRhp7qjo/BOHH7bOtzK3CHSw8embekjyupL7MAsS1Nj5kq4TJWPc5NPFEemhx4OmeWJ8kLqGfwpgS2XzDdEotbgcAe3JXvcVgKFq8G7ME2SLY3rmcSWE/Ex2K9ACqZnKvL82/IPG2WA+2ZKy5rPYSiPhtpmSxlJgcvfN04B3iSasAwlgMAlCOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMxXrVtmY4ojrARHl2Z9bsEjPMpJQ4JK7DiqvX70fTw=;
 b=iH+Q/21iYig6hB89n3EypJQbbeWQsXhjpUYpKmB+nwqTftErDzbSDrtew8299dvSNrh0UKwxe4lYeyEvI5FGLY9edsVt7cX0n+N9ACC4mOXbKSzO5Sg6Tssmu4CpOFlx3GxYLi8nX0tuki/HROBKGyCMMYzCNJalBvbISh9HZeR9PWm8M9i5uauF8TcNPkTdKD2j4Rao9ei3krLXMl6LiATAEefrIhiQ8sErpuJb4md4DLyOnvtsvxu41c6M5QELpdUcM8VnHxsbqTOWdlhCnB2GUNzu2M+PEgGUfnUvmLGJXC5tCbzQFu137mZpMIu6Ro7OXC11rOQB78B0PAaS/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMxXrVtmY4ojrARHl2Z9bsEjPMpJQ4JK7DiqvX70fTw=;
 b=NHh61CBWN/E0fLfqTTV8d+IjPOF0nqvLnBZSoDGGBFZkhUMYGt/gFkAYbBte5eSKij/B/eryNy5fJQLKXNFNEpWJStpK9IfnOq7lCcIXD0ZZaiJJnEG/9rcS6QiRhp7w4MWxiPZTsCm122tE9kHrr5J/c1HQUPz2NGl1KWgMNXU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7948.eurprd04.prod.outlook.com (2603:10a6:10:1e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 10:10:43 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Tue, 14 Jan 2025
 10:10:43 +0000
Message-ID: <b363d565-c568-4a15-be1f-725e24f0191a@cherry.de>
Date: Tue, 14 Jan 2025 11:10:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 2/3] sdk-manual: extensible.rst: update devtool
 ide-sdk
To: adrian.freihofer@gmail.com, docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20250113233736.4181201-1-adrian.freihofer@siemens.com>
 <20250113233736.4181201-3-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250113233736.4181201-3-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: af68f8fe-017e-46be-483d-08dd3483b48b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OWRqOWJwMkEwK09KK2UvRTZJeHRpbXJkUlFFUktPQy9JeWJ0bXd1enFoREI0?=
 =?utf-8?B?a2dGZE9rV3RrUzJzZGJCV1I2RUhlWC8rZjNsYm9Ga2dNdVNrdWY4MW1DUFIw?=
 =?utf-8?B?MHphbG85S0xtZFpzSDZVM3d1QmprcWFaNGQ2UGV0TzlRdGIvOHgxZmU5djZZ?=
 =?utf-8?B?cVFHSGVuVk85b0EyUzVsY1hPcUg0OE0yNUhPejdkS2lpOHlOOVdMZzhVRlpp?=
 =?utf-8?B?ZjVJV0VuR2ZCSy9McmNWZzNwZHRBV0xtaUNQMU5qVmZ3c3luVGdIUWlnNlJR?=
 =?utf-8?B?eHZRY0xaY25HWkUxbThNRDJKeGIvRmQyUDM0Mnc3OWJUd1Rsd2xZT2srV1Ew?=
 =?utf-8?B?eTNKMVpQdlVuM3hYTnhvTjVhdjhISDloaUhaMDVLZFJ4L0xOQzluVDZQVi9I?=
 =?utf-8?B?V3ZIZUZPMVM5bW9zZ1VaNXo4c3dQSlBaUWxSVWxnV2U4NllwcHJySzFheTRi?=
 =?utf-8?B?NDVvK0dCV3pSRjJZbThKTHJ4TVRNSFJxSEV3bzkxWTVBN0pBWGVkUFl2QUNC?=
 =?utf-8?B?S3NCNGRCOW9UMUk5ODBCRkE1NDNBaVZMMjl3SEYweXM5dklkK3hzR2ZNMUN4?=
 =?utf-8?B?Tk5lNE1xTUhmK2JNL0d5cFVUUUhnaXFyOE5TRklweWYycWpCVjhObW5WSTlH?=
 =?utf-8?B?UFpmeTRmNjFobFA2dXZCWnRRYlZ4UUcxVUJUblV0RTN3SS9WaklWckhaR2I1?=
 =?utf-8?B?THJOK3FJbEQrMm9ZTW9Qc3dsdmxQbWk5MHBkU3ZocGd4THZ0dmtKS011azZB?=
 =?utf-8?B?eEpuYUI3Tlcwby8vcTN6SHJXK3NTamlHd0p1dnp1UjNWR085Q2pWYmxRby8y?=
 =?utf-8?B?ZkVGeUNaQTRkVXQ1RUk5NGVhWXQ3azVwQkNodVpQNGdqeU43MWRxMHhycE1M?=
 =?utf-8?B?VkMwUHBncVNCN2lIZmtudm93eDU2WG52MCtybWQrbnVoMkZsRVVWNHE5QzdX?=
 =?utf-8?B?R1NtOUxkcUVlcDE5aWhPYnlXenJJMkc5VE50eFE1MEtPb0tXbjNkZlg4Z1BQ?=
 =?utf-8?B?dUJnRXdtUjgwZS9QcCs0WDNYZTUzTmlDbWpScEFSWXV4VXZ4K3VIYTJYcGZQ?=
 =?utf-8?B?d3ltbzFxeUVYUFYvOVJwMXY2QTZUTHozUEFyNWpUSEcyNE9ZQ1FLUloxeEQy?=
 =?utf-8?B?ZEdRaEFXY2V0eHJZdWxWVTJ4bzUzUlJRcVJCK1BIalVUOHEzbmRaTlptY2xI?=
 =?utf-8?B?OVlRRCtoS2pGSlRvWFp0c2xOMXlxWjVjTmFoSTNKS0dPTW5IbHhKOEJ1eFhy?=
 =?utf-8?B?Ukh1citBalFpVU5pazN6K2g3NlU0cnlUdmx4WEJQWExqeFo4bFpYdmJPYXJN?=
 =?utf-8?B?dW42bERTRUJqenphcldGdHl3cFhVRW1SUHg0djBuU2phQjZXT0ZJVllJNFdL?=
 =?utf-8?B?a3NWZE94UEVkMkR5aXZOWERJWVU4cG1BVXhvazRwbzdTZy9aZHBtMEh1QWNa?=
 =?utf-8?B?YWZqYTU1Vml4SUQ1R3NmVXlCWVJGd3RUQ093N3dpYW01Uy9RYm92dVNTL1dz?=
 =?utf-8?B?MUQ2ZEMySkU5WkwvZW5zRFcyeG9TaU5qUjJqR2pDTnQvZERrSEttY1JVM1FC?=
 =?utf-8?B?SFFqY2NPTzZ4NEluZ2lMdE5pV1ovSWZlRGpFT2JNVmQyZ2FtNkd6azZKN3Bn?=
 =?utf-8?B?QnZSbk5mR29vWWQxRHEvcjYwRjdDQWZjcWh4UUtLT1pQS1pVc3RIQkdFYUNq?=
 =?utf-8?B?dzU2M0pNdDFNcVAraWFabnNjVFROVmNLZEs3anVzcVI5ZExTY1pqRk9FbXZk?=
 =?utf-8?B?MGNNUm5WNzNNYmFsTlBlVTRBT0c1UXlzRUd3TGN5WC83N0o1RW10cDJUUlB3?=
 =?utf-8?B?V3ExcFdOM0hQMlU5bERJdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L1kwN0w3STlzVXVZQ1B4enl1T2trbkJKMmdXZXBGNDFWZ3RzRnBpZlU3alFr?=
 =?utf-8?B?eXlLNkhoWDZ3bzM2MkpKREJVRU9ocVpNZlJQN2N0N2JkUC9keWF4UUdVbkN5?=
 =?utf-8?B?Znd2MjRXYmNuZmlvUWFaekVkQTIrOGZCSWtrdDZYbDh1NFMydklyY2ZtcGFU?=
 =?utf-8?B?eTRoMVp4U3AxNDhmQ2pibi92WGlOVGZvWWVWdXIwY1d3SUpONHRWQklxcGpk?=
 =?utf-8?B?S1ZHMGRpckI4SWs0T01ZTlpaeXJvTThsT3dDNHMxTHhNSS93VWk2Sm9DWDB5?=
 =?utf-8?B?b3ArTTVteTM5R0d0ZzdJUmVibjR3SWJrNXFaSStFS3c4Z29ibE1OOEFqdW1u?=
 =?utf-8?B?TmlGLzJCMGNObHNyOEFRL09PdmNyNWJSOEEzRVI4bW00cGpnUGJQZWNFN2ZR?=
 =?utf-8?B?OXpDM3RUMm4xem95WkkvUTZERnpjaThrTnlIQXVoUmdGRWNjcktsQWtYVWRE?=
 =?utf-8?B?K2pHRjhYb0Nic2lsM2dGbFducSt1dEpha0N2cWVRWFNGYXhicURmeEkrOVRo?=
 =?utf-8?B?amdzbUladFdjRndJQVp2ckxsWEUxVTN2bzI3U1ZCVnM2T1I1WE0vVWlXcTk5?=
 =?utf-8?B?ZVBsM1N3WFNGRGd1dU9MbGJuc0pNR01ZRXdvVEpiZmk1N3FKT2RIeG9Tcm1L?=
 =?utf-8?B?VTRwZWRxTDFKKzFFRXoyNzg3ZWtacU01bktDN3R2K2NKbDFWZjhyUWRKWjVn?=
 =?utf-8?B?dFM3aW5GSzNYMGs4SGpvbjJSRGo1NElLWWRIdTh1WjBmb2VLMmhMU21lMUdv?=
 =?utf-8?B?bG9BQ0lqMjBYYWJHbGZUSm5jQnRuZG1yQ0kvbFVQbTZ3UWM2ekRud1IxTmVS?=
 =?utf-8?B?NnY5NEptQ01SdlB1dVQvK1YycHlFbkRqR2hONWkyZERvNGdFdERCZ3l5eXNh?=
 =?utf-8?B?ZnN1aDl0bzRJaU1WbXAybzBwMGhNQ2FNSFd3TWZob00vNGVyNjVEVkQ5UVA5?=
 =?utf-8?B?STF3aGFrSHd5YWliK0QyMnNqMlV5RXd6NW5LTjd4enhRRHBFZGlROGk1eGxZ?=
 =?utf-8?B?WHlHcW9EMkZiYzg4bWowZmlDMVcranBXQk5aNGJFS2ZUZ0p4ajVETHlNL1BQ?=
 =?utf-8?B?WVhaVi9JU0FOWTB2R1JQUzdLWnlHS0JjV0orZ3lIQmNXUHQvZU9QWjVqUW9W?=
 =?utf-8?B?UXF0Ti9jZldvM2cyQ01JdUFMYnFFczZ5Zno0UG1ldnQzNU5Fa1R0dnlFdDdh?=
 =?utf-8?B?T3RyNFBRTHlHN1RCbFhuQ3RkaW5mWlBxTklkRW8zN3hWNVRreGZBbnBCd2s1?=
 =?utf-8?B?bVlQdTNuOHVKZXRJaVljUTQybFN6MFZhRmMxdmxNYUY4bGpUMEZrMDIrZG8y?=
 =?utf-8?B?d0NFZmtXUW1XNUs3dzhvWFpkakhwZmtDbThtWlU4RHJpVjF0RzBQTGQvQ0My?=
 =?utf-8?B?ajlvN2VFVkJsZ05QUTNGSmVpWm5WNFJ2ZWVkbFZYa0VCQ1hNSGFBNmtEdlZG?=
 =?utf-8?B?SjdIMXR0MERSa0tzNnVPSFNTb21OM2p5Z3NGcGtldXc1VG1Uc2RFVmRvN2J2?=
 =?utf-8?B?RW5DUm03MDBFSzZ6YjhTNGdybW1UeDBsb0tSVzJzSXdYdTlWM3JCeDhHT3hM?=
 =?utf-8?B?dkQ0RGlRWXVGM2ozNWJSbSs2Ym4vVmkvMHYrLzFiZXZadHpFWnY3dEMvUkN4?=
 =?utf-8?B?TG8ydjI0TzBhSzRyck5sTWRhV2U1YXlWdEZObUxQeXJsUnZuYUV5WnpySjkx?=
 =?utf-8?B?RVRabTJtUjFBbW9Id2YyUzFkSWZra1B6VFZGeEswTkZ3ZXhDTVNVaXBJcHJt?=
 =?utf-8?B?bzA1Ty9qWGpLVDVsWXVMbXVLT3BmbXYwdmtJdmNiVmt2cmY3M01rV2ZHT0Zs?=
 =?utf-8?B?SEpwbEc4ejdzc1pkb0dCMy9SRVpmTjJxQ045WVJCQVZSUG9SN2dKYVI2UDNp?=
 =?utf-8?B?cExLL2djaUxydHdJdy9WU3JVandwL3drVk1JcU5yd0VkZFcyejNMUHRKcitQ?=
 =?utf-8?B?NDZ6c0hRRVV0bXlFeXJyT0szcGdPRjI1eXZ3T241OStWaHdFMldEeEFvWW1o?=
 =?utf-8?B?RkI2WDQ1RWpzTk43RTlEOE0rT0Jsa1FROVVWUHl0OE9yU05iTVJpMW1RMTJS?=
 =?utf-8?B?R2VLY2lEVmtqN3EzYVh6Y1p2dW52NlR0R2pRUEhqQ09nNXlNczZmSHJaNFU5?=
 =?utf-8?B?bHlaWWpsRXBXYkdHZ3lHcXFJUlUxMXN2bmRRMTVGTDFtU1N3TDZNRU5yb1Vu?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: af68f8fe-017e-46be-483d-08dd3483b48b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 10:10:43.1868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/4ChimDezeqLmoXWbISXLrXN8xJDgnT4kTCaCLK3zSZkXrkWnlEZefd08ZaKVwp7WtQjpJiuiFJabLw18JtwMn/qWTWmBcmYgbp0Kx7Nb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7948
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 10:10:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6101

Hi Adrian, Antonin,

On 1/14/25 12:31 AM, Adrian Freihofer via lists.yoctoproject.org wrote:
> From: Adrian Freihofer <adrian.freihofer@gmail.com>
> 
> Replace
>    devtool ide-sdk --debug-build-config
> by
>    devtool modify --debug-build
> 
> This change was introduced with commit
> https://git.yoctoproject.org/poky/commit/?id=1f7eb26c947dde14698ae6e2ab88f0637027f4cb
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   documentation/sdk-manual/extensible.rst | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
> index 9a50d7fc54c..3733997fac4 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -669,7 +669,8 @@ The extensible SDK supports two different development modes.
>         IMAGE_INSTALL:append = " my-recipe"
>   
>      Assuming the BitBake environment is set up correctly and a workspace has
> -   been created for the recipe using ``devtool modify my-recipe``, the
> +   been created for the recipe using ``devtool modify my-recipe`` or probably
> +   even better by using ``devtool modify my-recipe --debug-build``, the
>      following command can create the SDK and the configuration for VSCode in
>      the recipe workspace::
>   
> @@ -786,8 +787,8 @@ The extensible SDK supports two different development modes.
>      .. code-block:: sh
>   
>         # Create the SDK
> -      devtool modify cmake-example
> -      devtool ide-sdk cmake-example core-image-minimal -c --debug-build-config --ide=none
> +      devtool modify cmake-example --debug-build
> +      devtool ide-sdk cmake-example core-image-minimal -c --ide=none
>   

Considering the commit log that introduced this change, I wonder if we 
should mention this in the known issues of older releases, though I 
guess the whole example simply doesn't work?

Also, we should probably highlight this change in the migration manual 
somehow?

What do you think?

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
in any case.

Thanks!
Quentin

