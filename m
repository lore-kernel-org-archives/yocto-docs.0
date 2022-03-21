Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2913C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 17:28:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.62])
 by mx.groups.io with SMTP id smtpd.web11.167.1647883730691423147
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 10:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=buWyqZuf;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.62,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5SGtds+cQqq/9taShOdi0DoLasRNZmSmYz/3JzNTTl4b4Ogl0vKMDHhveK/0teyel8qjPM0pHFJNLPhSbBbovPAHWctVPJZvjVhYWn/69oqzxnsfMjyR/XH0df/HvdFjqDtMofyWEo3t0ibCw2ZCw9cpVZJCR/IupT/ofSx29NX8w1WS1HjOtJ/CVtNmZYdfhROuZ+nF8/2hVGKdzsmUrB8p4+iSlDS+DoWOwl9sKuARXVP7Hk+UBNkq7ZmUMzQIW2ejl3qmmFRlRk90APELSpoKYW2v5gu14PohLTCI917q9vx01glIzvlYMrX67hZWdlojmKCO4KHa9HpWyNNcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRabqlLyKXSvzr6l39VXvZOMNdt8V062eCVfcP/0b0U=;
 b=PNZ46HDWOSuATGLQ29LIT58ZUP7cPUJ0/vOK9j/q2d0XnSx8iJi7H1L5dgahLbqnZxKBG3/adD/LpQg5n1qMzJwDq7eWKuqoyPB6UKIpWQ0U85gGcu4UlSnj0dMNPYzIt0ee9m2CoGCh/6sLrbE2K4H5tLiTa90M7LrYAkuXGHQpdeQv2kb+g3SZzA4qz3yVPUNC0eOmLhQj5BshvXlizNxDrGgA5HxDXAQylZxrJDODUlZHJIPGt/qU/IsgzzBMbvG0OxrbUtP7qzv9+6e6C+hiAbSY8ppvjwgVwFjQvAsy3V2JNU5zhSiK5/lYdJFtcvYnwk7IPa50ct1LABq2nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRabqlLyKXSvzr6l39VXvZOMNdt8V062eCVfcP/0b0U=;
 b=buWyqZufxHBc5Lc1/MGN6IShb7nW6SEKh+taymTBJtXhehWiyw6GA/+S3qywOB0lMmw8VAI0UZy/LdZhz/ruVUUrHFbQmJTsyiceA6LkFPiHKAGxBX6UEV07qMeeJG+r/E5obOH4VnanvqnUDrhxI+uAYFDKVvEijQCJFcDQTrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM8PR04MB7890.eurprd04.prod.outlook.com (2603:10a6:20b:24e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Mon, 21 Mar
 2022 17:28:47 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%7]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 17:28:47 +0000
Message-ID: <b23f24f6-29b9-320b-b949-48b7bbebd375@theobroma-systems.com>
Date: Mon, 21 Mar 2022 18:28:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH 1/1][transition] Makefile: Use switchers generated
 from master
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Michael Opdenacker <michael.opdenacker@bootlin.com>
References: <20220319152803.1110539-1-richard.purdie@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220319152803.1110539-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0022.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::32) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3b5a434-730d-4ae7-7ff2-08da0b604188
X-MS-TrafficTypeDiagnostic: AM8PR04MB7890:EE_
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB78908917EFF94B9D70DDD24EC2169@AM8PR04MB7890.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DpnRXF48P2UWVN23PTcsqhga/V34CZbc+4ROr+SH3zJOukVLDZ6vjVAY7xqTrewUE/aLlioww1MFniZmbm5aLDpvjlZ6MVXYKyxrqIoiyKCmGHIV8CL5Hyad5Qik07jK+gZBa/hQHoEB5zfnrBhQYg5lMWDtXs/6Q3c5NQtWu+tupBsxncikIyLF9sjX4+l/UaKT2CN4FwelRHjShEp3vjHndUDS5wlxv4ej+kiLFPpmU7NhRh1dPWrrxz1oriV1ljXqmAJWuN/58sxcLpFpImUyxrZ59zaAldjvMdrCTHXweTuZbRbCV/lElkO2UfhJdW9IYKxoNOrn2sjYAls3L7XQ3Z0iyCnQvhZaCg35gspO5aZyij2GqFgoJQ/iMNZY59bR5sxMKJ2RkxqtGJDDpKOVK2UvMyGpufXwqDVMAr71jHJz+GjXges3l+wsZGcTVyyzcUjv8GZ6vEFiT3u7bhkh/NoQa/dI7Un9rNLHxnY3SUgi02eyTgK4pCmU8L7wyAlKz/ZvV/qprdmQtTqJ87nm0nP2+0U7X/AgNoRWpynuP+7ItDSEtC1iGL2+yet+I7qfJM9iQX0pdxslR2P+p0F8w6XaluNZVg89JEdcHBxIdISYAYmbJwOL+gutuL7sNgk+oEGBVCZ2Ew59mnhdts6aJ63RB/HV9xMT5bM70EDjXSgoeDuzRlbfh6difpi1snZwIllui/GoC6IHIsH8a7JEiZgq08rgUrfTe5rR42QVlnOGZdyHfzZCJr+jkZRbAX2xm2ylJv8WECg321jQgrSFSZ3ycLRu9P8ae/iJDpaeUTysmxexWv1kECXH+CV+KwyRpFWZ+w1Eieo2AgkA16OhnBDVGGAxGYePdYtmzRql64tIoeW0NEQiavJ3RXXE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(44832011)(966005)(4326008)(508600001)(66556008)(31696002)(66946007)(54906003)(66476007)(6486002)(38100700002)(83380400001)(8676002)(30864003)(31686004)(5660300002)(2616005)(316002)(6512007)(186003)(2906002)(26005)(8936002)(36756003)(6506007)(53546011)(45980500001)(43740500002)(191535003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?djNsN0htVzAyU2NKWmhwNHpNbFdwajBTeVZaQUx6WGU2MlpFOGtJMnZwYlB5?=
 =?utf-8?B?QUpGcVJ0YTd2YjJwZ3J4RkdPN3dIcEFJZm5NOHdLVmdKcGkyRm5Eb1h0WTRB?=
 =?utf-8?B?K1lXT2RHWE82azFUTVhrRHZxUzlnN1R4M0dLVWZCRXBZZWF6Y1pSaExzQlNu?=
 =?utf-8?B?M0kvMlBtL3FjZ3p1emNVOFBFZnFVUWpTNmsrc09ESy9ISFNYSjJtaDdGc1Iw?=
 =?utf-8?B?cTlYTkVTVXhXd3BOa3ZSYkY5UmtqK2Z6aHhwZXlSUStwelFLdzJuNkxiYnU5?=
 =?utf-8?B?bFJYR1U3QlZVNlg2TVBQbnJWNVBwMlRQYzRxcmh4cDNxR1dGWVV2RDU4Szlj?=
 =?utf-8?B?SzlkTk9LY2J6ZUMyNldnV1RjZjZXa3hRVDJjbEVNdGY0Ym10RVZuT01mcDdL?=
 =?utf-8?B?NDVCWVZuM3VQeWhlejVFRGMrNThTM3FMS2VSRGlHK1JpbTM4M1Uzc01zNXhy?=
 =?utf-8?B?K1Y5dktVMWd3RjBvbzVmME1BZ0ErZjVKV3Zxa1E4ZnNTYmMxc0pGaGlNY3VX?=
 =?utf-8?B?MTRXNE8xM3M3MUwxMXVncjJKV2poU2VIaXZNZDhCRDRWT1V1bVhESTZ5S05z?=
 =?utf-8?B?bDhxbmVPZXBKVGhyVzdFNlFBaHNpZUlPUnIzd1orUVVoTkRpR1p6Tmw0NmFx?=
 =?utf-8?B?eHg3RU1qSW9qNWp5S1V6SndyR2NUZngzdGs1R3lYSHQ4bEthZUVSYUdCMUdG?=
 =?utf-8?B?MUdJdm01bUJ2VHUzMzJGb3d1cmFMbG85S3BNSkNjb3NQVk9VdzNFbjkwSldY?=
 =?utf-8?B?RWF4eUxyWjErYTR3NzVMVFd4SVRQYXd6UW53bXp0bmxObjZYMFZQKzl5TWpH?=
 =?utf-8?B?clpESFRUWUI4dXh5TGZsazhocDRXS1RMemlLMWd4dXR2R1h0NUxaZmtPVmVz?=
 =?utf-8?B?cmE0WmFoVEUyZm9oZTNFMnZFdUx1NkcrOW9mRExlNjNNbDVWUDRCaXViK2Mx?=
 =?utf-8?B?aXlreit4V0FlOEZCT0VWOUxjN2hzMXZ5V1BvdlZ2ai9RVitlb01UdFpXbTJG?=
 =?utf-8?B?bEV6QTgyc0NuY2ZqeUlzeko2SWp3dzN3RHhqWjIvVVBNQjBuSGlpRHdXYUdE?=
 =?utf-8?B?cnpsQjBldkV3ZlVJMlZYT1VuRUZmSUMyeE9MNW5XOTY5WmhwWVhYSW55b3hi?=
 =?utf-8?B?SUgvSkJkTEc5UVFMYktpS0xmWXhlVWN1QzdrSlkzMitySW4xb3d1R29xSkJs?=
 =?utf-8?B?TnEvVWxvOUxDaUhJUFFDMUI1OUJaUE1EQVNVYnF1WXE4QkFyS2xQZmdWVzN0?=
 =?utf-8?B?SXNjZUtWSk1ramIrQUNyUi9WYk1ORnVWNjExRDFnSHlGbzdPdzdjcnlhbXBq?=
 =?utf-8?B?YWRXa0VOU1gwT21zaVFJVzlTUnllSWI2M0M0WjJQL1Byb0M5eCtBSWNNMi9u?=
 =?utf-8?B?M0NqYllMZXB2YWorY1NPNUs2Q2tFSm4wNWhQRWJnTUNCbTRWdFlUSk05Y1Rv?=
 =?utf-8?B?OFBlZFJVOWdsWUxEMTNyQlhsbkhwUkVRMHdYbDJQMlNvM0orcVhkUUtNSmxz?=
 =?utf-8?B?elpRYkZ1WTRVc2dldnliZlQxMWw4dFNKRnY5ZzhFalNadVBqV2dUeGFpaUZh?=
 =?utf-8?B?QndnZFAwaWkwWUh1RzE1d09oYWNsSE5nSnFUWVFpaWNnVmtoendBMjFDR01a?=
 =?utf-8?B?NGs5a0cyL1lvQnBKSi9PUkg3L2MxZWQraVZaR1hJL1NaYWx1NTJ5bnpIYzd5?=
 =?utf-8?B?M2tCY1JjeEQwcTZUajA3WUVQMFpoQmN2eE5hSTcrWGZlOXJKQW9aTTVadll5?=
 =?utf-8?B?R29Ybm05cGpRM0pIUDFtOXJvYUJOWm91eHZDY3BTOUVvZ00wVUpkeGR5dWtE?=
 =?utf-8?B?dWlDR1FYdkFKdG1OQXBMa1AzY1RmV0wyU0thRitPQlJEbEd6M2xuR1FOSzVp?=
 =?utf-8?B?L01PZ1RBc1MwU1QxekY5ckdIcDlKN2U2WGlGNG5JZEs1TnEwaC9DWFgzZ29a?=
 =?utf-8?B?UUU4SDJKKzU2UHcyTE5ZTEw0c0dNWXJpK1o5OHlqVTJ5N3lZaStWTHp3cGlv?=
 =?utf-8?Q?arGd1XDncS/i/54nRcLO6uVA9oXiO4=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d3b5a434-730d-4ae7-7ff2-08da0b604188
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 17:28:47.2139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 83QpjmDeEI0mky6vmyxUDXsUqHV+LB3BZyIyeGClUFJxD+vmIRAwq9wNfje3gYXCQ9PFq8/vInpL33y0Xq4lpD6KdQtGloHVqo5Y4bUZb6N3+gkhAO8I68GImB6v4RCv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7890
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Mar 2022 17:28:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2660

Hi Richard,

On 3/19/22 16:28, Richard Purdie wrote:
> This allows an improved and custmomised switcher for each release
> showing the current doc version, the latest in that series and the
> latest releases for the project overall.
> 

Not sure to understand the reason for this patch?

We anyway cannot fix already-tagged releases, for which 
yocto-autobuilder-helper will checkout the script and handle changes as 
required, why would the transition branch require something 
different/specific?

Cheers,
Quentin

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   documentation/.gitignore                 |   1 +
>   documentation/Makefile                   |   9 +-
>   documentation/sphinx-static/switchers.js | 233 -----------------------
>   3 files changed, 9 insertions(+), 234 deletions(-)
>   delete mode 100644 documentation/sphinx-static/switchers.js
> 
> diff --git a/documentation/.gitignore b/documentation/.gitignore
> index c1e43630d..f7d91141a 100644
> --- a/documentation/.gitignore
> +++ b/documentation/.gitignore
> @@ -1,2 +1,3 @@
>   _build/
>   sphinx/__pycache__/
> +sphinx-static/switchers.js
> \ No newline at end of file
> diff --git a/documentation/Makefile b/documentation/Makefile
> index 564a906e2..433e880c4 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -8,9 +8,16 @@ TRANSITIONS   = $(sort $(patsubst $(SOURCEDIR)/transition/%/index.rst,%,$(wildca
>   
>   .PHONY: Makefile publish transition clean $(TRANSITIONS)
>   
> +sphinx-static/switchers.js.in:
> +	git checkout master sphinx-static/switchers.js.in
> +
> +set_versions.py:
> +	git checkout master set_versions.py
> +
>   transition: $(TRANSITIONS)
>   
> -$(TRANSITIONS):
> +$(TRANSITIONS): sphinx-static/switchers.js.in set_versions.py
> +	./set_versions.py $@
>   	@$(SPHINXBUILD) -M html "$(SOURCEDIR)"/transition/$@/ "$(BUILDDIR)"/$@ $(SPHINXOPTS) $(O) -c "$(SOURCEDIR)"
>   
>   publish: transition
> diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
> deleted file mode 100644
> index e52032ead..000000000
> --- a/documentation/sphinx-static/switchers.js
> +++ /dev/null
> @@ -1,233 +0,0 @@
> -(function() {
> -  'use strict';
> -
> -  var all_versions = {
> -    'dev': 'dev (3.2)',
> -    '3.1.4': '3.1.4',
> -    '3.0.4': '3.0.4',
> -    '2.7.4': '2.7.4',
> -  };
> -
> -  var all_doctypes = {
> -      'single': 'Individual Webpages',
> -      'mega': "All-in-one 'Mega' Manual",
> -  };
> -
> -  // Simple version comparision
> -  // Return 1 if a > b
> -  // Return -1 if a < b
> -  // Return 0 if a == b
> -  function ver_compare(a, b) {
> -    if (a == "dev") {
> -       return 1;
> -    }
> -
> -    if (a === b) {
> -       return 0;
> -    }
> -
> -    var a_components = a.split(".");
> -    var b_components = b.split(".");
> -
> -    var len = Math.min(a_components.length, b_components.length);
> -
> -    // loop while the components are equal
> -    for (var i = 0; i < len; i++) {
> -        // A bigger than B
> -        if (parseInt(a_components[i]) > parseInt(b_components[i])) {
> -            return 1;
> -        }
> -
> -        // B bigger than A
> -        if (parseInt(a_components[i]) < parseInt(b_components[i])) {
> -            return -1;
> -        }
> -    }
> -
> -    // If one's a prefix of the other, the longer one is greater.
> -    if (a_components.length > b_components.length) {
> -        return 1;
> -    }
> -
> -    if (a_components.length < b_components.length) {
> -        return -1;
> -    }
> -
> -    // Otherwise they are the same.
> -    return 0;
> -  }
> -
> -  function build_version_select(current_series, current_version) {
> -    var buf = ['<select>'];
> -
> -    $.each(all_versions, function(version, title) {
> -      var series = version.substr(0, 3);
> -      if (series == current_series) {
> -        if (version == current_version)
> -            buf.push('<option value="' + version + '" selected="selected">' + title + '</option>');
> -        else
> -            buf.push('<option value="' + version + '">' + title + '</option>');
> -
> -        if (version != current_version)
> -            buf.push('<option value="' + current_version + '" selected="selected">' + current_version + '</option>');
> -      } else {
> -        buf.push('<option value="' + version + '">' + title + '</option>');
> -      }
> -    });
> -
> -    buf.push('</select>');
> -    return buf.join('');
> -  }
> -
> -  function build_doctype_select(current_doctype) {
> -    var buf = ['<select>'];
> -
> -    $.each(all_doctypes, function(doctype, title) {
> -      if (doctype == current_doctype)
> -        buf.push('<option value="' + doctype + '" selected="selected">' +
> -                 all_doctypes[current_doctype] + '</option>');
> -      else
> -        buf.push('<option value="' + doctype + '">' + title + '</option>');
> -    });
> -    if (!(current_doctype in all_doctypes)) {
> -        // In case we're browsing a doctype that is not yet in all_doctypes.
> -        buf.push('<option value="' + current_doctype + '" selected="selected">' +
> -                 current_doctype + '</option>');
> -        all_doctypes[current_doctype] = current_doctype;
> -    }
> -    buf.push('</select>');
> -    return buf.join('');
> -  }
> -
> -  function navigate_to_first_existing(urls) {
> -    // Navigate to the first existing URL in urls.
> -    var url = urls.shift();
> -
> -    // Web browsers won't redirect file:// urls to file urls using ajax but
> -    // its useful for local testing
> -    if (url.startsWith("file://")) {
> -      window.location.href = url;
> -      return;
> -    }
> -
> -    if (urls.length == 0) {
> -      window.location.href = url;
> -      return;
> -    }
> -    $.ajax({
> -      url: url,
> -      success: function() {
> -        window.location.href = url;
> -      },
> -      error: function() {
> -        navigate_to_first_existing(urls);
> -      }
> -    });
> -  }
> -
> -  function get_docroot_url() {
> -    var url = window.location.href;
> -    var root = DOCUMENTATION_OPTIONS.URL_ROOT;
> -
> -    var urlarray = url.split('/');
> -    // Trim off anything after '/'
> -    urlarray.pop();
> -    var depth = (root.match(/\.\.\//g) || []).length;
> -    for (var i = 0; i < depth; i++) {
> -      urlarray.pop();
> -    }
> -
> -    return urlarray.join('/') + '/';
> -  }
> -
> -  function on_version_switch() {
> -    var selected_version = $(this).children('option:selected').attr('value');
> -    var url = window.location.href;
> -    var current_version = DOCUMENTATION_OPTIONS.VERSION;
> -    var docroot = get_docroot_url()
> -
> -    var new_versionpath = selected_version + '/';
> -    if (selected_version == "dev")
> -        new_versionpath = '';
> -
> -    // dev versions have no version prefix
> -    if (current_version == "dev") {
> -        var new_url = docroot + new_versionpath + url.replace(docroot, "");
> -        var fallback_url = docroot + new_versionpath;
> -    } else {
> -        var new_url = url.replace('/' + current_version + '/', '/' + new_versionpath);
> -        var fallback_url = new_url.replace(url.replace(docroot, ""), "");
> -    }
> -
> -    console.log(get_docroot_url())
> -    console.log(url + " to url " + new_url);
> -    console.log(url + " to fallback " + fallback_url);
> -
> -    if (new_url != url) {
> -      navigate_to_first_existing([
> -        new_url,
> -        fallback_url,
> -        'https://urldefense.proofpoint.com/v2/url?u=https-3A__www.yoctoproject.org_docs_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=isfW44ZF5kuhyY44oJjXbmrJNH56s7PcZf_DXMb5wvx3gOochEh79xvv4mCES4kQ&s=zUSdVp19IAPikzuZt7DkZZkEB7r83pTjRI3cpZI80as&e= ',
> -      ]);
> -    }
> -  }
> -
> -  function on_doctype_switch() {
> -    var selected_doctype = $(this).children('option:selected').attr('value');
> -    var url = window.location.href;
> -    if (selected_doctype == 'mega') {
> -      var docroot = get_docroot_url()
> -      var current_version = DOCUMENTATION_OPTIONS.VERSION;
> -      // Assume manuals before 3.2 are using old docbook mega-manual
> -      if (ver_compare(current_version, "3.2") < 0) {
> -        var new_url = docroot + "mega-manual/mega-manual.html";
> -      } else {
> -        var new_url = docroot + "singleindex.html";
> -      }
> -    } else {
> -      var new_url = url.replace("singleindex.html", "index.html")
> -    }
> -
> -    if (new_url != url) {
> -      navigate_to_first_existing([
> -        new_url,
> -        'https://urldefense.proofpoint.com/v2/url?u=https-3A__www.yoctoproject.org_docs_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=isfW44ZF5kuhyY44oJjXbmrJNH56s7PcZf_DXMb5wvx3gOochEh79xvv4mCES4kQ&s=zUSdVp19IAPikzuZt7DkZZkEB7r83pTjRI3cpZI80as&e= ',
> -      ]);
> -    }
> -  }
> -
> -  // Returns the current doctype based upon the url
> -  function doctype_segment_from_url(url) {
> -    if (url.includes("singleindex") || url.includes("mega-manual"))
> -      return "mega";
> -    return "single";
> -  }
> -
> -  $(document).ready(function() {
> -    var release = DOCUMENTATION_OPTIONS.VERSION;
> -    var current_doctype = doctype_segment_from_url(window.location.href);
> -    var current_series = release.substr(0, 3);
> -    var version_select = build_version_select(current_series, release);
> -
> -    $('.version_switcher_placeholder').html(version_select);
> -    $('.version_switcher_placeholder select').bind('change', on_version_switch);
> -
> -    var doctype_select = build_doctype_select(current_doctype);
> -
> -    $('.doctype_switcher_placeholder').html(doctype_select);
> -    $('.doctype_switcher_placeholder select').bind('change', on_doctype_switch);
> -
> -    if (ver_compare(release, "3.1") < 0) {
> -      $('#outdated-warning').html('Version ' + release + ' of the project is now considered obsolete, please select and use a more recent version');
> -      $('#outdated-warning').css('padding', '.5em');
> -    } else if (release != "dev") {
> -      $.each(all_versions, function(version, title) {
> -        var series = version.substr(0, 3);
> -        if (series == current_series && version != release) {
> -          $('#outdated-warning').html('This document is for outdated version ' + release + ', you should select the latest release version in this series, ' + version + '.');
> -          $('#outdated-warning').css('padding', '.5em');
> -        }
> -      });
> -    }
> -  });
> -})();
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2644): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_2644&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=isfW44ZF5kuhyY44oJjXbmrJNH56s7PcZf_DXMb5wvx3gOochEh79xvv4mCES4kQ&s=c4JwO4ulmWCUvNf7cVgYgdb-hJY955ob7lZroYQalqc&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_89890470_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=isfW44ZF5kuhyY44oJjXbmrJNH56s7PcZf_DXMb5wvx3gOochEh79xvv4mCES4kQ&s=fkx7Ua5fATrcGS7x9mKIhwjmEZYXo9ZKh0J62bUitSs&e=
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=isfW44ZF5kuhyY44oJjXbmrJNH56s7PcZf_DXMb5wvx3gOochEh79xvv4mCES4kQ&s=K5AsX3XjfLfuAVh9csLO14g9CT8R-wrL9UG1npdX4A8&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

