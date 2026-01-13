Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788D8D2F32E
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:19:43 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61182.1768317564071612071
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 07:19:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=eT6gNUO5;
 spf=pass (domain: cherry.de, ip: 52.101.65.36, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHj64AIS+zoV+D1PX+IiHtbLcAqr/DYdzMWqpkgceZAaZq0zKI2Gv+y4Rei6TCxxeU8Wcvcg1eylUhF8rEtFWBe4NTCTYedbkhUJ/TchneiapVR8TVDRLQmIXPIJu+nm1gQHorAGJ0k6gP/lVIsNL1DKkx8zXI0Fq70sN/wzPymUfHnqwrmSsHwpagFmR5yNtGYbmNckP4GBNPQo6wSko806XtxyxhlpVHbeJdFN++2b7hhTcluX5zNYbE4d7VMzndrpIy2ExZ+9f8flEOCiK57YVMVbombvpzT16PDWEVWKu5KUZzascsuXCZ3sJI/Tq9xkeFzW4ydUxrCrkedE7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J/CVqaMHyuIJJr1bOEQbCI6SxvF9gyAJ1f74qlJXp8=;
 b=ctssOVbhhc1J1mmDim9p5zg15I4Q350GOJYazchJ50tV/hw2aHu2zD3zK0/vX95u6gZLJ3QXB/DgfyrCVOsJFf5LwhFQXI1zk7wIaXSYF165zDECTCD9c0CYGfwvRjvxylmp13/rznL2ZIjTJ6wmH41JkrNVOUomEHqmJlkpJeGr6sJ/xVe7XdaXRor3mk7MSQxkTJSUpPBQAfGQ/7I/Pbcd99jkSEz2akws5ops4VS12lIKmzsDerFUxUtkJDBrco5mOHyw1ly7SKeqQPxLimHkiMrJiewOIfRjWf7LuYr2UbJJVHFyedtzjAk9cJHFXtJCMW3GI417gAFlFSouYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J/CVqaMHyuIJJr1bOEQbCI6SxvF9gyAJ1f74qlJXp8=;
 b=eT6gNUO5c++On3LDz55DljsoY/KJZz2LpwwBmlW8Fu1PP/0lRzT0BrDWWnoqo1fXWU4cK1lPSJGr5mZebYyZEDWID1FT4XdGJ2MfxJ6EIxsxTykOJ9fTR30rxLe20NrSpLJqhdALcxfhzfzPTrrr0jmhAC6Uw31PVedTZ6TvD4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBBPR04MB7689.eurprd04.prod.outlook.com (2603:10a6:10:206::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 15:19:19 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:19:19 +0000
Message-ID: <a450ea29-b415-4974-9db1-2c3239834f88@cherry.de>
Date: Tue, 13 Jan 2026 16:19:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 48/53] ref-manual/release-process.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-48-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-48-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0291.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBBPR04MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d60eae5-4f76-437c-d567-08de52b71f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WHJGQzlrQWdrMGt6Mk5Va29laE1jRTlGOUZRZ1JyTTRYK3VHU1VIdEdMSnlJ?=
 =?utf-8?B?Um1RUnptamVXK28yemZaOW5mMlEzbVFxYVM4YTBhUUVyeFg0RmZ6ZzhnYkky?=
 =?utf-8?B?RDRWQ0JPdFJWbThMQnZyU1VhM2lrTjVHa1VHeXk0U0VWYTY1cURsa25tSHVL?=
 =?utf-8?B?RE1uNTFxSk91bnB0aktDSERxYmVKVXVWdnVZR0ZIWE9YdGtFSmh0WHNWZ1Fv?=
 =?utf-8?B?cnB1clY2cS9WNjg0am51QTUwNlU3KzdxRXNwc3hqNDltRjhBNHcwMGtQeG5V?=
 =?utf-8?B?TGRqZnU5NTR4R2ZWQ0h4SS9aaUc1QSs3NHhhY0JxWG5Ld2hVUTJhQXg1K0po?=
 =?utf-8?B?QkZkNFVoTzVQWDFrR1NJTm9ERk9BRDRXc0xSalVIRlJuOXd1YThzY0dBRWtB?=
 =?utf-8?B?ODUxcnJ3TkU1YU84Q0VRNXVOS3piaVBSYkF3V1RFQzNTNmpyQjVtbEUxd3Iy?=
 =?utf-8?B?U0FVWmJVYktkbGdIK2VHMFNNd3VGVndkVU1yRnVKWFg5a0NSd2FCTkw0eVcx?=
 =?utf-8?B?UVRGb3g4MjEyN0p2bTZzeFN3Ymphdi9kcDlWUVpha0hlaU5tbTAzWGo0aGtp?=
 =?utf-8?B?SXpMeHNtdC9qSWdCL0Jtd3RFakIvZ3J4Y2Z1aUJaMS82MWdFeEZadnJpQzRF?=
 =?utf-8?B?bStOUUlOSVJKQzRYZUczVUw0UjRjMWlzYzF2Q2gzdFdYQzc2SlB3b25mSkVI?=
 =?utf-8?B?ZHN2Z2lNU2dYU1dkWXh0M2FZdTlDWlB2WWw3UDcrZkROamNVOUZmZ205RnZv?=
 =?utf-8?B?c1pnSzZFYUIxb1ZJWk9rRjFOcHg5Z1hSQ29NSzlBa2VBYkJtSXh3Y1NJVnBS?=
 =?utf-8?B?MzkxMy9FVFRXS2RJWEw2MEtuZVcxSUR3TGRPVVIwY3YxSG05VkpQMjJNS3dR?=
 =?utf-8?B?Sjl1cnRjRzdabW1pcCtHZE9pMUlvbmJTczduaWs0V2tReXJGM2VTbEpCLzV2?=
 =?utf-8?B?MVhXMXREK0FwQkR5V3diWVNxSVpQOUc5cE40anRYWGsvZ2FiQ1N3L28vU3Z4?=
 =?utf-8?B?MGZWZmpqSGlQK1hNSHJVSHk0WWgzNE4yMk5GeGNtSWxyYUxpdmtsQVFDbnpy?=
 =?utf-8?B?d0tMV1V5T2psMzRLd2RsVlJFMGE5RWtwN3pDbUxSUG5seHBRODdiS3ByQnVw?=
 =?utf-8?B?RmlKNU5ZaDgvcUJmUXh2MmJvRko5c05wd1NzSGgwd0FsWVhCZ0ZXTElhZExR?=
 =?utf-8?B?T3NFN0h3VE1hSFB4MWthbGNmZHNLR0MrTEttYTN6RmZtWVR3bG5kTUpYencx?=
 =?utf-8?B?WlN5T3pRVi9ycklnci94M1MzNE1IK1RUUGwyeEI1SDhEVituMEtYalhqM3B3?=
 =?utf-8?B?c1pmTE1SZHB0RXNvWlV3UG1WMXZLUXlUMDV0ZzJGeTdLclRLMXcxR0l4RzA4?=
 =?utf-8?B?OHJiakFQRlVHaUU5ZjNkdWdrODR4Zml3YVFOeFpFYzVHMUtPb1p1V0ljS29R?=
 =?utf-8?B?czRydTNSb0JyUERxTFZUdkFGSFJJamtwbUZCK1plNE5HenVCSDBTNzdWVUUx?=
 =?utf-8?B?ZEszK01NSnFiYi8zY21BWExjclNlMFRCMjRNNng1MjRodzlSdWZaK2l1QXFE?=
 =?utf-8?B?bU9PRWVUNy9GeTM4SEo3bGlGa1BSelp4OUJTeDliV2dWRE56VnNhOFBvNGRD?=
 =?utf-8?B?MVQ3R0oraS84QUlJUXRrb1JkWFZZM1g5OVkwSFdNQ2FJSlF5VE54TzBncGVq?=
 =?utf-8?B?TVEzOGJ5bFc3WXZxa0VPSGdFeDExKzhxKzFJVDZCakYyaHkyNWc4WXM0a3Ra?=
 =?utf-8?B?djNaVTFMd0cwTlpCejl0ejU2SXdnUVU2QmpCZzhlMjM4UGhhekMyNU9xb1ZI?=
 =?utf-8?B?WWgxMjFRdFAwM0duUysvMVJSOWtaTW5lcGdMTWVvZ3RCaUJ4RUdkVDB1d2lm?=
 =?utf-8?B?cUtjVlZrYUpXT3FueGFuMGZoQ29FSnNlcnVGUXBQZlRUNkhsOEhXYW03TE9T?=
 =?utf-8?Q?dZCzLHrl+wXl+fghuwHSPFS1zu+Y5tI6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NGI4bTNha0lZbTN0VWVPbVdhcUtvcUxCdnVuYVJWSy9QQlBGRTVaRGlpSUha?=
 =?utf-8?B?NlMwaDNCS2hIMkhZYmJFTjhUV0dUQWpQWS8ySFJoN09qSWlBRTBKaHdvNnVB?=
 =?utf-8?B?Nzl4KzdiSEQ4UWszTWFWcHRYZGt5NUtDSGVJQnNVUlM4bGhyNW50VDVhcDJX?=
 =?utf-8?B?dlZTazJDcnlFdHZ6WlY2OURFaU5ScURFMGtaQjc0c2tzajhVWnlkQ0VVUmhI?=
 =?utf-8?B?bUkzMWIzWkF2VVcyWUlXbXpuSUNrQkw5S1hYSXIxdnZzUTduSkFFYm9UYml0?=
 =?utf-8?B?eGIyNzduMFUrVnVRWkVwbHdUZmNWL1U3bURPMytnclhvcWE0c2ZibTJpZWt4?=
 =?utf-8?B?aXIwQ3JWZURoS2Jnak13WXdTbTVnNUh3SGw0b3BJU1dHMS9UWFIrUHRxNExX?=
 =?utf-8?B?OWw0QnloOEoybWJCanhBME1hWjhKN3ZEY1E4WTZST0dYTEl1ZTNOYXkxRXZo?=
 =?utf-8?B?SlZuaW1xS2FYRFBRUzNmVmlOSnkxNDhEVjRiUmI1ak5JOWRMajRhcGZITmo2?=
 =?utf-8?B?N0RGdlUySjZuN2pGWU1laFpHWFFHbTNqdDBEUnJTUjc4V1kyYXNBMjgyRVZm?=
 =?utf-8?B?bDJrU1o0WE00alUzbXZERVAvK25zeHFCL1F2TXVBeHRpeDdNTHBOUWNKTmUx?=
 =?utf-8?B?c0JRY29WTUc1WUI0QjUxdWljL0N2eXpCV2UrRWNFQmVFRkdySExTS2ZxRzBI?=
 =?utf-8?B?K0hJdFlOMlFzQ2pNcUROdHJCaGtIc2ZwaEpHd0c5b1ovY25VMTNlekRrYi9X?=
 =?utf-8?B?WW1icWFRU3NwQ2F5QXl0L012Mk0rOXBlOUtqVHpKREZHaG9jYmk3ZStESlZ4?=
 =?utf-8?B?aFcwUkt3OWIvYmk2K2pPcEhOaXFLYXc5UkxEVHByK213VjgrZldmeW8ycFQ3?=
 =?utf-8?B?a1Rvd1cxSGd2R3lzdnlOeE56MjFmSlVzbklRSWFHNi8rbmRHWDMyZ0VLNWNo?=
 =?utf-8?B?ZzJTc0NhU0NXdmZqS2VySGN5RXRlVjN2ZHZlTWJtOFFLNkpwcXUwY3g4UEto?=
 =?utf-8?B?eFplNmV6SWR1RXpjYTRPemZNblhxcHo1eGNoWmVxYUNPNytKeXFkS0gwWEow?=
 =?utf-8?B?enhzTkduTTBZMW1GL2pxUmhYK3hwZGU0QlE4amU2eW9XTERTaUxDaGhmS3NC?=
 =?utf-8?B?QlV3bmVyUndZVVoyK1hFZzV5TlU3OHVEcmxCYW5tZGRqVzBQZmZuNmIxaG5o?=
 =?utf-8?B?Y0MrWGRleXRZb1hFdWdJaHR5U3FXNlNrbkFoYTh4L1YzQ1VWWHFQNUt6a2Uy?=
 =?utf-8?B?U2MrS2tKMXhMLzNva0dSR2RNM01LWmxnV1E1SjJRNFlKQmExeHY4b3JVNnNX?=
 =?utf-8?B?OHZ3WUthdjh3anA0ZU9EalZ6Mk56azNrWC83YkZMTk5ibCtua09QNFg5M0Jl?=
 =?utf-8?B?ZGY5M2cvSFQvRGV2bTNydFFUQmsyVVNremlBc09nMWlNcE5ySHN1alR5TzNr?=
 =?utf-8?B?TXpJVUk5NnpOTzMvaXRPSzRhd0Fib1RWbGYxZDhrR2ZYNVdBNE90S0dmbWRC?=
 =?utf-8?B?L0VaSjBiZmVHSi8wbnhiOWJYdzBEVXFrZWpNV1dzcm5WYzhFa0NtQTdUdVpN?=
 =?utf-8?B?NHZ1OEFSK2kraEhWZ0pBdkZRQ003RmJuMTcvRDBTQ0ZRN0RJR0JyV3FSQkF2?=
 =?utf-8?B?cWF1eG1tMDA1MGdOeHBqVW55Tm1ETUtoMmViR3ZDcVNXeVAyZ05UbEFlMEEw?=
 =?utf-8?B?RGhSSnlRczVGTnBqOHI5SDREK1FGVjFmVDViRkFmU2RaQk5iclI2aTJwaGhO?=
 =?utf-8?B?N21QeGNtcXBlMm8razdEbDJNK3l5cFdzYWJMaWJYMTdkSU9JUWJ6L0c2QjVU?=
 =?utf-8?B?K0ZxeU56d1VoeStWd2pxdkZYYTMrZTBXRzBoOEJQb0RqQjdoNTZPa05icFIr?=
 =?utf-8?B?Z2ZOdlBnR2VVZFhOQjFXK1ExdkpNYS9IUmJQclhQRko5VWRaaHdQOUt2MTNi?=
 =?utf-8?B?SFJqU3dvRmdtdGdrU2U4UkFRMldPaG93OXpXZGdpZTJEcUJ3aTUvZ0NhVi9D?=
 =?utf-8?B?S2IwcVIvaGlscDJ0UWNwazFoU1d4QTJjbzdpQ0l1Y3pvZzh1V1hlaUR5ZS85?=
 =?utf-8?B?MVlrOGExcVlQWDV6Y0tIL2ZadzZNRmhTSXdHNUlNYytuQ1NHZTNZN2F4MWlG?=
 =?utf-8?B?UERucW5kQUZTTjVqeTJrVk1XeXVVMFEvRnpQcXJEdzczUG1KQm9GT0JtanpU?=
 =?utf-8?B?Sm5XNlpSMEw1dllxU0ZPUStEL0JiTnVDcEFseXVJRHJoOWxubUhzQlZzQktL?=
 =?utf-8?B?U3ZRVGtKMnBMU2EyMzJtT1hFQ2NlR1pyUkdVbGZ0ZDhQd0JOd3BVR2lzYzlZ?=
 =?utf-8?B?SVJielV3NGo0VFV2YXNQajZyS0tVZmVZUGl4MlR5cDNvTVl6RGtNQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d60eae5-4f76-437c-d567-08de52b71f72
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:19:19.4184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOjbbV61jn6SS6l6vb+u63S8PLfiH3X2dECSbnTbHUlptgPDd7Wj60Hi0yO44mKwQqhowYRngnL5cab8z5j4UVZlFTf2onY+cbBZnr7VomA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7689
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 15:19:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8537

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/release-process.rst | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
> index 826354844..7b428efad 100644
> --- a/documentation/ref-manual/release-process.rst
> +++ b/documentation/ref-manual/release-process.rst
> @@ -193,10 +193,12 @@ efficiently.
>   
>   The Yocto Project's main :yocto_ab:`Autobuilder <>` publicly tests each Yocto
>   Project release's code in the :oe_git:`openembedded-core </openembedded-core>`,
> -:yocto_git:`poky </poky>` and :oe_git:`bitbake </bitbake>` repositories. The
> +:yocto_git:`meta-yocto </meta-yocto>` and :oe_git:`bitbake </bitbake>` repositories. The
>   testing occurs for both the current state of the "master" branch and also for
>   submitted patches. Testing for submitted patches usually occurs in the
> -in the "master-next" branch in the :yocto_git:`poky </poky>` repository.
> +in the "master-next" branch in the :oe_git:`openembedded-core

"in the" is repeated twice (start of this line and end of the previous 
one), a follow-up patch would be nice.

Unrelated though, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

