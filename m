Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64830C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 08:38:01 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.136])
 by mx.groups.io with SMTP id smtpd.web11.3507.1718267874793197705
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Jun 2024 01:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FegODxq1;
 spf=pass (domain: cherry.de, ip: 40.107.249.136, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUdbPo4OhH180s+gvHJro90InAoo8isNndQAiXNkoTqLnu6i7IyQnHIMqyvUU+A+tjM+v/PBQf9Boi8yrHuOsytri4Mws04lcXMBIbu3kFk8cptRu75ewC+yaL+sxV/EKQJFAhyA7Uso55AOkyuA6citwYWQspN0z2tgbD13M5fRCHruRsnm07damr+aP57SN29EM/JLChelo9+gMfLQ49OhOakvz3DQ+tjlsjQVso+YX5sQMIw4U0LQRAJ1BpBRpBriQ5WvqWVfJNga1kPwXGSbN20KdZyc/CnZouTlwphemfwssPsrosqJd32DtDk+1BgkkoKH25ZEkWUj8uK7ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOiywOUoadiyQ5sJisjZabg/lPOtvkRq6FBLHs5/fo0=;
 b=XH4rwIKELLOOXcFbXnEesjenDtmC0KvfhmC2pbN4nZCIjVZIKT9SX51Nbx6vEry4seh8ftbyJr72aIwaFXTT+recGU/8GkXCczcaJrn78cPqpIMyVcmcKG6Y/HCBwpH5aFwpP0lUq5eSxcRBsNRIpZzkkKiE5vYg1sspt4PlGdvT/KOVtYGWr5M5gY5adQ2daJSm+WSvLNlQotyMk7nmT3irLk3SHD5cN31R7P7g1t5Omvq5w8dI0qGDA4sukPWiIXz9h4Q0P/My5sk89exjGH6CeLXAwlYHPsxmCwrLwAQCKg7Lv5jkIYnby6048JJKpyKKgPAChq0Qy7ILwtov/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOiywOUoadiyQ5sJisjZabg/lPOtvkRq6FBLHs5/fo0=;
 b=FegODxq1EGqtw8jjkXTF6cb5H16U5TtpzcUJsjfu7dVF/Uz0YGTihQMqwX7pWEuy+7spIwJ4QYmAxUxns03CbGk/s4Wwec5L8GeHTS9EuPCKZEs7unG/DySl7VXsJhORlzmsBUnN7eFiIvn4wIAlOnrO1IutxQbj3Em8V3ZyEDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by AM0PR04MB7026.eurprd04.prod.outlook.com (2603:10a6:208:192::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Thu, 13 Jun
 2024 08:37:51 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7677.019; Thu, 13 Jun 2024
 08:37:51 +0000
Message-ID: <6495eea0-e391-43a9-a55f-22cf78fc96a8@cherry.de>
Date: Thu, 13 Jun 2024 10:37:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] documentation/README: refer to doc package
 requirements
To: michael@opdenacker.org, docs@lists.yoctoproject.org
References: <20240611125026.22702-1-michael@opdenacker.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240611125026.22702-1-michael@opdenacker.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|AM0PR04MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bcab9b8-4f50-405b-e9c0-08dc8b841ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|1800799018|366010|376008;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MndubFo0TCtlL2c1QUxzQ2dab1FtbmhuSjVIckIzTFpEdU43L08xcERmZmVv?=
 =?utf-8?B?WFV3bHhjN1dIQytLeTBXQ1AyK29lNklNUVJFKzJKbldBbmRJTWk1dGg1dVBr?=
 =?utf-8?B?MlRLWHhlTDNEUjRxcE5YeU1zVzJ6VXhrSHJtbjFMTURNTXN0eGZibWxLYnA1?=
 =?utf-8?B?VXpEc3VPcnhEVWdHTXdIRUdORGVQdWFFK1U2YUVEQ09XVGpseUEyUUl0U1hY?=
 =?utf-8?B?NXZnOXZMN1daVjFwZnplYXdyeDlwVjVxY0lOYmdqVkhKdXhEaFBMeGtlQWRv?=
 =?utf-8?B?NlM5RDNsSEJOUmdPRFQ5U3pEelNSaHNxWGxQa2JnZGwvS0hKRnpsOFIrVEJY?=
 =?utf-8?B?R1dWQTB3M0h3cU5DQkZhUHFqWVY1VnY1Q2p3MmU4RE1jMWh5Lzd2Y0M1Yklq?=
 =?utf-8?B?VmNzVlE0MlVKd3MvZ25ISWszc0gwdnd6WXg4ZzZEMGVWbU0rYnU1T3I1YjBO?=
 =?utf-8?B?NTJ4eFNaV25sb3BBaUVzUlBZcitYY3BMSTNLYzhYR3RCZEIwbHhqeGhZZXFh?=
 =?utf-8?B?NDJJY0NFRTlvOWNYVUtmM1BXMFJ1L3Y1eWM1aEdVTk96b3BQRGt5cmQvMHR0?=
 =?utf-8?B?aUU2bmVxWUhkaEZCZ25uVG9RQ2wrZ0VLUlZxQjZJSTBPb09OQlYrVnJtNzFz?=
 =?utf-8?B?cjN5RGFhczYyRGE4SkcwemFzdTBVcmhkZWNrd0VhSDJzZWUzUEZhUGVDQjJR?=
 =?utf-8?B?SzIrUmowc3k5dlA5NVVTRnBoS3gweVZTLytoeVVSZExvNTkvcDFvVlBZdGlH?=
 =?utf-8?B?MlBoSjcySjVjY3VhVEVDL1lmR0RFTFU2RFRaOXB2Umc2SlNDSk51dDZpSXRw?=
 =?utf-8?B?aXlzSjc2QS9UQUtnbE5wNWZncUtlWmNaT1Ayc1FjVms1OXlqNzh0cStKRHhE?=
 =?utf-8?B?N2R1eU5ubEpDSEd2K2VGK1psbVFlL0lVSGdPMWhhK0pXU0ZZWXVLdW9QOHpI?=
 =?utf-8?B?dWhqVVd5azdPSVNjSW5xWDNKbHY4ejA5WUU4WXZnejNvVE9DZmw2TkFmYk5O?=
 =?utf-8?B?eU1reFE0cklKZEJDZllaYUU4ays1b2J5d2JIYUliNmJHL0tmcnJGS2ZpL2Nt?=
 =?utf-8?B?YmZ6c1ZvdDVpSWRMNXZDOEhLZlNnQm9YakViZ2xxR0QwKzZOQU9ldGh3Zkcx?=
 =?utf-8?B?eW1RYWVqQjVrc0R6cGlUdkFGRTFqRThEWEQ1YnZyRVVXSyt0ak1oK05uTzJE?=
 =?utf-8?B?Y3EwcXNsdjJsQXN1VXd1dVFjMytFMGdXZS8zdGNyQkhUc1MvU1NhNUJEOWM5?=
 =?utf-8?B?a25VWHE4eTcxT3BBQVF3eEIvS3NtSERjMGlQZE4vNml2dHVNczJRazlTWWhx?=
 =?utf-8?B?bEt6Nm5NZjFvaUZWZkNMS0V1WEdEaElHSGlTYVB1K29JRWVtQ1lqZTNQL0dU?=
 =?utf-8?B?ZzZaNTJKZmFPRjRNbnFqR1AzamRZSkFxQnBnblo5aDA2TUtVYXBwdG4rNTBL?=
 =?utf-8?B?VzN1eCs5WVN5M0JZWVFkS3Bibm5zbVF6cWpwTkxNNFF2VjVoS2srMXBKMkZB?=
 =?utf-8?B?MVVOb1VaYTd5ekh0czJFdzVuV0lxdDVCVW41bk5wTzNiRkt1aitvWVVuVDdB?=
 =?utf-8?B?N2VSZnY3MXRzOGFsUWl0aGlrblg1OVM3VUNJN2ZsWU5VZkVjL1JjRmZaUmJz?=
 =?utf-8?B?UCtHRi9lODlyTlR6cnBkeXdOMmNCN2MvS1lQbXZpbXZydFNqL0NRNlhFVUt6?=
 =?utf-8?Q?b/yPx/EuKlbKdQjSzhLV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230034)(1800799018)(366010)(376008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a0MvUmsxYmQ0dDdheXB6VXQ3b3RUV21YdnlDSWVPUHdON0wwQVlTNVpzaDF1?=
 =?utf-8?B?aFBLMFlYNnczU0dUNzhtMGlKOWRTR0t5NTZWeWhHSVBJdEJVYkJoNWpaaFp1?=
 =?utf-8?B?QVhOVk9wWE5FOEJmdnQ3cElHdzh6R2h4VEZlMzd1Q1RBNFJHS1FJT2JJY2dp?=
 =?utf-8?B?VHFBb0NjNUNpb2hpSnpuUUxDYjJwVUR0TXdUWldvTHhsSFdpQUZGZ1l6WHFl?=
 =?utf-8?B?RkVhV09NcjFMZFFCVk5wQVhEMWxjeXhidG9MN1JIS3BOTUl2bXNRclRZU2ZF?=
 =?utf-8?B?NHJuLzRDNTEzZkE5REFFWDBGOXlJV0tYVTZLcWI0RkRyOUJOdW8wUzJFVWtW?=
 =?utf-8?B?ZXhQVHVpZjBLZk5hdUdBNXA2WmF5ZHhFQVdHaVdvNVZzUEhyRlJWb2RRWHk3?=
 =?utf-8?B?WXhHT01ZSFlRY3haTnFxY3FTay9KWkJrcHJLZzFwa0NjcStkUW54R2xPU083?=
 =?utf-8?B?S1RhYmJpeWJSaVhHTUlYOVYvQzdXMnd3Q2VnRnpIMmxmRVExczZCdExUbGtq?=
 =?utf-8?B?d0lUM0RPVXQ5bS9aeGJqSy9ZWWxpYkZpSUpaVUhXM0RrVkpjZEMwemZ4a2pT?=
 =?utf-8?B?c0VNTWRQUEpmSUFtMHVJQ3l0bERsbnN0c3ZZZFAzODhXUllqZHFEc3VQdW9k?=
 =?utf-8?B?Q0laWkZQTytwclFscDRiY0V0MnNxOGVqaEpxR1JoY3IvT0xnMm1GOCt6RmFl?=
 =?utf-8?B?QlFXeGRDcDZSM3FkQURuV1NNdE0zdlhxdE1QNUtBalAwRmlyWEs2LzhHVy9p?=
 =?utf-8?B?QU5mTE1pb0tURTEzc3F6bVVNa2xuWk4vSzlJOGhhUkcxaEJLYXhXWW9DRndO?=
 =?utf-8?B?Umc0NlJZTm55MFNsalQxekk0RjlRM3o0czZ4TzdoYmhOb01pamc5bU9pUkdN?=
 =?utf-8?B?ZzMrYXljd0dGV3dGMWpRb2EvbXloQjk4V20zVzl6S1JEaEdnZ0JUamNoWHFT?=
 =?utf-8?B?NHFhSXp6R1lTVGFZMk43eVh3NWhxODhqU0lPWmxoMDBkSDZtMzZ5MkEveUFY?=
 =?utf-8?B?ZHM4TmtHL09mQ1dhTHA5T3VKSndna09xdzl3akdWN05CL2FHK1QvSjFuKzZE?=
 =?utf-8?B?Y000dU1YZk1Iam5JT0I1aWZqTFI3NlM0TE5ZZ2FvNUdGbjVta1VTSWFvOWhQ?=
 =?utf-8?B?Wkx6ZDhtUHBJT2NvWDRqZ0hlLzB3Si80bXpTUmVUQS9UZzNqTERjeTRnanJr?=
 =?utf-8?B?ei9RNTgwcHFadXovb2ZYTkhHbnh6WHVHQ1N5Sk5HR3JsL2N5VUIrdEFxZytu?=
 =?utf-8?B?b1ZNL0RaVkNtYjNoQWlxaFAveU1UVjBjdVBRT3oranloYmc5TXExazl3dzlD?=
 =?utf-8?B?b1NzN1ZiREpZYXdNRnA3YmJFcVpFSmt1N0gyT2xGR0hZbUY2a081SENUSlZE?=
 =?utf-8?B?cC9IL1FVRk8zRkh5T1Jhd1I3YTJrUTh6M0xQaW5obkFTVXZRaWErQ2lDOTRo?=
 =?utf-8?B?S3BURlQ4VUlDRTNRcjNwQVJFSzVpaDUvN25uWEhOVEJFckxXTDMvSVYvU0F0?=
 =?utf-8?B?ckhTQklhbzRKMWsyTHBxQU4yc0dxL3RkOENMcjYvQjA5NkJZbzNzY2hHVjY4?=
 =?utf-8?B?YlZmbnpsZ09KYkhKUHZvMVc0S1pUUkN5bW1EYWxVUXcwckwwM0tNajIyZmFC?=
 =?utf-8?B?b1FTVk1DOGxwZWtKMWhSUEhRSzRYOXFrYVlVMFI4cmc1UytHOU9VZERMNExM?=
 =?utf-8?B?TElGZTBlYjFHclkyKy9vRTZTNFp5YzdrVlVOeFFKUGsrU3FRUUxqSVpidVJ2?=
 =?utf-8?B?enp6WnhvSlRhM3laTzJQOTBrYXA0ZTNNSGo3TnlWMW9sczhseGlzemVLVnlT?=
 =?utf-8?B?TDFiNzA3VEJ0cjJEMFdweWVkYlh3NklGQThta0pmWjhUeUJEdndHRmdHRVhB?=
 =?utf-8?B?SmgxTkNEYXArSFJKUWIyUnhJbFl4RG1Edjk4Ui9Sc3hMeE96bE5JYW9vSExl?=
 =?utf-8?B?Z1lDemwvYzJKUzdtWm5pWk1XRVZxcXpYdWNrUzFtWWs0V3F5RFFLbytYWFVY?=
 =?utf-8?B?UVV2Wm8xSWptRmNPNFZtUGMvOFErekkvOE1yQ3FWYlRhOU4xM0Z1UnBlTmpQ?=
 =?utf-8?B?T2I0cXlXV2pJYU5ma2ROK0JneStIbHdJNTI3OGZPWkVISjF0dG13ZXhZeWFx?=
 =?utf-8?B?VGoyeUFpMGpwRHF3ZmNrSEJtWVIrd0hUNy9WQVBWMGdtMXhSeGNHY1ZxclFI?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcab9b8-4f50-405b-e9c0-08dc8b841ca5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 08:37:51.3704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhOg4ex2b05WeMTDFNOsAvMVJH5ieXQSRXZw5Q3hQN/VZD2UVh3pyAV60Np1X/u8EI8xGGn0HLteUWiWSJ8Ugj8YZ5qJ//kVJAzhoa39Jko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7026
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Jun 2024 08:38:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5296

Hi Michael,

On 6/11/24 2:50 PM, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael@opdenacker.org>
> 
> Refer to package requirements for building documentation
> from supported distributions. The simple instructions
> previously listed no longer work on Ubuntu 24.04, for example.
> 
> Signed-off-by: Michael Opdenacker <michael@opdenacker.org>
> ---
>   documentation/README | 29 +++--------------------------
>   1 file changed, 3 insertions(+), 26 deletions(-)
> 
> diff --git a/documentation/README b/documentation/README
> index b60472fcbf..c888b666a8 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -108,32 +108,9 @@ generated with DocBook.
>   How to build the Yocto Project documentation
>   ============================================
>   
> -Sphinx is written in Python. While it might work with Python2, for
> -obvious reasons, we will only support building the Yocto Project
> -documentation with Python3.
> -
> -Sphinx might be available in your Linux distro packages repositories,
> -however it is not recommended to use distro packages, as they might be
> -old versions, especially if you are using an LTS version of your
> -distro. The recommended method to install the latest versions of Sphinx
> -and of its required dependencies is to use the Python Package Index (pip).
> -
> -To install all required packages run:
> -
> - $ pip3 install sphinx sphinx_rtd_theme pyyaml
> -
> -To make sure you always have the latest versions of such packages, you
> -should regularly run the same command with an added "--upgrade" option:
> -
> - $ pip3 install --upgrade sphinx sphinx_rtd_theme pyyaml
> -
> -Also install the "inkscape" package from your distribution.
> -Inkscape is need to convert SVG graphics to PNG (for EPUB
> -export) and to PDF (for PDF export).
> -
> -Additionally install "fncychap.sty" TeX font if you want to build PDFs. Debian
> -and Ubuntu have it in "texlive-latex-extra" package while RedHat distributions
> -and OpenSUSE have it in "texlive-fncychap" package for example.
> +To build the documentation, you need Sphinx and a few other packages,
> +which depend on your host GNU/Linux distribution. Such packages are listed on
> +https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#required-packages-for-the-build-host
>   

This points to the latest commit in the master branch and not 
necessarily the one which contains the appropriate instructions for the 
version of the yocto-docs one currently has checked out. We could point 
at documentation/ref-manual/system-requirements.rst and 
PIP3_HOST_PACKAGES in documentation/poky.yaml.in though but not sure it 
makes it easier to know what to do. A bit of a chicken and the egg 
problem as to get a simple up-to-date instruction on how to build the 
docs, you need the docs built.

In any case, this needs fixing, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

