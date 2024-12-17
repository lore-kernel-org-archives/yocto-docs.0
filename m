Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F2CE7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 10:37:37 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.17])
 by mx.groups.io with SMTP id smtpd.web10.78583.1734431850344056973
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 02:37:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kVihrFWv;
 spf=pass (domain: cherry.de, ip: 52.101.66.17, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtlSqT2KeS8iI36rfa4Vdw4QsqPfDMXZNW5ndnsS66HyLd4t3WxKNuCqE+1LmGoP8FU8lhWipBP40DjTh5k1YlAHxP9irmP3xh+NNH0fm8JzmWz+DypJd/CHpHoWmqqaDDpHCxsWNO9e7avaLuw07MAEG+J93RVs9pe35NNeBPFua3DriYXTfTvS9iJZKUNEMAjA0WGJ+b54bxK8a2V7vooUYVDZ9WxzLoi6i/gqtKDYy9FXOdtejy+6jcPBC0rQGQWaWEsLOY8U2BItdzwCVq+5JHNpZ906ZvCjsn329qc047Uu8z7VkWbHI1N2uXnCe1r+RSvxkTyQ4td8Dxiv3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKrvcLAxB3UUImlgM/ebx9rUqF9e5rACsBkwSCCD9g0=;
 b=FZUDkrVMuCgsPmso8l246yDr5JaBJbVY4kNzlXe+cPJvbUhCbV+MMKTT8tbwrfA+nEzPkETKRwdPzevdkqXYupaWLtZtbw6NlQTHl48gebXc+vEP7udJE/17iSeoPrLl5g4xAIRvZY/ruHPaIe5rldglszr2hfZU2dxr8mS1CfB4b5Qd3DclFtllLz2tmTJNCreo1iJS6Fs/KWYcNlclYqAEwZQYa9up6qbT1kWfzh4Kw26IUkt6mrdqxGU36NKUYDOyk1xhDCABkpS5tRVF6MtUT0Ms3uwjqHf8jbeTYWNbyefCsEXL6isMr+eDA5+w5YkXpJTejUt9j5DXJv8Zuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKrvcLAxB3UUImlgM/ebx9rUqF9e5rACsBkwSCCD9g0=;
 b=kVihrFWvbw+lKp8yYMR62AxfX/a6K/FpxdGCBAaYpbqGcBTa6bNNMNj2PIWnHwF1B5jyW/ShTW8kYSGtQ2XhH0DuruH2DG05Cjq+wUd2iDDZm//KyYyOC7mctAe+dhwSXr+sGxWkhJjeFQqvCg9lcjlHkVRFOB3+TWKQzc84+Tk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB6904.eurprd04.prod.outlook.com (2603:10a6:20b:106::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 10:37:27 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 10:37:27 +0000
Message-ID: <6d7277f7-2684-48be-8f0f-cc0d86f8c354@cherry.de>
Date: Tue, 17 Dec 2024 11:37:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 05/14] ref-manual/variables: document
 the WIC_SECTOR_SIZE variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
 <20241217-release-note-5-2-updates-v1-5-b189493b1b09@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241217-release-note-5-2-updates-v1-5-b189493b1b09@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: a0aa8bd1-6b28-44f1-8c3e-08dd1e86cce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dkZyOTM4NkUrZEw4YnEwM1IwUzZxWC9QOFRUd0pjUjVXS09ITlJ5ZEN1YlZv?=
 =?utf-8?B?WVVWZzJnWm5sSzE2RmdJYlhMSVdqM3ZrMWI4MHBxT2wxOFFJWHgrdCtHSXlB?=
 =?utf-8?B?OVdzRnJsYUNZTFErVmpHS2ppSjJkYlBMbElDTCsxYmhkUEZiM084THh4WWd4?=
 =?utf-8?B?RmpXOXd2eHRNbHdxcWtqSVRzRWZ4VGN6b2Z4WERyWlVSaXRmc0lMY2s1T1JO?=
 =?utf-8?B?Z21qTDBzVjZTd2RvNWhKdVNWQWt6Wm43akJVd0tJd3NUalM1M1FoSEhPREdo?=
 =?utf-8?B?OTJ0dm0wU29WaFNmWkRVQThCVVllMkg0TVJ5elB0WGRILzBhUyt5S0FDSnB3?=
 =?utf-8?B?elNVSm82MlNhQi9uampoVlFXQUR2VmRqUXBmb0EyeG5TbWE0UDNuVzlzMzVv?=
 =?utf-8?B?T25PalhQMnFWRnB6R0VGcmFvV1ZNZzgvMmd1N2RiZFBvMGxTcUNYSGMxMjY2?=
 =?utf-8?B?V0cwY2JMQ0JXTi83MWVXZTVQS1pQVzNKRThPWVFYM1ZWUjdIMTRKaUtRem0x?=
 =?utf-8?B?dFMzS2FBQ2Y1dkV1dkdNWENkQTZVRUlWZXNvQlRENUlDZ2tTajZTTU5TaS9V?=
 =?utf-8?B?TloxZmgyWHRkRnJ1cFRjY2l0V040a1ZtTnBZYWRGaHBleE5OYUxkSmhzNHU3?=
 =?utf-8?B?dmFLL1pncmNLY2wreFZjT0pmUkdnTDd6RUNDTE1iM0xreHpBYVJwUWFKK29p?=
 =?utf-8?B?YVdsM0lVelVKZzZLaWNYdHR1eEpXT1BnL1lxOUFaV3A0RkNpbTByUjM0QUFl?=
 =?utf-8?B?N2dRM3pkQ1dTUkozN3k2cWhHUXZXbjhXZ0NJbXZlYjdrMmdPMW40SXFrbDhZ?=
 =?utf-8?B?RCttendKN3ZUNFZwd3dQT2dBRGNZRzkreUYvckhmYzNaWTczbDNoQTMzeXJw?=
 =?utf-8?B?VHl2RmNtUVhlNTh3WHgzRjdEWTdzcXF6OVhKTC9SaDhrQXYxV21YcDMrY2JD?=
 =?utf-8?B?ZzNTR2VBcDJJNnhjeWhwclBGQWVCYlZIMXBhY3RickdUSzZCSzRXZ21ScDUx?=
 =?utf-8?B?K0c3OHFpNW5XSWhwU1huU3dxWnNYWGpNWUFCN1NTQm1ZblVONmpLRGF1Rktl?=
 =?utf-8?B?VWx2Qk9qNkQ1bktqallYYUI5T3lSUVVXREc4VW92WVNPeVkyc3ZMd3VXQyt2?=
 =?utf-8?B?cmNGN3dSQlYwUklZaUdEbXQzdFpNb2RMblQ0U2ZHTW5zcjNQVHhDazExem01?=
 =?utf-8?B?MU4rekt1d3RIUTlmMlQvR3B3SHMzOFpBc0FyTXR0eGdVcHV1NWpxbzRlSG8v?=
 =?utf-8?B?OGVlMndpcUluVDVBTldtVVpCb3RqeFRuQWoxMUdZVnV4aTJrM2xmbmZUZDEz?=
 =?utf-8?B?c3RMVmlwYW1iamFHeEJzS0ZiNkVFSjJDTDZRTVpwekdXUWlWUW8vNE8rRVZh?=
 =?utf-8?B?ZnZtdUJSWTJ2M1Z3amdEV0hDcXpCOG9keWdvL2w3UGQva2F1Um9nNzVNSTE0?=
 =?utf-8?B?YWVjcUkxSWZiNGhGc2N3Q1BKUXpQQTRiZXZuMEFYbFVlV0ZaQVZubmxNWVZ5?=
 =?utf-8?B?a0g3U1RGMmNGM2R3N0ZpZHNHdFRncXBTdUVYZHdDbkh5MWg1NGNOSEhZOWx1?=
 =?utf-8?B?amFkSVlCcWN3VGlmcHpDbUtRK3VvME1JRllaSUpZWXE5SXlqOGtrKzgxc24w?=
 =?utf-8?B?UEVqQTcydjhCZnNHZGVtWnRWQS9mTWJZcTFqNHJtZXFoTXFvQU1EaytNcWd3?=
 =?utf-8?B?N2JjSW1MUEdaMHMyS3crQ2F5bUwrYUhDdnhsQlUrL092ZWFDazV2ZDVoK2xh?=
 =?utf-8?B?UVBGd2trbk0rMWtPRXl1NVROTTZmeXR0eHdTc3k0OTU1RXJSRDVvQ21JUnNW?=
 =?utf-8?B?MCtjeE9CdlViTXRCVzNWRnkyZVRsZ1F3U0hhT09hWTU5czJyZjh5VE1LS1Fh?=
 =?utf-8?Q?XWabW60b+iutp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1BTRkNzQjI5MkVLRmcydnVZYTVLcENJYzlkbEtOQXpSR1FML2g1Rml3dllj?=
 =?utf-8?B?WC9RWEY2SC9JNUkzbnNhRTd1N3ZMdERTSFJleEJya0JnVWtHamxZQmlycUlD?=
 =?utf-8?B?Y1AvTmZoYVZHOTB2Zit4emttTWx5ZnpPczZYSzFnbmNDbnBMVEJFek84MUlR?=
 =?utf-8?B?K01uRGZNYThsTmkrU2lORytBOEpkQ2U3YWY4YU8wQnNZSFZ0UVQ1T21pZzJH?=
 =?utf-8?B?Y3Q3NTN4bFlqWlVxc2JXSnZLRERLYWtjSDN1Yk0yTVE4R1FCdWU0Qzh6SUhn?=
 =?utf-8?B?NFQybEFEMUE5ZkJTYlBlYkIzeVQ1TDJIdWJKSG1jSjU1YStjdHNlbTBrS051?=
 =?utf-8?B?WStlY3lUYnFRYzdueWhOVkszaTBTUVdLZ2NyYktYTS9wamY0OEhvQUFCK0dy?=
 =?utf-8?B?UFpWQUlZQmtmK1F1YWxTRXdTdEtTTzZYRTZ3RnN3a25neW1yZzlZc2Qyb0Fm?=
 =?utf-8?B?U002clNmQlV6aXluRGJXTnRzc0ZSNnY4RVpsNmNHNmJSZXhnSnViRmh5ampN?=
 =?utf-8?B?M2NSd3BBd2NFTTM1VTY2MHlyZE45UVRQNlpnN1RLU0cxd09IVXFFKy95QVBZ?=
 =?utf-8?B?OGVrZkI3cndvcndIRkM4azBEZnlkelhURUJGL1FYbmxOamNzVmJ1OVdLdDIw?=
 =?utf-8?B?RTBnbzB4MVNxcGt4ZkdNOXJBZ3c5WnVNWWJMOTVyRWFNNTBiNHY4eXRmekxF?=
 =?utf-8?B?bjRyQ2lYU0xHMW1EcFo0blliZWcwY25ONEZqcEpBSVp6d2QxSnc0WVZLMVVQ?=
 =?utf-8?B?dTJKbmljMXlGemtlZjMzcWhRSTZBbWIyTnJWYVdiZ3RPRDdicGhDaGpqTXpL?=
 =?utf-8?B?WW1UVnc1Y1pyQWl2MUJCWmhxS3VoeFBXM3lWeXVMaks1ZHd4V3NMNFZwY2FR?=
 =?utf-8?B?L3ArQ3ZGL3NVTzFTVjdrN1YxQUZlWVhNeE5rK1NWQlJSVEJMb2hlbmZFM3Bi?=
 =?utf-8?B?R0FLODNOQWNhbGk3M21NV0NxZmZ2Y05xdmQvNGdiSTh4QnR2K0VUemtnNkhJ?=
 =?utf-8?B?QTJnbjRVQ1pEZ1ZwY2ZrZHhFSUczTGtPVG9ZYUd5S1NwTWt5VjkrTG9PeENu?=
 =?utf-8?B?Tm1DbzlzVVlXeHBmOTJ3WDFWdVFNYXNVTkhZWXA5Um1sQTBRcVk3b3NLa3A2?=
 =?utf-8?B?THR4eTBwU2VQWk9ZMGVkT25lTk91dlZwZXNMa0wyZWx3TG5RWmZUSWkwRmRo?=
 =?utf-8?B?ZGxtZUZoV2F4WUFpZTlUVnBvamc2N2syalk4VmlGRjNFTGNId1NNcFJ3MnR4?=
 =?utf-8?B?cHdGc3VVYXR5Qnd6bkZVWThlNlNvOHRYOTgrdHlOdi9KUlcrWEM0RmpWVWho?=
 =?utf-8?B?MGQrdFNFZlpuTUpGeFFvVVdVWXJKTEswZ3hEOFFxemNsZmt3ckI3b3dkZlgv?=
 =?utf-8?B?OUR2MkFjSWNoQy9ibjVpeks3ck5NN3hDcXRRRDhkUkVJTDdXc2FCYzQ4MWda?=
 =?utf-8?B?elBQVG9ObEVTWUdQS2svY1lweWYzY3JuTjV4aElQMURna3NsaWRPSGp5cWhE?=
 =?utf-8?B?TUZJM0JQZ3FFTkJjUTFlM0tNTWhwazlQaWdkam53ckduVTByVU5KaGQxWmI2?=
 =?utf-8?B?WFBvUlI0bnhmcDF6bE5meUJYdHY2bU5BQldpaks2RmUyaTA2VGtUc1dzQ0Rv?=
 =?utf-8?B?a3draVNvM1BuMU9wWk9MQk9lUlQ5d1BRNkRsWVVOdm9wditjN0dQZTJEL0o2?=
 =?utf-8?B?elNVTGg4K042TzczRDJnT3RVeFlGYk1nRjdHSDNBY3VvUWd2Z2FPN1ZkRnJ0?=
 =?utf-8?B?T2g2QWlVOHB6RFNmZjlVSHo3b2REVkFNdE1Od2k1L0NYNFBKUU1sM3BQZEMx?=
 =?utf-8?B?R2toaFBFbjNlUDlsVTFxanhUS2ZCaW9BWlNjbGNHTmxpMVRYUzc1OTRiMjJn?=
 =?utf-8?B?ZUpjY2d1Y0tLY3RwVStmQ3RNOWgyeFJOblVLdzk4U1BQSTZsbHhCV3JTWnQr?=
 =?utf-8?B?ZFRMcDhYcW1ESCsvcGdTd3FkM1BqWXdNNFlKWEk5QVZDaER4ODJXMy9KeFVK?=
 =?utf-8?B?WWlJRGtZN0NvWTlPRHdqVkdrYkJiUEpiVWdENE83cFNtVFYyY1Z1eTVHeHVl?=
 =?utf-8?B?RlpsWWZycmxMZkJXRjdGb2ExL0wrNW5DR3lFMXNGWHppbDYrTWNNOUp0OFVZ?=
 =?utf-8?B?YmZ6OUJCL0plNnVSUzhINTV6amtyczhEY2tpVFJsUmdwNTMxT1dhakJMbUNO?=
 =?utf-8?B?SkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a0aa8bd1-6b28-44f1-8c3e-08dd1e86cce5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 10:37:27.0691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnI0rEXFFIRWljY8RGPr/UvSuyKKdsezvAw9P4QPnyc51zZ9yEiUcTlbeSDUN1Lvo2iZxN/KtBxZKlNtiT2NiektXQ8VDeR0RFbmwZsem9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6904
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 10:37:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5957

Hi Antonin,

On 12/17/24 10:27 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Added recently in oecore to control the sector size of wic images.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

