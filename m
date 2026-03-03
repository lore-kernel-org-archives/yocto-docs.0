Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3957FEC145F
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 14:50:19 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20183.1772549411372503860
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 06:50:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Cfo4lZak;
 spf=pass (domain: cherry.de, ip: 40.107.130.44, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jb4lSgd7XDOzW7fbwrDRB/GO2BaW89kcXz/AzX9+2MwC6KtNaVJcHdnOVIOv0Gb5x3npZLx+ZKjg++xPJsQ6M0TVYfC4GPoQCS3XLk/nehTw6ni80j6fjwvHsIw/VSdeOeqvXH7ExufBMADxW7pB7b4gYdTWDHoUKm1ZF3R6bIA5SmQROdxJKIzn5WsBG/X/EDp4Q127CAJ/6mEHheai8n2QJc+1/A52brUAFNMU1c4PPWSONlZKmhhTMRUe3e1WI4TOv/D3obDPi2gwmQB0Ig2eri9AEbs9KHov7PsFc/eUuA/92GrQQJlLd88aNGXsPZrSQESgLXrHNN+vRykDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYRjxA1bYZRIc8iR5MxJMtbNd8tYHnedZ+7hIW+JwSY=;
 b=AMOupEYRvubs6Te2HO9OmtBCcgAV+UfzGCBru4ccl+O5OaZFj+VzrsYwrj1OBykFTQWJ2wC7Et9K2HwxNDi0BVMlwYt2g6KdnnVG5vRhu76vxjoVKwbjW1lvB6QO6tSwHEXYzwHRwwkxCtp35iJBYusGzoVmPgKzKicj1oVufXnQrJ2dHAU9sK1Htlgr18IVrJCrhjvpWL+/BFmANvNnuV5ClulMMQ+G9qHO6ANTI+5bg1snJwqiMJquf0Mr61xNkBAZpcLtVrpjjqTFyhexnFTTgu/hXZjZKSWwmfE9AaEuGOtAfu/++FhYAIQNafMXktp/DAfL8i319OBjxRMKaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYRjxA1bYZRIc8iR5MxJMtbNd8tYHnedZ+7hIW+JwSY=;
 b=Cfo4lZakWAYBvyzW9PXIhIxfvLiX1mo5yylT8CcFlmxPBo2RgDU25IJgio+DVblh4hQ2oCm8NzdKp/WzM2QikyBp0dUnaKcVmaVehm9kxS35mG5/XL4st5J6lJaIJeekOZ8WTPGdi3Gd2WuTyIZt8IP9Gh9fiAsHhsK6Eh6vtPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB10577.eurprd04.prod.outlook.com (2603:10a6:102:493::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:50:06 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 14:50:06 +0000
Message-ID: <531ad3a1-0eb4-414a-a389-e8b7da698ba5@cherry.de>
Date: Tue, 3 Mar 2026 15:48:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/3] tools/fetch-releases-json: add to fetch and
 format releases.json
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260226-releases-json-v2-0-6ba4a3b37b24@bootlin.com>
 <20260226-releases-json-v2-1-6ba4a3b37b24@bootlin.com>
 <38678bef-ba8f-4181-85f4-c367c3f6dc29@cherry.de>
 <DGT6A4L263BU.ODVFK33QLCYV@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DGT6A4L263BU.ODVFK33QLCYV@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BE1P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB10577:EE_
X-MS-Office365-Filtering-Correlation-Id: 621773d1-64ff-4083-3470-08de793428fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	O4DUGrUbQjOifDTbGjCN2nw+hLAwKYdvEPStV4IXMXj3DEy2pv5H4LI1TYhkhl+kRmNohiPzBe1nHlKTmvZcF5N86kuRs7yYBvFGzr3MfR+phM3SDz//3ekyuOiJtB0WPwTA4DFcQ0OkJFL1RFo2vuISCOPmXWtvFns/J3Q7VGhvq3t2Tl6AxHsTfxqbkwfBj27Vhk4IwqAGmiJtTE6pYj7p5y4yHAEQcLf8+yUgf+5WJeYhSCe3494naAkP4zfo88PwqJwbD1y7APK0rLmQJK+YYfztn2hT4cbjTS3R/N4recjruBW36Xb6TOJy2kZuWxSm4dAsRLYGPp0H2jBXhnrgwEwzZXNQ3FytCLzU8+tHaMBb+JXs22zn53RTlrsbjvxTUOo3t89J+4yiyWkd0WBpJyslEc6kFCwPLa7joH08WORnz0FEo4NCVs6rqar9rFn5Iwm5gAhHKZR6g7jcdRQaKt9WkCCfS7SDTLnS4q1DaFwko/6hc0bbRpieIlQHGnhYXVkPyuvvCITXLqtyGBkLleoYuzcGKmqCh5G6sfm2+PeAQOHBpF7ew4qOhGNG5d+W89btGlZtt/+jP6bkKdHTTvfqTc4nfaUX+ompPVnVY+shf5RJK3HBrnOzc/eTvaOHqGXyFH9/iIT7wEfNkmJFaTNuMhnglS3I5BN8ji3M+0fPBE9gzYAv9IYcN4tc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VjlIdGVreUc3OHovZHBqSWhBbnMzN1ROL2RZZGJwMEVlQ3k0dHM5eCthVm5N?=
 =?utf-8?B?ek8vNWxDcHdBcnBzaG5OZUI3Y3pvaGlCcUl5bG9STjUwUUtnTUpweWdRZ3pZ?=
 =?utf-8?B?QXdnTCtucUx5LzZ3SnMvRjRLeDkxNEFUZFFaZVJ0WGpqU1hWZnZYNDB3b3ha?=
 =?utf-8?B?RU5kMTNOZXRZRjBxMytnbCtyRTdoOXVjUHlJOHVuMGpLUDIyOWVDaldMb01E?=
 =?utf-8?B?Ukxodjh4Z3Rndndxakw3ZVBmSzZGUENBNkF2QW5xOVJzNTBJTzhoOU5vRTNP?=
 =?utf-8?B?ZU9CUTQ2d3RXVGM0bVc1WE9kUjU2SUhORHpTQW5ENUUxeGRKSFJVb3dUL0Ry?=
 =?utf-8?B?VTFCUDh5Ky9acnVhaEJrQjZuSC9FQVdWV3BNWjhUTllGL1FIVnRsRktiTHhM?=
 =?utf-8?B?NENPb0QzTGhWbmQwUUE1U2wrZlNJQU93R0tmeVpGUE9BdE80cFFSYTByU0RV?=
 =?utf-8?B?OEpPY04ydyt5ZVNjZ1hCZ00vTmtqemg2MVlkVlNwZjVmRHZhMCs2b0xQK2RY?=
 =?utf-8?B?L3RVaVM3Syt2U093MUlpOUVmb01xbFQvTnVZQWRjMGl0T3VkUGtPbEFkMGlC?=
 =?utf-8?B?Y0xSRmxESFNmY2Z0K0JtcnVQbURmTm9ZYzYwNjFwaXhseDJyUjZUaVo1VnhI?=
 =?utf-8?B?Vlk3QzdSdmJCT2xoV0dobERVZy9uSitHZHhybG1qUE5tQ1hFNGQ1bXIrSlpC?=
 =?utf-8?B?UW5qSVUxQWU2UzZrano5aEk3aHM0VjFSd0ZpcDlFaXR6a1NHSndMOFNIL2pD?=
 =?utf-8?B?eFRFKzZEUU5ZZnd1WXdyNDJQVWp4RFhrcFVucitLQi9UZkY2dG9xckRqY09o?=
 =?utf-8?B?VXVMcTJ5VHNqOGw3ZmdwMDhCOFkrRHJZd1lrcUQzMmJ5WE42MUF0WUJMU21H?=
 =?utf-8?B?VnYrQk5VRUl3SzRCazBmUU5zSCt3N2QvZ3dLMGZLME5PdUVGTjgwNTA2Mmg1?=
 =?utf-8?B?QjBPL3BhZ3hVS3VsNXN0VmNGeFgrcndVVW9GS1l5WWN3RVByT0NOTzI5Ynk1?=
 =?utf-8?B?b0RKVVdrVXhLeEJaNHlnTzdYenNsZ3A5SzVLbmNBMzAwb1hreS9ENzN3MU15?=
 =?utf-8?B?WWRqUzA4TDJMcDJ0b1VwZVl6ZGpIcDBwMVY0bE90bHUwVm8wbUxSbndEaUVD?=
 =?utf-8?B?aWFkRXhEWVpvZTZPdDE1ZVFJbFNsK2dIUDd1ZXdaL1ZlTDl3MVg2R21Cc2Nq?=
 =?utf-8?B?WkVwUTBGT0x2VFlaTFp6QTNETHkzS2VyZFN6bGlDd0ZjbGprdnF3RlNjTnRY?=
 =?utf-8?B?RzZTVzg4WWRROVdJWTdFcTNLNitxb1NkQmFyY0xCOWxvT0tDTnU1cS93S0k0?=
 =?utf-8?B?NklZY3JJdEllZWgrV25YOENRZ3Q0TTVKcVpmVHY3ZWNDdzlVNnhqTHNDTXpt?=
 =?utf-8?B?MlFKZUtnVGdmQ1B2cTQram9ITStaQ2JvNW1LYXg0Nk1sTnVzY0N4ZnUxanE3?=
 =?utf-8?B?aGlSZWpuNWllMmxaNEZzSWY0elFrNCttckZ0YlM1VkpzR3JMVERsODJuNk43?=
 =?utf-8?B?TUt0N0hiMGo1Z1FTWGE0MVdWVEgvY1IrSGRyTGFVeVVKTkJUYlBOVzlTeW8y?=
 =?utf-8?B?NUVOdEtIMnNzVk5wckcvSlR0QlY3bFNCNkdvWDhpUFRGWWs3Y3MrUjVDOXFZ?=
 =?utf-8?B?MGVBa0Q1Zm9MelF4V3lyRU9uZG8rZFZ4Z3lkb0lwV2xsMFRCOEwvSXUxWFlK?=
 =?utf-8?B?TU1LTXNkN3NYNHhiN3dIUXV5Y082UDVVVWlXUlZDMEozWmxvVG90dEZYQ0pD?=
 =?utf-8?B?REVYU0lUT0ZNditmQVJlL3NrU2M2QmRmb3k3ZS9WY1ZoUVphbEpBcFczSnRJ?=
 =?utf-8?B?aENqUytwc0JKRUp5dklMZjQ2bE5QcTVDWDhRUjZRSkprUktFcHFuUFl3a1dY?=
 =?utf-8?B?enBYZHFKSGlIQ1pXNTg4UFRzZ1JHYWdVUnNkNnVDaGx0ZlFLbjZaV2plRXJ5?=
 =?utf-8?B?TTNORXBXcHU2dnh6TzlwQlBZaUdzOUJTTXZMc29sSFdrd0ZpQXBBVVhuMWZJ?=
 =?utf-8?B?QnNhUWc0NWFQVi9PWVFHQ3ZTSEZRMUxJaHFnaVI2cE1IZUgrYlNSNjFkTFRN?=
 =?utf-8?B?N0orekQ3dWZyL1BNNk0vZ2YzKzdRRzREMnFFVHljdSthQWI2YzIwdUZqWUhN?=
 =?utf-8?B?Z05KK3ZFWXFGTCtiUlozSXM1WU05VFNqVmMvbXIzVDdYYlA3KzRHaERMUXEz?=
 =?utf-8?B?bnNvaVFjYWRwSW9LOCtKeFE1Y29nWTEvN0VRWGc4dEt2UTY5bVNJbmdiaTZw?=
 =?utf-8?B?S05seEZTK2Z4cENURmZtMk5pS2tDZEZjMzlNcmpJWlQyUitoVVVFYUt3alFn?=
 =?utf-8?B?citDSURibE1PeFA5ZWJaVEQvSzZ6SGsvOWloM21VN3pPTjJXekQ5UT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 621773d1-64ff-4083-3470-08de793428fd
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:50:06.7521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIH2OyadHGEwN8QSqeYhRXRXTP3C5B3V8Hh9vXD1spmqAPZam5c2u/BYhvbQHvC+6but8PkuOri3/Xld/cIDpwhRx2zI5ZsP1HmAcxpG67I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10577
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Mar 2026 14:50:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9052

Hi Antonin,

On 3/3/26 2:14 PM, Antonin Godard wrote:
> Hi,
> 
> On Fri Feb 27, 2026 at 11:26 AM CET, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
>> On 2/26/26 3:00 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>> Add a simple script that can be used to fetch and format the
>>> releases.json file from https://dashboard.yoctoproject.org/releases.json.
>>>
>>
>> OK but why do we want this in the tree? It'll still be regularly outdated.
>>
>> I understand not wanting to rely on a network connection, but we already
>> need that for the bitbake's object.inv we download... so this ain't that
>> much different.
> 
> You're right, I forgot about that inventory file :( made this change with an
> offline build in mind.
> 
> Fetching the file when building seems like a proper solution, although:
> 
> - IMO, we need to fallback on fixed values, even if they're outdated, to not
>    block a documentation build if we can't fetch the releases.json file
> 

Makes sense. I actually thought about this a few days ago and I was 
wondering if we shouldn't simply have a single version as fallback... 
The current one. There's no reason to show multiple versions in the 
switcher (and elsewhere?) when there's only one built locally?

So maybe still generate the file from git and not even attempt to 
download releases.json?

> - on the Autobuilder, we need to do the opposite: block a build if we can't
>    fetch the releases.json file
> 
> - avoid fetching the file again if we already did (especially important on the
>    Autobuilder as we don't want the file to be fetched for every tag + we don't
>    want it to change during a build)
> 

Wondering if we can't simply handle releases.json downloading 
externally. I think we should still have whatever handles releases.json 
in the git repo(s) (but maybe not?) but we can simply put releases.json 
somewhere the script in the repo expects one to be present.

Essentially... if there's a releases.json available at location X, you 
use it, if not, then you use the fallback of the current version. The 
git repo wouldn't have a releases.json, only the autobuilder downloads 
it once before building all docs.

I guess the main issue is that we wouldn't know whether the current 
version is EoL if you don't download releases.json? Is it important? 
(thinking about people building the docs locally such that their 
colleagues only look at the documentation for the version they actually 
use).

What do you think?

Cheers,
Quentin

