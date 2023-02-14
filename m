Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8C2C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 10:47:33 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.70])
 by mx.groups.io with SMTP id smtpd.web10.3750.1676371650191030131
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 02:47:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=IeGtE84r;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.105.70, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCclRqqCMfnxWKTgfgIrypbfqalWIS/RVlE4lHUCnT6nNzsBGKAhuEYPtVM5ce6Hn/5XlobxPsIWrucjvRPjR+iG5NA1g3yEcXnd0xzKTJNeS/IReTt1liNBnF2i1zQZ+tQ7Hf76DaHT2ZZc82Wn5WL1O4T2KoCzTwtmj+d6vrRa3KF094RlI4uoK1jtZ+crmOHz2rlJBsRf81gDUipu5ksrdO6kjeLCKRbkhOOWeWNhWxpKgOvthemuehngARMOlhTDQpI1z1S9ZRDDHzDZCIyT48VsyV5f6QXy3RdjDYCNbaxWAbgDwF3y3AtL+bJs+RVJiMqPPTwegUbDZkP4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvdmqYmCz7v/OT9ljieYpNG2kIoP6rlJ19tuP/ehF9o=;
 b=iknCY2XbZkRa7eW0KqGcV2Ny1qzOseN4FpFYLOxW8h2YO/DPl0TIChYZy9l3RkubkxS9J6zUc9kLN3B+5IZJLpy7pgzp6C37uj1ALu13bwMLk1fUPow+UUgvcQSQ3Yg7mrkOhiXJLKXZjXlgV4PVxIv8weuKsY0TtyXYXV3TYMZ34z/DqdBTXCauxrR2hMOQUxoTyDR5QgFKXHZ5qv2AYePXmssYnbgINjd259Qo/a7fiWmIKNTfvdh65ZGBWWxlRewNZpnp+rUQurmDMnDTsMDun+3wbzBemtsyz0WPmJ88Ka8v/lLgvHDGnelb7iupPgIjQ2LbZvdueECWLQPiFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvdmqYmCz7v/OT9ljieYpNG2kIoP6rlJ19tuP/ehF9o=;
 b=IeGtE84rXd0SUZFcBsNGcTgkppXpvCMknsHZMr60bqM1a3xmBSpQKo09cHwAmAvDn5tA3yfGljRvxEwX6WIrQxjf3s6hWvM/21hRDKF8Mfu0WsCE4yBjlDy8dj7vsL/QK9ntPKNfkbgth077SWkr55NHOtkRVv+jpSLgWupeQeio3sxKsBSa0vE3rcRD4c8eAuLPOavk3TybsenPLGqGKUU/mzDLxFbjnR1/i+lf5DakoNfxxiRqziGhR4/wLLgGri46xOxfniWCSwXtX1Ssig33/HpDBtCIPq2VJ76TgeKQN90BVDukIcpW+DvoHQz5Ws8zpqX+CyqJYpt5lDhNqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DU2PR04MB8632.eurprd04.prod.outlook.com (2603:10a6:10:2df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 10:47:26 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%8]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 10:47:26 +0000
Message-ID: <06bc0314-388f-5f8e-3463-6ad8c6e9181f@theobroma-systems.com>
Date: Tue, 14 Feb 2023 11:47:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [docs] [PATCH] ref-manual: classes.rst: add
 python-setuptools3_rust and python_pyo3 classes
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: Tim Orling <ticotimo@gmail.com>, Alex Kiernan <alex.kiernan@gmail.com>
References: <20230214103611.39995-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230214103611.39995-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0001.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::13) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DU2PR04MB8632:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e8094b-1d72-471a-2f75-08db0e78dc41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pnDBXvW6j0cprY3xmQcHK30CwWMJp2hUhYnCXoF0nF0lmcyx4J9q8HJ/gJhoSuvj0TjxoT/bCuPkePaqBHTZv44VToGTeoU40xQcK9hxi14bSAxkeYlaISn41sVpJKDNUs3hu1OD35ZTHvoKE/dLb+V9lX/U2MR/GjrlpSKQTIjBcymBZL5guEmynhY9rPVJvXaWmfOtCTXJmbYY72dSpaYs6gZB4CScVST6Vt+U+1nY9k6K0edwvpTuYHcBWlqWtN2daXEdQI5NwZUNvVwZWb4Sc7xcHdzZoCA0EYd0+j0u9IAUGIHPi6bTOuxSBlpzA4EIU/sUeDl8tkatL+ZOb0aByrK/go2AdAjNjRyIQ+7+/P12wsFXZwN8rill4xbXLa2m8wnpY9xx6oHxYkrzr/erDRQg4vR6re/A3fkIy54aQGWLBToHoHZtfJ/0OTp75xVFxCC2X2h7JSdmScA/4Byrf9Sdi9TogCgtQErkaLMTivGj0B8P8eyTeaqQiDzZS0y+/uSpje/hT+fF5O1oqljNfPkoIBrh7lrijbIyhl7ZwPthTpPWEohVLZk0zglNm3tNcy3u4oYSuzE8iWkNG39OvIDNxBQbV+sFgKQa3+EpjfoXKLOgc/87ugUaRKTklX5rFLyFqUqMqLO7DQHjGbn8bRW1QWOYmuFze2zYVUTQCBMI9EPRyNVcYDEALHPUD2Ij7JlSBANkDjfg0rd2bw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39850400004)(136003)(346002)(366004)(451199018)(31686004)(6512007)(2906002)(5660300002)(36756003)(186003)(44832011)(31696002)(53546011)(6506007)(86362001)(41300700001)(478600001)(6666004)(6486002)(316002)(2616005)(8936002)(66476007)(54906003)(8676002)(66556008)(38100700002)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?KzBCeGlPc2VoYzVlb2cwcHg2Ly9xam83bzVjSFE3S3UwRGgvMHg2KzBOenZV?=
 =?utf-8?B?RVh0TDBISHQzcXNReVV1VWcvaHNGeVhTbStjU214djA5NWdJQThReU1oSkk5?=
 =?utf-8?B?WDZiU3BpU3Z4SXQ0K2pad0U5MWZxeTJqM1doWkxoMDNGbHF6RFdxVFB6UGkw?=
 =?utf-8?B?b0RwS1dEZ01Udytza2hqZWVVZGJXZnkrRVBPSWdhRUp4VXdjUE94U25OV3BC?=
 =?utf-8?B?cndrQ0hwOW5ZYzZ5UjJZNWg4V3lpQXFvNGlZcG9yVnZQQWhNOHZHUVVncC9v?=
 =?utf-8?B?UFpWZGxjTkd3UjBIWDNyV00zQUZiSFBieWFjdXlKWDJoRWxyb2UzTUwyUUZk?=
 =?utf-8?B?SUxnS1RnRC9nUXErQURqdFN3QThaendEcmhlb05HNm5vZDlQN1dOcTc1Wm1N?=
 =?utf-8?B?Y0ZzMjFPUzVLUk1senpubG9sVDJqYnhmT1c0RDNJTlFyb1FlTzNENDR0Tlpl?=
 =?utf-8?B?ck42dHB3RUk3WUxxZmc0M0lBRVdRVC96bFB6K2xCTGQ1VlZGZ2o0Szcwa3JK?=
 =?utf-8?B?S1ZabDhwUHp1TUovS0hGbkx0cGpnKzlsQkh6WU12MEZNczllZnVTeHE5dWEy?=
 =?utf-8?B?M25ZSTlxcWhvUUhwQVB5K1h1T0s3bnZZSEQvVjhOa1BsOHVyemlCRzlTMGFG?=
 =?utf-8?B?cU1GN1RicE5OZjNMMmFTeFFHd0QwdVU1a0MxU2dTSDFOcS9rVWgzc1pSTVg2?=
 =?utf-8?B?Uk9Ua1FONFNnZlc1WGlETWxack5sdVRYSzVaRjVJMVRSVXVnY3JzYmY3bUpG?=
 =?utf-8?B?aW5vVVNxVm8xckw3SDd6YWxsb0VBenlhcHhSOXB2T20wSnZsZlZzd3hDNlBI?=
 =?utf-8?B?cUhRUStST0E5VGJLMjhXQkpxeDdqemM5ejBoTk9MQVlTMyttODRuMkJtVTUy?=
 =?utf-8?B?enBibGw5enB4U1AxT1NpWjhEZFBKcWttZHUrNFkwVXpieFZCRG1EZG02K0s3?=
 =?utf-8?B?S1pYTWFxekxva0duZ0M0dGhEM0lkZEVPd3ROd00vRGtOOHJ3eFFjWXV0Qm1G?=
 =?utf-8?B?UkZ1by8wWk5DRkdGaFFJallpYkp1aWRhbXlpUTFTK3hsK2Jha1huL1V4VVZT?=
 =?utf-8?B?dTJWZDNybDRiblVZZDIxYkdvOHo1UHBNdFg0MDN1TjZ2VXRkTkZFMGlJT0k1?=
 =?utf-8?B?UitFbXVMME1hUXFEMGVRQjVWWkswV09Oblc5dTUwVWE5bUIrTUY4K3d2K1dQ?=
 =?utf-8?B?NGRQNDFZUFp6V0xmUnJEeis4UkZOL0lmaXN0R3ByZWhqZzFxMW9Ud2k4Mkwz?=
 =?utf-8?B?WitxY0pPVHA3V2Y1bUlkekpjN3VuWHM1RGZ2czNXVW5kdUxKQWNsSzduWktw?=
 =?utf-8?B?ckcwL3huOGkvK1Q4QSt4TVRqSnlnaklNYUtkeHJ4UGgrSVFKaElCQkE2WVp5?=
 =?utf-8?B?T3p2eTAwUFFNTVdGUXp3Tm8zcWJYeDVTelN6bkxSbWRmcVN4dEVGekNIWVhH?=
 =?utf-8?B?bkxkVFo4TkU0dWZ0WW1xQlh1TnZpUlorS1NJZkZMOWVFTWxUaFpRS1pjZmw1?=
 =?utf-8?B?QXZ2ZUVsVGlmUlF0cXBLUGY1Zkd4VXprMCtXOVVEbFl4VU51ZlNVOHlEUlo5?=
 =?utf-8?B?N2RnVFdic01HT21JSkwrWlB0d0QySUx3UnhLaEl0cmdtdnlnWVpRdmNvbERU?=
 =?utf-8?B?RUQzempwL1JUTXVDdkUyREhQWUlEOHRwWnd2czIxV2pwR0s3cTFxRTJlWFlS?=
 =?utf-8?B?OFhVMmQ1T3VvRXJxS2Z3ZTFZYVRST0t5WTlJR1RyMlNSSjg4YjNQaXlTK09E?=
 =?utf-8?B?WFMvc0VML2IzWVkyNnVubm00QkpSNGNHc1I0S0Q1bkN1VmlGVXdkWTBFRCtH?=
 =?utf-8?B?dkVkLzVsa25WUnJ2ZU82REgyQWtUbU52REtEOUNoNTRLaDNXN1ZLY2I5b3Fi?=
 =?utf-8?B?M2RxYisvSVEvL01LWThkSnMrTGFENlRjMUY1WUVweU9ZUFBZeE5SamVBeHdG?=
 =?utf-8?B?cnJSU21kalVTTmRwbCtUMEI0dW5qOVc2aTlMeTFWVkNOTXI2WUp5d0gxeUtl?=
 =?utf-8?B?b3d6aGJnUlN6ZUwrQmJpM2JzOG52eUdUaGROYllhN1crbXIrR2tZZkRBaGV5?=
 =?utf-8?B?aW9zR2llRWkzYnovcCt4NUZXdUgzclh1MTBMZGNCdG8xYjk5WS9TV001RzdR?=
 =?utf-8?B?dytrU05IV2d5UkpoYVpLYUc3MTZEMUI0c1ZwUDhsMCtXdFF1WlM4MEUrK2h4?=
 =?utf-8?B?NEhNK3ptd2g2RG9QVUx5MjduN2RHWjJzOFc5YVRkVnZkSFFmNDJJS1hrQU1x?=
 =?utf-8?B?WmdEVmg3TTJXTWtIbm5tbE1zU1l3PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e8094b-1d72-471a-2f75-08db0e78dc41
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 10:47:26.5005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xY+6lKeF8H0FzkPs9Q/Cn87VrAV1EMIV8j/UfR8e6CwJJEXm5/u2Rf6TRp6zkEpANcZjwJIp5BTdUZrHWAWSKAjo9cNetCcs2jNJMR19aiLykxc/0jLlPMDSNzeI50Ei
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8632
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Feb 2023 10:47:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3677

Hi Michael,

On 2/14/23 11:36, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Cc: Tim Orling <ticotimo@gmail.com>
> Cc: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>   documentation/ref-manual/classes.rst | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index b5443c0d0a..2a20e095aa 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -2231,6 +2231,29 @@ The :ref:`ref-classes-python_poetry_core` class enables building Python modules
>   
>   Internally this uses the :ref:`ref-classes-python_pep517` class.
>   
> +.. _ref-classes-python_pyo3:
> +
> +``python_pyo3``
> +===============
> +
> +The :ref:`ref-classes-python_pyo3` class helps make sure that Python extensions
> +written in Rust, built with `PyO3 <https://urldefense.com/v3/__https://pyo3.rs/__;!!OOPJP91ZZw!lUmmEd0Wm4WxY9M9HTZWiO0-ZsqjgcTyYAJUyB67dTareG7k2qSXlVhMahJEHKctv3RUlbC9ktSk6nAqGyaXU0KPVeK04K2IInSKPfUkDa-AOrVgVDTq$ >`__ and
> +:ref:`ref-classes-python-setuptools3_rust`, properly set up the environment
> +for cross compilation.
> +
> +.. _ref-classes-python-setuptools3_rust:
> +
> +``python-setuptools3_rust``
> +===========================
> +
> +The :ref:`ref-classes-python-setuptools3_rust` class enables building Python
> +extensions implemented in Rust with `PyO3 <https://urldefense.com/v3/__https://pyo3.rs/__;!!OOPJP91ZZw!lUmmEd0Wm4WxY9M9HTZWiO0-ZsqjgcTyYAJUyB67dTareG7k2qSXlVhMahJEHKctv3RUlbC9ktSk6nAqGyaXU0KPVeK04K2IInSKPfUkDa-AOrVgVDTq$ >`__, which allows
> +to compile and distribute Python extensions written in Rust as easily
> +as if they were written in C.
> +
> +This class inherits the :ref:`ref-classes-setuptools3` and
> +:ref:`ref-classes-python_pyo3` classes.
> +

I guess one is likely to use python-setuptools3_rust more than 
python_pyo3 no? Is python_pyo3 supposed to be an internal class?

Cheers,
Quentin

