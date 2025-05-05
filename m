Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB25C3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 09:15:56 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.79])
 by mx.groups.io with SMTP id smtpd.web10.46036.1746436547369309070
 for <docs@lists.yoctoproject.org>;
 Mon, 05 May 2025 02:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KpOtNCzv;
 spf=pass (domain: cherry.de, ip: 40.107.104.79, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEHuH4nC7SWl1rhuxnkFGBzP6mi9ZbC/FpLU1cGDBF+je5yswokQsZNJ0CZNLNqe2FzC3HZ7BZiw1SG4ABF52sfsSHkxVg40QzRVLBWkNR/hNNf8780ZXE3GS0cqM1ZWQ8CWBj8xhj2c7buwr9gcaUCu11BvldwsYvNSOa6vs4cv7VmIC8zKD3i07PyxeZ27rwBIKH1aqMiIZFYzaVLfE39UUXbQPIBCIkTYd/+HNBw0qGq67UTachLngpSRzqmC9LF1bNGax+uxLD/Bo5crF/LvKKicqGyaNyot/qH96y5rl/3hdbARwXQP5/hb9OtAmAGgxV4v085z0S/wToo7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSnMnn8+t0BQiy9rE3g55MllF/AwpYspNNXqIdrwxI0=;
 b=VdIRUsbrmhmUPxfmYr7j3ra+EpX5wJqVCmH0jEur9xX4qiGx2U9lAzr9icyrrrZCRs3LONXmqLynfxzJBhcsR2iXsCobS4MnHZ+sU4aguZf1ucoSvCXfmOWRalE57rCJnMz32BlYFTeVcr3jvcLDLtecC6NQHnYgBclbC+0htBleueObhvDsOx4NY4dQzBXB8NXBUbZ5L1p92d+lkOalhLX1ET7zZKG+SZo5Wn4jovVCw05sYCR1vWcfb9yYG/6cvOsO0WAAl/rOSyEfEMxNvc+UooFPimYAyUtHpui2oyzcEMAadG++25IYZTPi80Cwud+TSAZ5akwgTluOytH4AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSnMnn8+t0BQiy9rE3g55MllF/AwpYspNNXqIdrwxI0=;
 b=KpOtNCzviGj42W07BPhTkb61CJvxNniTboHIL0ByHS94HltZ9QZvLLFXh0AzCTwGYe/bPB2Aq92TJhuVy27LQTfSy8EdSrTmFHyzCDUnUE7e8S8KKEk1+zJwMDg55SbTKHXgYVZNSXFvWD44c7cj0P5lWtvB03lAjxw/bc7P4uE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBAPR04MB7366.eurprd04.prod.outlook.com (2603:10a6:10:1a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 09:15:43 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 09:15:43 +0000
Message-ID: <64ca45a4-b09c-4e48-a61d-824ce577d3c3@cherry.de>
Date: Mon, 5 May 2025 11:15:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] contributor-guide/submit-changes: encourage
 patch version changelogs
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20250502172143.31713-1-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250502172143.31713-1-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBAPR04MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 146e7efd-fd0f-4611-58ce-08dd8bb569ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Yk82NC91SWR3YlRXY21wTURXY2wvUnV4SUZ6bTR0ZC90c0o0dzAzSHBFZkJ1?=
 =?utf-8?B?bzZJMk9FRGJEVncvaVpLVDFpancrY0NKQTFxYklPK0dJVFE2YVlZVk1DMGd4?=
 =?utf-8?B?TGl3NmxuWDVZVnlCMDdiRXhZMm9pS1BxT29yeDVodFUxalVNekNJdGJDdEUx?=
 =?utf-8?B?Z3RvZGppdExuWGpRbUFLR1FuSitvSkl1OFhrbU5JUjR1NjllWTMyTENaK21B?=
 =?utf-8?B?elN5QVVxelBWbmVXaVlGYldCclZTaEhIUW5UOWQ4bkZDVUphamtPalhIS0RU?=
 =?utf-8?B?endNRityUUFQWFR3WnRHWk5DdnFPS3cwc0xmTFN5Wlh3dGZkc2NqUFNzWDVi?=
 =?utf-8?B?R0hkNVo5eFhxMVRacXZMU0FrSW9seFRJYXRjWUhNdWNpa1JXNkY2M2xxdHpN?=
 =?utf-8?B?aC84WGhremYraWt6UjBXN2FXWWVoZzVqT3lqdGZyVjJMRzRtZHp2NW16UmRo?=
 =?utf-8?B?cnlGVHJLQUVCOUhNME9ScThaVjVLM0w5cXhQdkFRZzFiKzhJYmF3elBPVzIz?=
 =?utf-8?B?cklrZUhLMjZoSzEwUm5VMnVUMlVzLzNkR3pvQXhsdWVuTnNjTHgrNEEyMWQ2?=
 =?utf-8?B?TXNjRm1tcXRqb0JJaUVaeHRTV0FIWkZQcm9IYnJLZVkvZU9NWWwvbG5GcEYr?=
 =?utf-8?B?OExFU2EvT1U5QWh1UTlodExvQXJKdGFIVWNQMVo3VUFDa1YvUm1MMmtqdzVu?=
 =?utf-8?B?aSt0QWNiZkNUOWtCMDlsSDZPaWJ2cVA4QTgvald6N3FGZ3RjQUxxZDdJVE5x?=
 =?utf-8?B?cWdZeWNCcm56enJwY2RYcndISitMd1ZDanRVZlZKMm4rZUo2Ny83ZHlLMTht?=
 =?utf-8?B?QW5lZ2g5eGplMUdZblBFSXN5dVFWQ3BtbVI4ckVtSjlkTkVHSElYaW54OW4w?=
 =?utf-8?B?OGl2aTBJN2N6ZnRRMHRSc09mcTVTRkNEQXhEanZ2WU5EVm1PMUQzeHRVd2xU?=
 =?utf-8?B?SUFjdXcrMjVhTkZ0TDIrR1hENTY1WHpqMTBpaW9sLzFMd0sveGMrYTlVeWxn?=
 =?utf-8?B?TnJVVmtGRFc2bUs5VEQzRHRSMjZWTW0rUjZZalkrUUVZc1lPRFNBVEVBTFdC?=
 =?utf-8?B?bDFjcVc5WUZQellseFNZcTBzdlp5Zkh3NXBETkk1VTJKTXErZFVtM1oyNWdE?=
 =?utf-8?B?ZUJMbWNlUjhPeHJPNEY0cGdXeUQzRmJyWGJXWEdBUThyK2hnaC96UTZ6VkN5?=
 =?utf-8?B?NU9ZWGVIMHBYcnZBVWp1dFhtWGIxQ1U4UHdLdG83ZHRNTFVRNXBQL1liTmhl?=
 =?utf-8?B?MzUxRG9Fd0s0NnJCbU94TkMrbW1ZSk03ZUR1bTVwUVJXemJ3eTdUL2YydXpL?=
 =?utf-8?B?WnNOTlc2aU01WjBLK3lNN1NXZmhCWE9EYWdhdEU1Y2FneElJTkpHUFJjWmdC?=
 =?utf-8?B?MElqdm9pUng0dVBXUjFtUDV2WU5yZ1BNT1pta3hxUEZGeVRWMndyeVN4eTNh?=
 =?utf-8?B?d3pILzJubitXdzd2aGNRL0NpMUF3WkFaRmFXTlUycHU1TzQrRFF2S0hPZGxL?=
 =?utf-8?B?dmFjQ05GNXJZZHN6dnlaZ3hNMjRlZFhhaHhTZGdlQ2RIbTZzSVNJaFZ4L2Js?=
 =?utf-8?B?Z2lPSEZDZ0pIeDhISjRtTXI5alVjZC9xVHdkWWZybVkzdWJVaVVxM0NuU2ND?=
 =?utf-8?B?Kys2ejVkMURWbDhmR3hCSDJZcUlwSUZHQzFYLzlydEVldXo2REJmcXlmNFND?=
 =?utf-8?B?VnFQQS9vS0dCdG5xdnRMd1VGNDYxT2tqbWIwcGxOQ1FoRmpVZW53STJDa2xD?=
 =?utf-8?B?Y3RZaTVoVHUrVWR4dzVLdEI0dHhLYStpeTNOQ1gwWDduYnV0Uk9BQkxQQkFv?=
 =?utf-8?B?YTFQRGF4b01RWWgwYk9nT29rTVJoTlc2VlBQeE9qcFB2NVp1NldQbnIwOC82?=
 =?utf-8?B?eFhpbnkxcS9XNm0ySHhrNytPeXgvc2RsNG54bTVXTWFlSkxyZ2dtQW9OcG1T?=
 =?utf-8?Q?4wHPq+XW3t0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MWpMVnMzcGpDbDdITXBnSy92SFBoOTlRWjBYd2FqNHFtd2hLcEJNbVJvdGIy?=
 =?utf-8?B?UU5vNGdhRHVSOXZBS09RbGZNWVBwQWNUa2VkdkdNV0JGZVRITllodFE0a2NX?=
 =?utf-8?B?RVhneFBoUEJRVWEvRnVtbE9BcCtKcVppTy8zUHNSOFBmemgxR2FqSjhQKzdB?=
 =?utf-8?B?eTB0VnN4Q3NqcE5COEtGckMxTkcwZERTbHBGb2lQYUZ2RlRJdWpkM05XRWtu?=
 =?utf-8?B?VXZIN1gyZ1d3QlJOTTYraTdsVlFPRm5hRHlsZVJpcnE5YWRPY1ZKeVhoODJw?=
 =?utf-8?B?bG8yajlPTmRFLzVxTVkzbkJ5NlNDVGZMbUkxY1d2b0RtbStVRDhqVXVjcTBy?=
 =?utf-8?B?b0ZSMmNtSEhmNHBHdlg4UENYRnlFaUFBeWdHYXFuZVV0dFh0Slg3bnZZRlZM?=
 =?utf-8?B?WjBIQTVNN3Y4Wm4xbFRkNVhXTWhidFo4UzA4ZWhHT2Yyd3NTTjEzMG10V3Uy?=
 =?utf-8?B?Z3hqelEvSFI2dEkwYVZvemtQMFcwQmpvS01TSmdoZXlTN1NiMmhJS2hYZ0hw?=
 =?utf-8?B?WlBDOHdaL0phS1RpL0NRR0NiMUs4cUE5N0h4STYrUTA1Y3Q4TVVoZ2VzYW4x?=
 =?utf-8?B?U25najdqdm1US2Y3ZlF0V2FQd3hvU3pKdmxhUktpTWM5N1dTR014V3NVTjE4?=
 =?utf-8?B?VmZFaWVGU3Y5M1VvcU5zT2h6SW5ITTA2Q21kUFYzYTB6c3pKK1lBRm9GUUQ2?=
 =?utf-8?B?Q3U0N2d4bitFNlFRUC9MaloycXBGbkZhd29kQXZWUG5CbzdIbnphZjJJdElD?=
 =?utf-8?B?c1Z0WmNyQ0RtZmVvRS8rYWpmMVp0eW1aMEVDdTZ5SWZkL0J0TkVsZTdkemdT?=
 =?utf-8?B?UWMvZGhXbXhVVitwOWYzT1dPcC9UUzVYeENqeGwzcDdUU1R4Sys2Sk1oaW1D?=
 =?utf-8?B?UmhFUmNGMS9xWnI1NFZuWE05ZEJ2VmZmWUlnQzVWRTg4eTI1SG9ZSDVBVi9S?=
 =?utf-8?B?dVBubVBsTkRvYU5TZitXWFpLWTd0TWVVS045d2RlNFlDM1Zkakp0bUJjbzNZ?=
 =?utf-8?B?NHF1anRnUVcxWTBCaXRyMm9hUmxOSDJmcTBZanZ2ZXVOWm1NZks2Qks1bWlQ?=
 =?utf-8?B?RmdaVW80Z1VxZS9QZ0V3VGpiUEgrdFh0LzB1c29XWFg4VzlRYk5jQlJ1aFFj?=
 =?utf-8?B?YlRhd2JqTHdlMWFqb0ljaXIyN1V1RVVxeUxpTmpWeTdwOWlnWTJ2RVFHSUpH?=
 =?utf-8?B?aHJHWTVrOXJyaVhiL0N4ZXVIU29JbGRCUjBQcktFSm1PYk9SQ1A1OEYzUmsv?=
 =?utf-8?B?ZmdNVm5GZVJ6N0FPYzhXd01pNE1wUEFTT0R1NGh3MlFjS0hFMkNSMnVLency?=
 =?utf-8?B?dTRPcU1icytacnlya0xTZXEyS1JlQlpLQm9HanpBZEVNMEVJck5YYW5RWFdK?=
 =?utf-8?B?NlJRSlIvRlh5aFluM1d2bDUzM3BVVUQ5ekNUdjl3MEhLa2tqT09JbXlicmlv?=
 =?utf-8?B?Qkp1QndTZUVxVjdOMWxXdEFqR0VOUk1iOG41YjNCTWNPWjdZa1AvUzVjSmlC?=
 =?utf-8?B?eUpHeitxTHY4Vmhpd3h3SmdUVS9CUGNTRkV3MktmNVBSK2lmTGoxOVg0MU54?=
 =?utf-8?B?Nmd5TFhBcFpGbGI2WHZEMDZqSDdvc0tTVFZRa2NocG9LM1Vwb3k4NTVoZ0hB?=
 =?utf-8?B?NUNyOUZVczJPdDVySlp5VE92NnFJeFNHWHBpTXdzRlNCZTZGMFBveFZtR2x2?=
 =?utf-8?B?YzNsdDNJblp1Z0ZlTzlONnpjdzJiVU9iL3hOazlNMmpCcTQ4UmxDS3RhTEVJ?=
 =?utf-8?B?dDNWcmVCdWJKaVM1a3Nrd0hnOE00bWpaclZxZVZ0Ym9ZVzZCSUQwVkVFcFVM?=
 =?utf-8?B?aFE4SjAxWjdMQkttdmh2V3J0dVFRbGlLdW5YcGEwNzdKeFVvUXNtWnJkZ2Fu?=
 =?utf-8?B?MmxaRjVvVVBRbHBkMnQwMGMvMkFuZys4TXUrMUZFbGNNU3g2Skkxb3pUOVA2?=
 =?utf-8?B?c3lYQTEvNGx1bWEyVFJtNHpuN1NzeDJZK3Q3SmwwVUdKbitJQ1N0SEY3Z3E5?=
 =?utf-8?B?RTNoNUhqb3NmOU5TRExnSUZlbklNUHBFMTIxTjJCRWZ0QVpQVEYwRXl6YnBh?=
 =?utf-8?B?STF6S29IUS8xZGdEVHpwd0I5QklCY0N0WDJRL2VRY3BHMlJhMnE0dGk5NGJv?=
 =?utf-8?B?bmN4UXVIQjlCeTN3RE9MNUF6Yy9iRHdHQkRIVEFmZVowWlBxYU9aN1lCZTcx?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 146e7efd-fd0f-4611-58ce-08dd8bb569ae
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 09:15:43.6112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Usli6ligkfQF1lNrIP8c7nSDpGlMoyyh/OdmNQYJ5kggnS8fzh4r9X4NCe2j0PmaSgfLNYPzTLE+uzNhVH60HbONyH1WVpOhLnwrYOYytew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7366
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 May 2025 09:15:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6797

Hi Trevor,

On 5/2/25 7:21 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> Add a section after the 'git format-patch' information encouraging developers
> to add patch version changelogs to their patch updates.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v2:
> - clarify SoB line
> - clarify "this patch was added in v2" line
> ---
>   .../contributor-guide/submit-changes.rst      | 32 +++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index 0675aac984cf..6d5d69d7cfb4 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -776,6 +776,38 @@ argument to ``git format-patch`` with a version number::
>   
>      git format-patch -v2 <ref-branch>
>   
> +
> +After generating updated patches (v2, v3, and so on) via ``git
> +format-patch``, ideally developers will add a patch version changelog
> +to each patch that describes what has changed between each revision of

This is a bit different from what `b4` tool does by default, which is 
that it stores the changelog of the whole series in the cover letter 
instead of per-patch. They aren't incompatible per-se as you can add the 
per-patch changelog and b4 will happily take it, but it's a bit of a 
different workflow :)

Anyway, nothing specific to b4 in the docs right now, so a "problem" for 
later :)

> +the patch. Add patch version changelogs after the ``---`` marker in the
> +patch, indicating that this information is part of this patch, but is not
> +suitable for inclusion in the commit message (i.e. the git history) itself.
> +Providing a patch version changelog makes it easier for maintainers and
> +reviewers to succinctly understand what changed in all versions of the
> +patch, without having to consult alternate sources of information, such as
> +searching through messages on a mailing list. For example::
> +
> +   <patch title>
> +
> +   <commit message>
> +
> +   <Signed-off-by/other trailers>
> +   ---
> +   changes in v4:
> +   - provide a clearer commit message
> +   - fix spelling mistakes
> +
> +   changes in v3:
> +   - replace func() to use other_func() instead
> +
> +   changes in v2:
> +   - this patch was added in v2
> +   ---
> +   <diffstat output>
> +
> +   <unified diff>
> +

Looks good to me,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

