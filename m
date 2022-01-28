Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCE5C433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 19:25:57 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.896.1643397955379510403
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 11:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=dkuiIbAO;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643397955;
  x=1674933955;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=txbkv5m89KFGa5gdpvIrCXcsoXAsbGj2qzDKnB6pirk=;
  b=dkuiIbAOLwJAriZEHA08a1anUTZ211hN3JgU3T5JuJRJAfBA07oZwN5K
   4ZzWokB/R+L7eOPbPtSke5SoJP3sFJx6g0k18fEbDDuAExEkYp8pM94pA
   A7hm/1VIEWe1Hf1O+JwH+4UzxJJfVCgjOZ7R5fS4raPy8AeA/XarLs6vR
   NIzFFdNCTqDGxOgITIwpJT4d9NByg+uRFfnrhcYgO+yxzkI43dlA5HxEM
   B0TmK75P6+G2FsLkQpSeCuEy0EBKBcBuJ0wsPP/joQ/p9Eser/ZtBsV+r
   6JDNqHQ2q93k4qoh1s735vuXH88VsMka/gpalGUwb3MYjokLHZS+nuHR1
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "michael.opdenacker@bootlin.com" <michael.opdenacker@bootlin.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] ref-manual: add usage details about ccache.bbclass
Thread-Topic: [docs] [PATCH] ref-manual: add usage details about
 ccache.bbclass
Thread-Index: AQHYFF+aCz+2b2k+O0+4KLJntNPIOax4z5kg
Date: Fri, 28 Jan 2022 19:25:53 +0000
Message-ID: <2d54f0a86eed433f95fb22b03ea8117c@axis.com>
References: <16CE7A27ABB38F4D.29885@lists.yoctoproject.org>
 <b2479910-b50c-2f06-0290-72cb953f0963@bootlin.com>
In-Reply-To: <b2479910-b50c-2f06-0290-72cb953f0963@bootlin.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Jan 2022 19:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2451

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkb2NzQGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcgPGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIE1pY2hh
ZWwgT3BkZW5hY2tlciB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTZW50OiBkZW4gMjgg
amFudWFyaSAyMDIyIDE2OjU2DQo+IFRvOiBkb2NzQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4g
U3ViamVjdDogUmU6IFtkb2NzXSBbUEFUQ0hdIHJlZi1tYW51YWw6IGFkZCB1c2FnZSBkZXRhaWxz
IGFib3V0IGNjYWNoZS5iYmNsYXNzDQo+IA0KPiBPbiAxLzI4LzIyIDE2OjUzLCBNaWNoYWVsIE9w
ZGVuYWNrZXIgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgd3JvdGU6DQo+ID4gU2lnbmVkLW9m
Zi1ieTogTWljaGFlbCBPcGRlbmFja2VyIDxtaWNoYWVsLm9wZGVuYWNrZXJAYm9vdGxpbi5jb20+
DQo+ID4gLS0tDQo+ID4gIGRvY3VtZW50YXRpb24vcmVmLW1hbnVhbC9jbGFzc2VzLnJzdCB8IDEz
ICsrKysrKysrKy0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kb2N1bWVudGF0aW9uL3JlZi1tYW51
YWwvY2xhc3Nlcy5yc3QgYi9kb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvY2xhc3Nlcy5yc3QNCj4g
PiBpbmRleCBkOTA2NWIzNjE5Li45NDkyMTdiZjQyIDEwMDY0NA0KPiA+IC0tLSBhL2RvY3VtZW50
YXRpb24vcmVmLW1hbnVhbC9jbGFzc2VzLnJzdA0KPiA+ICsrKyBiL2RvY3VtZW50YXRpb24vcmVm
LW1hbnVhbC9jbGFzc2VzLnJzdA0KPiA+IEBAIC0yNzQsMTAgKzI3NCwxNSBAQCBzc3RhdGUgcmUt
dXNlLiBJbiBvcmRlciB0byBmdW5jdGlvbiwgdGhpcyBjbGFzcyByZXF1aXJlcyB0aGUNCj4gPg0K
PiA+ICBUaGUgYGBjY2FjaGVgYCBjbGFzcyBlbmFibGVzIHRoZSBDL0MrKyBDb21waWxlciBDYWNo
ZSBmb3IgdGhlIGJ1aWxkLg0KPiA+ICBUaGlzIGNsYXNzIGlzIHVzZWQgdG8gZ2l2ZSBhIG1pbm9y
IHBlcmZvcm1hbmNlIGJvb3N0IGR1cmluZyB0aGUgYnVpbGQuDQo+ID4gLUhvd2V2ZXIsIHVzaW5n
IHRoZSBjbGFzcyBjYW4gbGVhZCB0byB1bmV4cGVjdGVkIHNpZGUtZWZmZWN0cy4gVGh1cywgaXQN
Cj4gPiAtaXMgcmVjb21tZW5kZWQgdGhhdCB5b3UgZG8gbm90IHVzZSB0aGlzIGNsYXNzLiBTZWUN
Cj4gPiAtaHR0cHM6Ly9jY2FjaGUuc2FtYmEub3JnLyBmb3IgaW5mb3JtYXRpb24gb24gdGhlIEMv
QysrIENvbXBpbGVyDQo+ID4gLUNhY2hlLg0KPiA+ICsNCj4gPiArU2VlIGh0dHBzOi8vY2NhY2hl
LnNhbWJhLm9yZy8gZm9yIGluZm9ybWF0aW9uIG9uIHRoZSBDL0MrKyBDb21waWxlcg0KPiA+ICtD
YWNoZSwgYW5kIHRoZSA6b2VfZ2l0OmBjY2FjaGUuYmJjbGFzcyA8L29wZW5lbWJlZGRlZC1jb3Jl
L3RyZWUvbWV0YS9jbGFzc2VzL2NjYWNoZS5iYmNsYXNzPmANCj4gPiArZmlsZSBmb3IgZGV0YWls
cyBhYm91dCBob3cgdG8gZW5hYmxlIHRoaXMgbWVjaGFuaXNtIGluIHlvdXIgY29uZmlndXJhdGlv
bg0KPiA+ICtmaWxlLCBob3cgdG8gZGlzYWJsZSBpdCBmb3Igc3BlY2lmaWMgcmVjaXBlcywgYW5k
IGhvdyB0byBzaGFyZSBgYGNjYWNoZWBgDQo+ID4gK2ZpbGVzIGJldHdlZW4gYnVpbGRzLg0KPiA+
ICsNCj4gPiArSG93ZXZlciwgdXNpbmcgdGhlIGNsYXNzIGNhbiBsZWFkIHRvIHVuZXhwZWN0ZWQg
c2lkZS1lZmZlY3RzLiBUaHVzLCB1c2luZw0KPiA+ICt0aGlzIGNsYXNzIGlzIG5vdCByZWNvbW1l
bmRlZC4NCg0KSXQgd291bGQgcHJvYmFibHkgYmUgYSBnb29kIGlkZWEgdGhlbiB0byBleHBsYWlu
IHdoYXQgdGhvc2UgDQp1bmV4cGVjdGVkIHNpZGUtZWZmZWN0cyBhcmUsIG9yIHlvdSBsZWF2ZSB0
aGUgcmVhZGVyIGhhbmdpbmcuIA0KVGhhdCB3YXkgaXQgZWFzaWVyIHRvIG1ha2UgYW4gZWR1Y2F0
ZWQgY2hvaWNlIHdoZXRoZXIgdXNpbmcgDQp0aGUgY2xhc3MgaXMgYSBnb29kIGlkZWEgb3Igbm90
Lg0KDQo+IEkgZ3Vlc3MgaXQgY291bGQgYmUgY29udHJvdmVyc2lhbCB0byBhZGQgdXNhZ2UgZGV0
YWlscyBmb3IgYSBjbGFzcyB0aGF0DQo+IHRoZSBtYW51YWwgcmVjb21tZW5kcyBub3QgdG8gdXNl
LiBPbiB0aGUgb3RoZXIgaGFuZCwgaWYgd2Uga2VlcCB0aGlzDQo+IGNsYXNzIGluIG9lLWNvcmUs
IHRoYXQgbXVzdCBiZSBiZWNhdXNlIHRoZXJlIGFyZSBzb21lIHBlb3BsZSB3aG8gc3RpbGwNCj4g
d2FudCB0byB1c2UgaXQuIFRoZW4sIGl0IG1ha2VzIHNlbnNlIHRvIGhhdmUgdXNhZ2UgZGV0YWls
cyBJTUhPLg0KPiANCj4gQW55IHRob3VnaHRzIGFib3V0IHRoaXM/DQo+IA0KPiBDaGVlcnMNCj4g
TWljaGFlbC4NCg0KLy9QZXRlcg0KDQo=

