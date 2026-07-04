const ALLOWED_TAGS = new Set(['BR', 'DIV', 'SPAN'])

function isMentionToken(element: HTMLElement): boolean {
  return element.tagName === 'SPAN' && element.classList.contains('mention-token') && !!element.dataset.id
}

function sanitizeNode(node: Node): Node | null {
  if (node.nodeType === Node.TEXT_NODE) {
    return document.createTextNode(node.textContent || '')
  }

  if (node.nodeType !== Node.ELEMENT_NODE) {
    return null
  }

  const element = node as HTMLElement
  if (!ALLOWED_TAGS.has(element.tagName)) {
    const fragment = document.createDocumentFragment()
    element.childNodes.forEach((child) => {
      const sanitizedChild = sanitizeNode(child)
      if (sanitizedChild) {
        fragment.appendChild(sanitizedChild)
      }
    })
    return fragment
  }

  if (element.tagName === 'BR') {
    return document.createElement('br')
  }

  if (isMentionToken(element)) {
    const span = document.createElement('span')
    span.className = 'mention-token'
    span.dataset.id = element.dataset.id!
    span.contentEditable = 'false'
    span.textContent = element.textContent || ''
    return span
  }

  if (element.tagName === 'SPAN') {
    return document.createTextNode(element.textContent || '')
  }

  const cloned = document.createElement('div')
  element.childNodes.forEach((child) => {
    const sanitizedChild = sanitizeNode(child)
    if (sanitizedChild) {
      cloned.appendChild(sanitizedChild)
    }
  })
  return cloned
}

export function sanitizeDraftHtml(html: string | undefined): string {
  if (!html) {
    return ''
  }

  const template = document.createElement('template')
  template.innerHTML = html

  const fragment = document.createDocumentFragment()
  template.content.childNodes.forEach((child) => {
    const sanitizedChild = sanitizeNode(child)
    if (sanitizedChild) {
      fragment.appendChild(sanitizedChild)
    }
  })

  const container = document.createElement('div')
  container.appendChild(fragment)
  return container.innerHTML
}
