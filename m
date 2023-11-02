Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8A5C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 11:07:47 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.71])
 by mx.groups.io with SMTP id smtpd.web11.28065.1698923258317671448
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 04:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=OhoGR5Py;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.71, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkJ4QQ+7EkIDva5RZ5bLumZ2Ltgt6/J6OFmbvAVZe3IpAkV8sWje/SWAVWvnEF0pj0VpUEnqy6SxCwidNV0H88DoTCkfOmEvnVica1hABiCvCUGAK79BZXKNf7q7JyNjon31SNEtgOdigpPzXMQ2lmMHnrVa8r1VL6Q/oxFZe4y/nYidKzFuf/9cnkmsJXFXe+EivpH+ON/3rYET6p9RiEY5lQ+DzaXnQcJJort505tVtOrZzXGNuGowc+SwW9wJfRaXecpTtelsEOAz6MkLkK7pPDNP8LWoOwZBolZ6IdUqlevoGOjdaoFtwH09H3vKRGNl3x7YvRf7CWVgOgqi2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVznbLVJtN4Viprcm26YW727VXg+ZjBpImkwLUTa9vw=;
 b=oSxgnaHUdLltU6lSrRyLtzTLl5ndCsdrN7/5AF44AhgHx/6ooAElMsxZg+M3reeQRzZKKs/8daF5XaZdT4i/yVsQYK8Qh/olITfQeWAL1Ft4T3/XQqkgVG3Ksm4+7viQZoC58BfmurrYGcBDfPvgOcBL2oJPYyjInFgG6qnASIOdq25hCftuIYMc4nEUC1PFLt1c9fR9WEJCsSZY7BNpELA20hun2XF9jugsN56ynvDsJPe6/b6Qj6kNncTR1OhEdRv/QRq6K4/lhVfzFk6vvjx7L0f0ok/c/LgUE3U06Fea/afWdHEFS1ogTqluvAyOImK42IRGCDSqrHUFon2fBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVznbLVJtN4Viprcm26YW727VXg+ZjBpImkwLUTa9vw=;
 b=OhoGR5PyYf31Ttj4KnaWDlcJZMyp9FxApDsvUYnQeAyI5QCfOyqVIC3VXk8YZeo7t5EdFO6bWD5NELjtCQckqL89uXw0TO5rNVuru780v2yDXP905NQxA7JtTHrMSxysTX40DUKiZ21Y16Q4moqvnY9YapXbRPMgO0v6DqVqHC41wKOIXxdR6gwvYJ8VoAlGw+Af2DfZAHtsDJ4By+SA7vs1HUP/bk5LrrEvMYkMM9ravE6P2Ih31jNi8MQ/R3KakRnvhJ0ZuKFOYa6/lMUfYVXZMs+m6F2hVFPm/vvhelKVavAiRIzFx5k6FTFjm9cuXMcWMtR8y6vmgRoOSO798w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by VE1PR04MB7438.eurprd04.prod.outlook.com (2603:10a6:800:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.10; Thu, 2 Nov
 2023 11:07:33 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::8b7:c8b9:d800:8b4d]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::8b7:c8b9:d800:8b4d%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 11:07:33 +0000
Message-ID: <b4ad2cf4-efae-441d-921a-6ea767676e17@theobroma-systems.com>
Date: Thu, 2 Nov 2023 12:07:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 12/14] bitbake notes
Content-Language: en-US
To: ross.burton@arm.com, docs@lists.yoctoproject.org,
 michael.opdenacker@bootlin.com
Cc: nd@arm.com
References: <20231101172706.81576-1-ross.burton@arm.com>
 <20231101172706.81576-13-ross.burton@arm.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20231101172706.81576-13-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0337.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::14) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|VE1PR04MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 357098a7-3bbb-4688-7fdd-08dbdb93ea03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9FFzfikXfd1QrVxorwHyHV3kVDY9BWYZlpUjjXxG+CqFvspNTvLlnGyuQVAPfXxvA28/yF3SkrvrtPmIvvQJxMpEshGZwkY/dlysf+apysNIW3cBC5N8PnskEPA16VWL0obs0RhklITVHCBdkLYIKTrWRFfKCOqQqBZY24E77ZYUgaWLyZMGxd6yWrbpz2bDA/2NfCMauvLCNL1SesK46gBRRwx0sXBBS7clZgbRMW7kZqDzzYWKWLTCnLa5I5y1QI/iC9DBaPSFac6RdsCS/v3/SiVWoEK8nE7tvT4AcgNoviNHsH0DrHM63FYafclnMhUcB7tZxQaQmB59IRxREJfeGrsgx4WKmJtZnMzGYCkbyd6ItF7Yum5BkMa7jQQEZ99Q81rbHECo50wbfmK2o4C4TWuz68iSDwIpxfp/jr7acx5KdNivP/JsUtZ3kpLUsfaUVDk6hqrugCo4bpvdPms/rMd6kpLQzmh9oBa+1y9bfCh8eVXYFe7o8O02/T+6tw7L6o3EAHYctV31h/xHSIUFsTTZsqtuucludmMs5nmXwxafCwFHfxYqrA4iaNdxhbeVkIWI2qEiJieGTZADXrm40KzFanH+ps8LRlcU4bMJxI5xpOI9ipEFWKiy/fWQDTJYQqDZaikb8OssdlEjSw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(396003)(376002)(39840400004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(26005)(41300700001)(6506007)(6512007)(66899024)(53546011)(2616005)(38100700002)(86362001)(31696002)(36756003)(83380400001)(8936002)(316002)(8676002)(66946007)(66556008)(66476007)(5660300002)(4326008)(2906002)(966005)(6486002)(31686004)(44832011)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c29jTkIrWFdkNU42ZzhwbnB4Rm04TUV1Sy9uaWN6YVJGMGR1NDN0OGE1d3Vl?=
 =?utf-8?B?YmhwekwwRFNCejV1aWEzbUF1bU8zYk1hRkJxNHpBN1poOTR4dFNsdmVQbHBR?=
 =?utf-8?B?Rlh1NVo0ZW1OcS9RWjdTSXJvMUdzYkxSYitxQ3o2bmVKckdUZlltMWpaMU5z?=
 =?utf-8?B?a3V6a2RoRXh3WFN0L2tubXpONi9WMThObGdTaGZsdHh6ZWJFZzJyanN0RmQw?=
 =?utf-8?B?SHNRM05kRWFmVTkzazB6U1RPUG43RXBpd1JsQU1MaVRCc0tYNFZYS08rY0pp?=
 =?utf-8?B?N1ZNUUQ2b1loRE42QTNhbnd0ZEk4azlRWU9rVmFSMVNiL0tHS1hFOC9rQVli?=
 =?utf-8?B?ZzREelFBOGxtSnFYQmdqTGhkTjlwUnRvaEhXWVl2ek55WnlTR1JUK1VTZnRV?=
 =?utf-8?B?TncyY0VVd0ZLUGV0Z1YrVlNNVFhEb3diRjhrSzRZNXhkVVFUZEMyR2xsQS9v?=
 =?utf-8?B?Q0NMZ2crUFpnVVhuTDN6Z1VUZFBkem5RUENLQ21pdkJ3UkVMTlZnSUpEdU9h?=
 =?utf-8?B?ZEdKSGtaM3A2OVJOb1IraGJCUytvTGw0NW1VTk12QmlZY204ZjdjL0tzWW1y?=
 =?utf-8?B?RFRkVG9Gc2NSeEUvenlmcXlXZjk0VzY4MjJnNkQ5WHhPVTJkYldkQUcza3E0?=
 =?utf-8?B?WUNPYkF3U0M5dDdUV1pBMGFoQ01DQXZyNVRFVks5WCtjNE9Kc3pkdGdtbXFi?=
 =?utf-8?B?d3NxbkpHYjZjOFhWdHpxMWFkT3VaRVhrZVJkTUUwY0I5SHJieS9qelJ6UVZS?=
 =?utf-8?B?THJ1bWI3cG5LM0ZWZWg0UVV4Q0RiS0pKV3JHMW1ubFhWZ3lZYmRUeTd6ZlM0?=
 =?utf-8?B?Sll3aUF6SXB0eDBaOUsvczlBNkpSTytkSUlFWFpnbFFWS3gvS1ZNZ0NSbjhu?=
 =?utf-8?B?RXpibmRVUURNSmJpNERqNEo3MEh3NGNNc0lSNjRYOUQzdEFSVy9ZR1FrTnhY?=
 =?utf-8?B?OVJlV2JtYnRJdzhQSnlETUQwblIvRitGWUprWEVIRFd3OWRLUGVEQmpnUW9P?=
 =?utf-8?B?bzFmelE5VWhxMWpQOUwzbU11bm10UjRLR3orZ1JzRWJwUjBVaFV4UWxLblNj?=
 =?utf-8?B?K3pSdVZodloxdmZ4cUpNTTZLaFFCcUxieFh3TndFVmJYMjNJaEVTbVVmcTZK?=
 =?utf-8?B?WW1nb3ZYUDRHR0MyR0hBNExZdjJqUWU3QVZFTHBHSk10SVVQemdWSmpZZW1V?=
 =?utf-8?B?ZkFIeFlSZFJ0VkVMYzZqMmlWTmFScFlMVFRNUXBTcC81TWpRdXNoMFNSTFlp?=
 =?utf-8?B?QS9Zb1VwVjZHbkk2ZTMyMnJmQ1dBeWxFLzZPSjJSeWxlYjhZUnhtZlN1WVk1?=
 =?utf-8?B?T3pXNlBtOHd0bzIvVlBuUDNDUlJzcUNsWWJsVzRQNnRXZVEyYW1CbGZ3Mmk0?=
 =?utf-8?B?aC90SUNScm1ibm1DWVpNRy9OQjdKN2JjcVlkanZpSDhvMEhGZWVvWCt6cjQy?=
 =?utf-8?B?SlVpaGZZU3VQZEVtUjFTZThWMlpJUXk5cVNqRWNiTllWWDNSN1J4R1pkZHR1?=
 =?utf-8?B?bjBWYSt3ay9QWFFYVWRWVkZYalRVL0VlbU5WUFBZZjFxVHFZdjZwUkJDbzVn?=
 =?utf-8?B?OFJVdm9qZlJyZmVZbTJhV29DNjRjREQ0ZzFYMExvWGg5blg4WTdqK050ckhW?=
 =?utf-8?B?aDJrdCtJbnBGaUlzT24xUS9nUEdOTXU4Z3hMRTNoRG1tRzI5NjUrMnY1aS9D?=
 =?utf-8?B?RjZoUGpraUt0MHB4eDJrRk5Gdk9vcXpVdTNrYUU1WDRjdFVxaUJ4Mm9SNDRm?=
 =?utf-8?B?empKYjhHY0l4a2hVK0ZEcGZQRXBrWFpnLzhLUlA5bGM1QWxnR1Q0d1RaWDJo?=
 =?utf-8?B?REFhNUFVWEt6aklYcXZlVkFhMHRDcnFXL3kvWUlZcW9DM0pRMFlMR2ZnaUFN?=
 =?utf-8?B?VHFvTE01R3dsWHdSLy93VWJjS2hRRS92bGMwMlNNdWNPMnBXZ1ZyVzIwcmdK?=
 =?utf-8?B?TVNySnIvNndDVngvV0JVUkIra2tDYmRadFk4UTM5cFFobVAwT2VuMk5VVXVM?=
 =?utf-8?B?NS93dStiNXI1dVo2a284L3BnbFUzM2ltYWZQajEwcngySStYS0kzNjh4TlJX?=
 =?utf-8?B?dHp5UjZLVHBaaFdBVm1qWVVBMm9iOUh0YThYazRCYnlyWWdVN2tBdkdHQURC?=
 =?utf-8?B?WEJKNm5MTTVzaXJJNG1BRzNqUTdoamw0LzZNUkVSc2VHWklaRWpNWVVyOGZD?=
 =?utf-8?Q?CDrG6kdd14XdpAQ41lHUctc=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 357098a7-3bbb-4688-7fdd-08dbdb93ea03
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 11:07:33.7003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlX5GzPQBZ2vmsTdRimX3NUz4bMB3Q7OeMN+AlRpem+k+LB6r8gkaNmNWH6s4YfujnTjaSTQYqGiNcI7ymbHajZ2a4m+WL5H5a48buWH6qijVvgYaHhfZCSk6X2dz4pO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7438
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 11:07:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4568

Hi Ross,

On 11/1/23 18:27, Ross Burton via lists.yoctoproject.org wrote:
> From: Ross Burton <ross.burton@arm.com>
> 

Missing SoB :)

Cheers,
Quentin

> ---
>   documentation/migration-guides/release-notes-4.3.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
> index 7cea241ec..757592751 100644
> --- a/documentation/migration-guides/release-notes-4.3.rst
> +++ b/documentation/migration-guides/release-notes-4.3.rst
> @@ -158,9 +158,16 @@ New Features / Enhancements in 4.3
>   
>   -  BitBake improvements:
>   
> +   -  A fetcher for the Google Cloud Platform (``gs://``) was added.
> +
>      -  The BitBake Cooker log now contains notes when the caches are
>         invalidated which is useful for memory resident bitbake debugging.
>   
> +   -  BitBake no longer watches files with inotify for changes, as under load
> +      this can lead to races causing build instability.
> +
> +   -  Toaster's dependencies were upgraded to current releases, specifically to Django 4.2.
> +
>   -  Packaging changes:
>   
>   -  Security improvements:
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4558): https://lists.yoctoproject.org/g/docs/message/4558
> Mute This Topic: https://lists.yoctoproject.org/mt/102324713/6293953
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

